Rails.application.routes.draw do
  get 'mypage/edit'
  post 'mypage/update' => 'mypage#update'
  get 'mypage/destroy'
  get 'login/index'
  root 'root#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
