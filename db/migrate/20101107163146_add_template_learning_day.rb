class AddTemplateLearningDay < ActiveRecord::Migration
  def self.up
    add_column :learning_days, :day_template_id, :integer
  end
  def self.down
    remove_column :learning_days, :day_template_id
  end
end
