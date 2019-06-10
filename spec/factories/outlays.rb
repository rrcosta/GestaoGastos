FactoryBot.define do
  factory :outlay do
    description { "MyString" }
    value { "9.99" }
    date_operation { "2019-06-10 09:50:16" }
    user
  end
end
