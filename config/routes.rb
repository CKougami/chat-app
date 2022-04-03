Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"  #ルートパスを設定（rooms/index.html.erb）

  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end

  # usersコントローラーのアクションを指定
  # roomsコントローラーのアクションを指定
  # messagesコントローラーのアクションを指定（ネストにすることで「rooms」に属する「message」となる）