class HomeController < ApplicationController
  def index
    if !current_user
#      redirect_to login_url
      
    else
      @user = User.find(current_user.id)
      
    end
    @school_classes = SchoolClass.all
    if params[:week].to_i >0
      @week_number = params[:week]
    end
  end

end
