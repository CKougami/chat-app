Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  # root to: "messages#index"  #ルートパスを設定（messages/index.html.erb）
  root to: "rooms#index"  #ルートパスを設定（rooms/index.html.erb）

  # usersコントローラーに更新フォーム（edit）とリソース更新（update）のアクションのみ設定
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]

end