Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'table' => 'table#show'
  get '/runner', to: 'posts#runner'
end
