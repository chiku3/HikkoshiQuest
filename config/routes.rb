Rails.application.routes.draw do

  root "homes#top"
  get 'help' => "homes#help"

  resources :quest_tasks, only:[:show, :update]

  resource :users, only:[:show, :edit, :update, :destroy]
  get "my_page" => "users#mypage"

  patch 'clear/:id' => "quests#clear", as:"clear"
  get 'quests/complete' => "quests#complete", as:"complete"
  resources :quests, only:[:new, :create, :show, :edit, :update]
  
  resources :boards, only:[:index, :create, :show]

  resources :comments, only:[:create]

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
