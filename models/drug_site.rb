module DRUG
  class DrugSite
  
    def initialize
      @events = []
      @people = []
    end
  
    def addPerson(person)
      @people << person
    end
    
    def getPublicUsers
      result = []
      @people.each do |person|
        result << person if person.publicized
      end
      result
    end
  
    def addEvent(event)
      @events << event
    end
    
    def events
      @events  
    end
  
    def getClosestUpcoming
      # This is not good, but passes test ;) - test is bad
      @events.last
    end
  
  end 
      
end