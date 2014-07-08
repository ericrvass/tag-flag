require 'web_searcher'
require 'uri'

class API::V1::SearchController < ApplicationController
  respond_to :json
  
  def html
    puts params[:json]
    if !params[:html_block].blank? && !params[:url].blank? && params[:url] =~ URI::regexp
      html_items = params[:html_block]
      @result = WebSearcher.find_html_in_site_basic(html_items, params[:url])
      respond_to do |format|
        format.json { render :json => @result.to_json }
      end
    else
      #TODO: error handling
      render :json => {:error => "Bad Request"}.to_json
    end
  end
  
  def selector
    puts params[:json]
    if !params[:selector].blank? && !params[:url].blank? && params[:url] =~ URI::regexp
      selectors = params[:selector]
      @result = WebSearcher.find_selectors_in_site(selectors, params[:url])
      respond_to do |format|
        format.json { render :json => @result.to_json }
      end
    else
      #TODO: error handling
      render :json => {:error => "Bad Request"}.to_json
    end
  end
  
  def status
    if !params[:id].blank?
      t = client.tasks.get(params[:id])
      result = {
          :status => t.status,
          :code_name => t.code_name,
          :created_at => t.created_at,
          :duration => t.duration
        }
      render json: result
    else
      #TODO: error handling
      render json: {:error => "Bad Request"}.to_json
    end
  end
  
  def result
    if !params[:id].blank?
      result = client.tasks.log(params[:id]);
      render json: result
    else
      #TODO: error handling
      render json: {:error => "Bad Request"}.to_json
    end
  end
end