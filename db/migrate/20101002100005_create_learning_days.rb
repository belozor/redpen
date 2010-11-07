class CreateLearningDays < ActiveRecord::Migration
  def self.up
    create_table :learning_days do |t|
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :learning_days
  end
end
