# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pick do
    name "MyString"
    link "MyString"
    podcast nil
    author nil
  end
end
