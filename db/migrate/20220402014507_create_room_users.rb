class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps 
    end
  end
end

# どのユーザーがどのチャットルームに参加しているかを管理する中間カラム。
# ここに保存する「ユーザー」と「チャットグループ」は必ず存在している事が前提なので、
# usersテーブル」と「roomsテーブル」の情報を参照する必要があります。
# foreign_key: trueという記述を加え、外部キー制約を設定しています。