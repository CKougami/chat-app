FactoryBot.define do
  factory :room do
    name {Faker::Team.name}
  end
end

# roomのダミーネームを生成