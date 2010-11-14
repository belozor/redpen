class SchoolClass < ActiveRecord::Base

  has_many :school_classes_users
  has_many :users, :through => :school_classes_users
  has_many :learning_days, :foreign_key => "school_class_id"
  has_many :day_templates
end
