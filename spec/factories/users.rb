# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
#Checar mas configuraciones en repo de FactoryGirl
  factory :user do
    email { |n| "email#{n}@example.com" }
    password "12345678"
    password_confirmation "12345678"
  end
end

