Rails.application.routes.draw do
  root 'main#home'
  
  post 'search' => 'main#search'
  
  namespace :api, :path => "", :constraints => {:subdomain => "api"} do
    namespace :v1 do
      post 'html_search' => 'search#html'
    end
  end
end
