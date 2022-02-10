Rails.application.routes.draw do
  namespace :admin do
    get 'comments/destroy'
  end
  namespace :admin do
    get 'boards/show'
    get 'boards/destroy'
  end
  namespace :admin do
    get 'tasks/show'
    get 'tasks/edit'
    get 'tasks/update'
    get 'tasks/new'
    get 'tasks/create'
  end
  namespace :admin do
    get 'homes/top'
  end
  get 'categories/create'
  get 'comments/create'
  get 'comments/destroy'
  get 'boards/index'
  get 'boards/create'
  get 'boards/show'
  get 'quests/new'
  get 'quests/create'
  get 'quests/show'
  get 'quests/edit'
  get 'quests/update'
  get 'quests/clear'
  get 'quests/complete'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'tasks/show'
  get 'tasks/update'
  get 'homes/top'
  get 'homes/help'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
