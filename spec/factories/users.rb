FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
    birthday { 20.years.ago }
  end
end 