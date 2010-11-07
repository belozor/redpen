class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.references :learning_day
      t.references :course
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
