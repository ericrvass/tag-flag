require 'web_searcher'
require 'uri'

class API::V1::SearchController < ApplicationController
  respond_to :json
  
  def html
    puts params[:json]
    if !params[:html_block].blank? && !params[:url].blank? && params[:url] =~ URI::regexp
      html_items = params[:html_block]
      @result = WebSearcher.find_html_in_site(html_items, params[:url])
      respond_to do |format|
        format.json { render :json => @result.to_json }
      end
    else
      #TODO: error handling
      render :json => {:error => "Bad Request"}.to_json
    end
  end
  
end