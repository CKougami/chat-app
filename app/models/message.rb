class Message < ApplicationRecord
  belongs_to :room  # 1つのメッセージは、1つのチャットルームに存在します。
  belongs_to :user  # 1つのメッセージは、1人のユーザーから送信されます。
  
  
end
