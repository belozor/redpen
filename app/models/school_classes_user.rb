class SchoolClassesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :school_class
end
