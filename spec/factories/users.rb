FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Name.name }
    password_digest { "foo" }
  end
end
