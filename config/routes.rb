Rails.application.routes.draw do
  root 'main#home'
  
  post 'search' => 'main#search'
end
