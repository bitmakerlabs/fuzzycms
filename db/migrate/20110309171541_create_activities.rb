class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string   :action
      t.references  :logable, :polymorphic => true

      t.timestamps
    end
  end

  def self.down
    drop_table :activities
  end
end
