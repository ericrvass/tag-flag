require 'web_searcher'
require 'uri'

class MainController < ApplicationController
  def home
    
  end
  
  def search
    if !params[:selectors].blank? && !params[:url].blank? && params[:url] =~ URI::regexp
      selectors = params[:selectors]
      @task_id = WebSearcher.find_selectors_in_site(selectors, params[:url])
      respond_to do |format|
        format.js
      end
    else
      #TODO: error handling
      head :ok, :content_type => 'text/html'
    end
  end
  
  def check_progress
    if !params[:id].blank?
      t = client.tasks.get(params[:id])
      result = {
          :status => t.status,
          :code_name => t.code_name,
          :created_at => t.created_at,
          :duration => t.duration
        }
      puts result.to_json
      render json: result
    else
      render json: {:status => 'error'}
    end
  end
  
  def search_result
    if !params[:id].blank?
      json_result = client.tasks.log(params[:id]);
      @result = JSON.parse(json_result)
    else
      #TODO: error handling
      head :ok, :content_type => 'text/html'
    end
  end
end
