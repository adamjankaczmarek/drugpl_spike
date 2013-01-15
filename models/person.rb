module DRUG
  class Person
    
    def initialize(id)
        @id = id
        @karma = 20
        @publicized = false
    end    
    
    def publicize
      @publicized = true
    end
    
    def unpublicize
      @publicized = false
    end
    
    def publicized
      @publicized
    end
    
    def id
      @id
    end
    
    def karma
      @karma
    end
  
    def increaseKarma(value)
      @karma += value
    end
  
    def decreaseKarma(value)
      @karma -= value
    end
  end    
end