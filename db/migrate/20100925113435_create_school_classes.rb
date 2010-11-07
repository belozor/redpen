class CreateSchoolClasses < ActiveRecord::Migration
  def self.up
    create_table :school_classes do |t|
      t.integer :number
      t.string :letter

      t.timestamps
    end
  end

  def self.down
    drop_table :school_classes
  end
end
