﻿class LoginController < ApplicationController
  skip_before_filter :require_login, :only => [:register, :signin]
  
  def register
    @user = User.new
  end

  def signin
    @ses = session
    if @ses[:user] then
      redirect_to users_path
    end
  end

  def signout
    session[:user] = nil
    flash[:thank_you] = "Благодаря че използвахте услугите на ЪпЕмОу"
    redirect_to login_signin_path
  end
end
