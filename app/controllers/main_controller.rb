require 'web_searcher'

class MainController < ApplicationController
  def home
    
  end
  
  def search
    html_items = params[:html_block]
    @result = WebSearcher.find_html_in_site(html_items, params[:url])
    respond_to do |format|
      format.js
    end
  end
end
