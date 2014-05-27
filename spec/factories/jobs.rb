# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job, :class => "Job" do
    company "MyString"
    name "MyString"
    link "MyString"
    description "MyText"
  end
end
