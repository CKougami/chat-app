class Room < ApplicationRecord
  #README!の記述どおりにアソシエーションを記述
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy

  # 1つのroomに複数のroom_usersが存在できる（roomが消えると付随するroom_usersもdestroy）
  # usersはroom_usets(中間テーブル)を通る
  # 1つのチャットルームに、メッセージは複数存在（roomが消えると付随するmessasgeもdestroy）


  # 名前を空にしたままチャットルームを作成しようとするとエラーを起こす
  validates :name, presence: true
end
