class StaticPagesController < ApplicationController
  #layout false
  def home
    @site_domain = request.env["SERVER_NAME"]
    @site = Site.find_by_domain(@site_domain)
    if @site == nil
      redirect_to :controller=>'home',:action=>'signup'
    else
      session[:site] = @site
      redirect_to :controller=>'site',:action=>'home'
    end
  end

  def signin

  end

  def signup

  end

  def help
  end
end
