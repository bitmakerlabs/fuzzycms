module Loggable
  def acts_as_logable
    has_many :activities, :as => :loggable
    include InstanceMethods
  end

  module ClassMethods
  end

  module InstanceMethods
    def loggable?
      true
    end
  end
end

ActiveRecord::Base.extend Loggable