class AddReferencesLearningDays < ActiveRecord::Migration
  def self.up
    add_column :learning_days, :school_class_id, :integer
  end
  def self.down
    remove_column :learning_days, :school_class_id
  end
end
