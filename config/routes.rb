Rails.application.routes.draw do
  root "articles#index"

  resources :articles do #cria comments como um nested resource dentro de articles
    resources:comments 
  end
end
