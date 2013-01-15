require 'test/unit'
require './models/presentation'

include DRUG

class PresentationTest < Test::Unit::TestCase
  
  def test_postpone_and_cancel
    presentation = Presentation.new
    presentation.postpone
    assert_equal "postponed", presentation.status
    presentation.cancel_postponement
    assert_equal "presenting", presentation.status
  end
  
  def test_lead_speaker
    leon = Person.new(1)
    antoni = Person.new(2)
    zdzislaw = Person.new(3)
    
    presentation = Presentation.new
    presentation.addSpeaker(leon)
    presentation.addSpeaker(antoni)
    presentation.addSpeaker(zdzislaw)
    
    assert_equal leon, presentation.lead_speaker
    
  end 
  
end