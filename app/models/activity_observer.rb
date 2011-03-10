class ActivityObserver < ActiveRecord::Observer
  observe :article, :comment
  
  def after_create(model)
    save_action(model, "created")
  end

  def after_update(model)
    save_action(model, "updated")
  end

  private
  def save_action(model, action)
    Activity.create!(:action => action, :logable => model)
  end
end
