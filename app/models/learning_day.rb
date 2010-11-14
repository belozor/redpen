class LearningDay < ActiveRecord::Base
  has_many :lessons
  belongs_to :school_class
  default_scope :order=>'date'
  validates_uniqueness_of :date, :scope => :school_class_id, :message=>'Учебный день с этой датой уже существует!'

  def use_day_template(template_id)
    day_template = DayTemplate.find(template_id)
    day_template.template_lessons.each do |lesson_template|
      lesson = self.lessons.build
      lesson.course = lesson_template.course
      lesson.start_time = lesson_template.start_time
      lesson.end_time = lesson_template.end_time
      lesson.save
    end
  end

end
