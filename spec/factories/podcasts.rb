FactoryGirl.define do
  factory :valid_podcast, :class => "Podcast" do
    name "MyString"
    published_on Time.now
    audio_link "MyString"
    description "MyText"
    slug "mystring"
  end
end
