Rails.application.routes.draw do
  
  root "homes#top"
  get 'help' => "homes#help"
  
  resources :tasks, only:[:show, :update]
  
  resource :users, only:[:show, :edit, :update, :destroy]
  get "my_page" => "users#mypage"
  
  resources :quests, only:[:new, :create, :show, :edit, :update]
  patch 'quests/:id/clear' => "quests#clear"
  get 'quests/complete' => "quests#complete"
  
  resources :boards, only:[:index, :create, :show]

  resources :comments, only:[:create]

  resources :categories, only:[:create]
  

  namespace :admin do
  
    get 'home' => "homes#top"
  
    resources :tasks, only:[:show, :edit, :update, :new, :create, :destroy]
  
    resources :boards, only:[:show, :destory]
   
    resources :comments, only:[:destroy]
  end

  devise_for :admin, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
