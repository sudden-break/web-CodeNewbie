FactoryGirl.define do
  factory :valid_challenge, :class => 'Challenge' do
    name "theCommit"
    link "http://google.com"
    description "This is a valid challenge"
  end
end
