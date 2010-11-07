class User < ActiveRecord::Base
    attr_accessible :login, :email, :password, :password_confirmation, :userrole, :fname, :sname, :surname, :position

    acts_as_authentic
 
 has_many :school_classes_users
 has_many :school_classes, :through => :school_classes_users

# do |c|
#      c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
#    end # block optional
end
