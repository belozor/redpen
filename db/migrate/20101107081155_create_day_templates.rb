class CreateDayTemplates < ActiveRecord::Migration
  def self.up
    create_table :day_templates do |t|
      t.string :name
      t.references :school_class

      t.timestamps
    end
  end

  def self.down
    drop_table :day_templates
  end
end
