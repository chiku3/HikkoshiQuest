Rails.application.routes.draw do
  # ホームのルーティング
  root "homes#top"
  get 'help' => "homes#help"
  # タスクのルーティング
  resources :tasks, only:[:show, :update]
  # ユーザーのルーティング
  resource :users, only:[:show, :edit, :update, :destroy]
  get "my_page" => "users#mypage"
  # クエストのルーティング
  resources :quests, only:[:new, :create, :show, :edit, :update]
  patch 'quests/:id/clear' => "quests#clear"
  get 'quests/complete' => "quests#complete"
  # 掲示板のルーティング
  resources :boards, only:[:index, :create, :show]
  # コメントのルーティング
  resources :comments, only:[:create]
  # カテゴリのルーティング
  resources :categories, only:[:create]

  namespace :admin do
    # ホームのルーティング
    get 'home' => "homes#top"
    # タスクのルーティング
    resources :tasks, only:[:show, :edit, :update, :new, :create, :destroy]
    # 掲示板のルーティング
    resources :boards, only:[:show, :destory]
    # コメントのルーティング
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
