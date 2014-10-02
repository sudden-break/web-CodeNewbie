# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :valid_user, :class => "User" do
    email "valid@gmail.com"
    password "abc123abc"
  end
end
