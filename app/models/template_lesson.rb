class TemplateLesson < ActiveRecord::Base
  belongs_to :course
  belongs_to :day_template
  default_scope :order=>"strftime('%H:%M', start_time)" 
end
