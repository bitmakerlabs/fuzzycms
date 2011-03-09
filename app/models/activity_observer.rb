class ActivityObserver < ActiveRecord::Observer
  observe :article
  
  def after_create(model)
    Activity.create!(:user => model.user, :model => model.class.name, :action => "created", :name => model.name)
  end
end
