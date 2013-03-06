class UsersController < ApplicationController
  def new
  end

  def store
    @user = User.new(name: params[:name],email: params[:email],password:params[:password],password_confirmation:params[:password_confirm])
    if @user.valid?
     @user.save
    end
  end

end
