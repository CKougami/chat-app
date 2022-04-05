FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

# ダミーテキストを生成
# userとroomを紐づける

# public/imagesにあるtest_image.pngを[test_image.png]というダミー名前で添付
# ioクラス = 基本的な入出力機能のためのクラス