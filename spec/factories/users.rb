FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    confirmed_at { 10.days.ago }

    trait :unconfirmed do
      confirmed_at { nil }
    end
  end
end
