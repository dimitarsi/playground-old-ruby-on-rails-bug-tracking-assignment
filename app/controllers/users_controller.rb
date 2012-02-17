class UsersController < ApplicationController
  skip_before_filter :require_login, :only => [:authenticate, :create]
  def create
    new_user = User.new(params[:user])
    if(new_user.save) then
      flash[:reg_success] = "Усяпешна регистрация"
      Dir.mkdir ['public/data/user_', new_user.id].join
      redirect_to login_signin_path
    else 
      flash[:reg_fail]   = "Моля попълнете коректно формата за регистрация!"
      redirect_to login_register_path
    end
  end
  
  def authenticate
    @param = User.where(:name => params[:uname],
                        :password => params[:upass])
    if @param.any? then
        session[:user] = @param.first
        redirect_to users_path
    else
        redirect_to login_signin_path
    end
  end
  
  def index
    @user = User.where(:id => session[:user].id).first
    render 'upload'
  end
  
  def show
    @user_id = params[:id] || session[:user].id
    @user = User.where(:id => @user_id).first
    
    if !@user
      flash[:user_not_found] = "Потребите #{@user_id} не е намерен!"
      redirect_to users_path
    else 
      render 'upload'
    end
    
  end

end
