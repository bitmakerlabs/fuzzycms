module Logable
  def acts_as_logable
    has_many :activities, :as => :logable
    include InstanceMethods
  end
  
  module InstanceMethods
    def logable?
      true
    end
  end
end

ActiveRecord::Base.extend Logable