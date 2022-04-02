class Room < ApplicationRecord
  #README!の記述どおりにアソシエーションを記述
  has_many :room_users
  has_many :users, through: :room_users
end
