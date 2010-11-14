class DayTemplate < ActiveRecord::Base
  belongs_to :school_class
  has_many :template_lessons
end
