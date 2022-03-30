Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"

  # usersコントローラーに更新フォーム（edit）とリソース更新（update）のアクションのみ設定
  resources :users, only: [:edit, :update]

end