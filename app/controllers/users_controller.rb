class UsersController < ApplicationController

  before_filter :require_admin, :only => [:index, :new, :create, :edit, :update]
  before_filter :require_user, :only => [:show]

    def index
        @users = User.find(:all)

        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @users }
        end
    end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Пользователь зарегистрирован!"
      redirect_to user_url(@user)
    else
      render :action => :new
    end
  end

  def show
    @user = User.find(params[:id])
#    @user = @current_user
  end

  def edit
    @user = User.find(params[:id])
  end
  def select_school_classes
    @user= current_user
    @school_classes = @user.school_classes.find(:all)
  end

  def update
    @user = User.find(params[:id]) # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = params[:user][:school_class_ids] #"Аккаунт обновлён!"
      redirect_to user_url(@user)
    else
      render :action => :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  
end
