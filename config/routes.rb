Rails.application.routes.draw do
  root 'main#home'
  
  post 'search' => 'main#search'
  get 'search_result/:id' => 'main#search_result'
  get 'check_progress/:id' => 'main#check_progress'

  namespace :api, :path => "", :constraints => {:subdomain => "api"} do
    namespace :v1 do
      post 'html_search' => 'search#html'
      post 'selector_search' => 'search#selector'
      get 'result/:id' => 'search#result'
      get 'status/:id' => 'search#status'
    end
  end
end
