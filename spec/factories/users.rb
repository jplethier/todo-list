# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "factory_#{n}@mail.com" }
    password '123qwe'
    password_confirmation '123qwe'
  end
end
