# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource, :class => 'Resource' do
    name "MyString"
    link "MyString"
    description "MyText"
  end
end
