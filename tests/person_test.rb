require 'test/unit'
require './models/drug_site'
require './models/person'

include DRUG

class EventTest < Test::Unit::TestCase

  def test_membership_status
    personManager = DrugSite.new
    leon = Person.new(1)
    personManager.addPerson(leon)
    # default - non public 
    assert_equal false, leon.publicized
    # publicize - you're visible
    leon.publicize()
    assert_equal true, leon.publicized 
    assert_includes personManager.getPublicUsers(), leon
    # unpublicize - as in the beginning
    leon.unpublicize()
    assert_equal false, leon.publicized
    assert_equal false, personManager.getPublicUsers().include?(leon)
  end
  
end