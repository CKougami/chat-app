class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content 
      t.references :user, null: false, foreign_key: true 
      t.references :room, null: false, foreign_key: true 
      t.timestamps
    end
  end
end

# テキストの内容：「content」カラム
# メッセージの投稿をしたチャットルームのid：「room_id」カラム
# メッセージの投稿をしたユーザーのid：「user_id」カラム
# foreign_keyで、user_idとroon_idがないとDBに保存できないようにしている