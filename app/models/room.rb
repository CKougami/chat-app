class Room < ApplicationRecord
  #README!の記述どおりにアソシエーションを記述
  has_many :room_users
  has_many :users, through: :room_users
  has_many :messages  #1つのチャットルームに、メッセージは複数存在します。

  # 名前を空にしたままチャットルームを作成しようとするとエラーを起こす
  validates :name, presence: true
end
