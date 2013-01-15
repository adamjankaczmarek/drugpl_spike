require 'test/unit'
require './models/event'
require './models/drug_site'
require './models/person'

include DRUG

class EventTest < Test::Unit::TestCase

  def test_closest_upcoming
    eventManager = DrugSite.new
    
    event1 = Event.new("2012-12-12")
    eventManager.addEvent(event1)
    event2 = Event.new("2013-12-12")
    eventManager.addEvent(event2)
    event3 = Event.new("2013-03-12")
    eventManager.addEvent(event3)
    
    upcoming = eventManager.getClosestUpcoming()
    
    assert_equal event3, upcoming
  end
  
  def test_attend_unattend
    event = Event.new("2013-12-13")
    leon = Person.new(1)
    witold = Person.new(2)
    
    karmaPoints = leon.karma
    event.attend(leon)
    event.attend(witold)
    
    assert_includes event.attendants, leon
    assert_equal karmaPoints + 10, leon.karma
    
    event.unattend(leon)
    assert_equal false, event.attendants.include?(leon) 
    assert_equal karmaPoints, leon.karma
    
    presentations_by_leon = event.getPresentationsBy(leon.id)
    presentations_by_witold = event.getPresentationsBy(witold.id)
    
    assert_equal "postponed", presentations_by_leon.first.status
    assert_equal "presenting", presentations_by_witold.first.status
  end
  
end