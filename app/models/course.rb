class Course < ActiveRecord::Base
  has_many :lessons
  has_many :template_lessons
end
