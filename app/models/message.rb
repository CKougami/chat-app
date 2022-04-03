class Message < ApplicationRecord
  belongs_to :room  # 1つのメッセージは、1つのチャットルームに存在します。
  belongs_to :user  # 1つのメッセージは、1人のユーザーから送信されます。
  has_one_attached :image  #1つのメッセージに1つの画像を添付できます。
  
  # content(メッセージ)が空の場合はDBに保存しない
  validates :content, presence: true
end
