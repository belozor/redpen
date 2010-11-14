class CreateTemplateLessons < ActiveRecord::Migration
  def self.up
    create_table :template_lessons do |t|
      t.time :start_time
      t.time :end_time
      t.references :course
      t.references :day_template

      t.timestamps
    end
  end

  def self.down
    drop_table :template_lessons
  end
end
