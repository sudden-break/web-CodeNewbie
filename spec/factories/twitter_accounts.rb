# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :twitter_account do
    handle "MyString"
    followers_count 1
    user nil
  end
end
