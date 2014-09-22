# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :show_note do
    link "MyString"
    name "MyString"
    podcast nil
  end
end
