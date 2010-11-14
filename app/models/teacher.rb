class Teacher < ActiveRecord::Base
 set_table_name "users"

 has_many :school_classes_teachers
 has_many :school_classes, :through => :school_classes_teachers
end
