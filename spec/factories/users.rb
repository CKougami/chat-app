FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end

# 名前のダミーデータを生成
# フリーemailダミーデータを生成
# 6文字以上のダミーパスワードを生成
# 確認用Pパスワードに先に生成したパスワードを入力