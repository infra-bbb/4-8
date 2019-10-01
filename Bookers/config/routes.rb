Rails.application.routes.draw do
  resources :books
  root :to => 'books#top'
  get 'index', to: 'books#index'
  get 'index/:id', to: 'books#show'
  get 'index/:id/edit' => 'books#edit'
  get 'books/:id/edit' => 'books#edit', as: 'edit_books'
  patch 'index/:id' => 'books#update', as: 'update_books'
  delete 'books/:id' => 'books#destroy', as: 'destroy_books'
  
  # get 'books/show'
  # get 'books/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
