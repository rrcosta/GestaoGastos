FactoryBot.define do
  factory :category do
    descricao { Faker::Lorem.characters(10) }
    expense
  end
end
