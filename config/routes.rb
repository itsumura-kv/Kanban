Rails.application.routes.draw do
  get 'card/new'
  post 'card/create'
  get 'card/edit'
  get 'card/update'
  get 'card/destroy'
  get 'column/new'
  post 'column/create'
  get 'column/:column_id/edit' => 'column#edit'
  patch 'column/:column_id/update' => 'column#update'
  delete 'column/:column_id' => 'column#destroy'
  get 'project/new'
  post 'project/create'
  get 'project/show'
  get 'project/:project_id' => 'project#show'
  get 'project/:project_id/edit' => 'project#edit'
  patch 'project/:project_id/update' => 'project#update'
  get 'project/destroy'

  patch 'project/:project_id/:column_id/card_id/update' => 'card#update'

  get 'mypage/edit'
  post 'mypage/update' => 'mypage#update'
  get 'mypage/destroy'
  get 'login/index'
  root 'project#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
