class HomeController < ApplicationController

  def index
  end



  def new
    @u_id = session[:user].id
    s = Array.new()
    Site.all.each do |x|
      if x.user_id == @u_id
        s = s<<x
      end
    end
    @sites = s 
  end

  def site 
    if params[:id]!=nil
      @site = Site.find(params[:id])
      session[:site]=@site
    else
      @site = session[:site]
    end
    pages = Array.new()
    Page.all.each do |p|
      if p.site_id == @site.id
        pages = pages<<p
      end
    end
    @pages = pages
  end
  def add_page
    @site=session[:site]
    @page = Page.new(title: params[:page_title],content: params[:content],site_id:@site.id)
    if @page.valid?
      @page.save
    end
    redirect_to :controller=>'home',:action=>'site'
  end

  def page
    @site=Site.find params[:id]
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
      @sites = Site.all
      redirect_to :controller=>'home',:action=>'new'
    end
  end

  def store
    @user = User.new(name: params[:name],email: params[:email],password:params[:password],password_confirmation:params[:password_confirm])
    if @user.valid?
      @user.save
      session[:user] = @user
      redirect_to :controller=>'home',:action=>'signin'
    else
      redirect_to :controller=>'home',:action=>'store'
    end
  end
  #creation of Sites

  def create_site
  end

  def store_site
    @site = Site.new(title:params[:title],domain:params[:domain],user_id:session[:user].id) 
    Rails.logger.info"++++++++++++++++++#{@site}+++++++++++++"
    @site.save
    @sites = Site.all
    redirect_to :controller=>'home',:action=>'new'
  end

end
