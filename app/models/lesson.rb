class Lesson < ActiveRecord::Base
  belongs_to :learning_day
  belongs_to :course
  has_one :home_task, :dependent => :destroy
  default_scope :order=>"strftime('%H:%M', start_time)" 

  def hometask
    if self.home_task
        content =  self.home_task.content.gsub("\n","<br/>")
    else
      nil
    end
  end

  def starttime
    self.start_time.strftime("%H:%M")
  end

  def endtime
    self.end_time.strftime("%H:%M")
  end
end
