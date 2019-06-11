FactoryBot.define do
  factory :expense do
    descricao { Faker::Coffee.notes }
    valor { Faker::Commerce.price }
    data { "2019-06-10 21:37:35" }
    user
  end
end
