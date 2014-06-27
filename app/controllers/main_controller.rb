require 'web_searcher'
require 'uri'

class MainController < ApplicationController
  def home
    
  end
  
  def search
    if !params[:html_block].blank? && !params[:url].blank? && params[:url] =~ URI::regexp
      html_items = params[:html_block]
      @result = WebSearcher.find_html_in_site(html_items, params[:url])
      respond_to do |format|
        format.js
      end
    else
      #TODO: error handling
      head :ok, :content_type => 'text/html'
    end
  end
end
