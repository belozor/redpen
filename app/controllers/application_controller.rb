# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
 # не писать в логи пароли.
  filter_parameter_logging :password, :password_confirmation
  # А вот эти методы сделать видимыми из шаблонов.
  helper_method :current_user_session, :current_user
  protect_from_forgery :only => [:update, :destroy]
#  skip_before_filter :verify_authenticity_token

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      unless current_user
        store_location
        flash[:notice] = "Вы должны быть зарегистрированы."
        redirect_to new_user_session_url
        return false
      end
    end

    def require_admin
      unless current_user != nil && current_user.userrole == 'admin'
        store_location
        flash[:notice] = "У вас не хватает прав."
        redirect_to root_url
        return false
      end
    end

    def require_teacher_or_admin
      unless current_user != nil && (current_user.userrole == 'admin' ||current_user.userrole == 'teacher')
        store_location
        flash[:notice] = "У вас не хватает прав."
        redirect_to root_url
        return false
      end
    end

    def require_teacher
      unless current_user != nil && (current_user.userrole == 'teacher')
        store_location
        flash[:notice] = "У вас не хватает прав."
        redirect_to root_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "Выйдите из системы, чтобы увидеть эту страницу"
        redirect_to account_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end


  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
#  protect_from_forgery # :secret => '81fada8091ae0272a0ff78af28e3b041'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
