require 'spec_helper'

describe "My Sinatra Application" do
  it "should allow accessing the home page" do
    post '/support-requests'
    # Rspec 2.x
    expect(last_response).to be_ok
  end
end
