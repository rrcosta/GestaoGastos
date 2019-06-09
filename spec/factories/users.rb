FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Name.name }

    trait :without_pwd do
      password { "" }
      password_digest { "" }
    end

    trait :with_pwd do
      password { "FooBar@2019!" } 
      password_digest { "FooBar@2019!" }
    end
  end
end
