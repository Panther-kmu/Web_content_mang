class HomeController < ApplicationController
  #session[:user] = nil
  def index
    session[:greeting] = "Hello"
  end

  def result
    @result = params[:first].to_i + params[:second].to_i
  end

  def login
    email_array = params[:email].split(/@/)
    @name = email_array[0]
  end

  def new
  end

  def signup
  end

  def signout
    session[:user]=nil
    redirect_to '/'
  end
  

  def signin  
    return if !params.key?(:email)
    @user = User.find_by_email(params[:email].to_s.downcase.strip)
    @confirm_user = @user.authenticate(params[:password])
    if @confirm_user
      session[:user]= @confirm_user
      redirect_to :controller=>'home',:action=>'new'
    end
  end

  def store
    @user = User.new(name: params[:name],email: params[:email],password:params[:password],password_confirmation:params[:password_confirm])
    if @user.valid?
      @user.save
      session[:user] = @user
      redirect_to :controller=>'users',:action=>'new'
    else
      redirect_to :controller=>'home',:action=>'store'
    end
  end

end
