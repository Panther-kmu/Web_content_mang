class HomeController < ApplicationController
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
end
