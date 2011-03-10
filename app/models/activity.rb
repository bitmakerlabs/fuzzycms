class Activity < ActiveRecord::Base
  belongs_to :logable, :polymorphic => true
  
end
