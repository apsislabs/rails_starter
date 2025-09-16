FactoryBot.define do
  factory :account do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    trait :with_user do
      users { [association(:user)] }
    end
  end
end
