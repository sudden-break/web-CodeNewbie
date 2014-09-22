# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :valid_show_note, :class => "ShowNote" do
    name "MyString"
  end
end
