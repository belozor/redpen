class CreateSchoolClassesUsers < ActiveRecord::Migration
  def self.up
    create_table :school_classes_users do |t|
      t.integer :user_id
      t.integer :school_class_id
      t.timestamps
    end
  end

  def self.down
    drop_table :school_classes_users
  end
end
