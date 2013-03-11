class SiteController < ApplicationController
layout false
  def home
    @site = session[:site]
    @page = Page.find_by_site_id(@site.id)
  end

end
