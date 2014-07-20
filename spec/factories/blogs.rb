# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    title "MyString"
    body "MyText"
    slug "MyString"
  end
end
