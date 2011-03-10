class ActivityObserver < ActiveRecord::Observer
  observe :article
  
  def after_create(model)
    Activity.create!(:action => "created", :logable => model)
  end
end
