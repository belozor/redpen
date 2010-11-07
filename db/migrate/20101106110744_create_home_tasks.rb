class CreateHomeTasks < ActiveRecord::Migration
  def self.up
    create_table :home_tasks do |t|
      t.string :content
      t.references :lesson

      t.timestamps
    end
  end

  def self.down
    drop_table :home_tasks
  end
end
