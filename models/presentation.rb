module DRUG
  class Presentation
    def initialize
      @status = "presenting"
      @speakers = []
    end
    
    def status
      @status
    end
    
    def postpone
      @status = "postponed"
    end
    
    def cancel_postponement
      @status = "presenting"
    end
    
    def addSpeaker(user)
      @speakers << user
    end
    
    def lead_speaker
      @speakers.first
    end
    
  end    
end