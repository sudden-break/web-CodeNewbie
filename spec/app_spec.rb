require 'spec_helper'

describe 'Sinatra Application' do
  it "renders the index page" do
    get '/'
    expect(last_response).to be_ok
  end
end