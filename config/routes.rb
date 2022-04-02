Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"  #ルートパスを設定（rooms/index.html.erb）

  # usersコントローラーのアクションを指定
  resources :users, only: [:edit, :update]
  # roomsコントローラーのアクションを指定
  resources :rooms, only: [:new, :create] do
  # messagesコントローラーのアクションを指定（ネストにすることで「rooms」に属する「message」となる）
    resources :messages, only: [:index, :create]
  end
end