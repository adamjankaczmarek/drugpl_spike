module DRUG
  class Event
    
    def initialize(date)
      @date = date
      @attendants = []
      @presentations = Hash.new
    end
    
    def attend(user)
      user.increaseKarma(10)
      @attendants << user
      @presentations[user.id] = []
      @presentations[user.id] << Presentation.new
    end
  
    def unattend(user)
      user.decreaseKarma(10)
      @attendants.delete(user)
      @presentations[user.id].each do |presentation|
        presentation.postpone
      end 
      
    end
    
    def attendants
      @attendants
    end
    
    def getPresentationsBy(user_id)
      @presentations[user_id]
    end
  
  end    
end