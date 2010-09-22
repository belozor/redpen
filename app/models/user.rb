class User < ActiveRecord::Base
    attr_accessible :login, :email, :password, :password_confirmation, :userrole, :fname, :sname, :surname, :position

    acts_as_authentic
 
 has_many :flights_users
 has_many :flights, :through => :flights_users

# do |c|
#      c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
#    end # block optional
end
