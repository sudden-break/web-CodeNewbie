# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chat do
    date DateTime.now
    description "MyText"
    name "MyString"
  end
end
