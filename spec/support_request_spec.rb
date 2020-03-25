require 'spec_helper'

describe "My Sinatra Application" do
  data = {
    "113648108": "Mr Brown, GP",
    "154304881": "GP",
    "649491609": "mrs@green.com",
    "830188072": "No other information",
    "848357083": "Pick up a pizza",
    "858656279": "OX1 5PJ",
    "939576256": "Mrs Green",
    "1055745204": "111",
    "1183401688": "999",
    "1224654153": "Delivery of essential food items (where person/family is unable to order online or has the support of a foodbank)",
    "1565149373": ["The person/family are aware that I have referred them for support from Oxford Together and consent to these personal details being shared with Oxford Hub and Oxford Hub volunteers",
                   "Oxford Together is a community based volunteer response to coronavirus and may not always be able to provide the support requested",
                   "There are no known risks for anyone providing support to this person/family"],
    "1692830319": "78 Green St",
    "number": 70,
    "email": "drbrown@dr.com",
  }

  describe "POST /support_requests" do
    it "returns http success" do
      post "/support_requests", data.to_json, format: :json
      expect(last_response).to be_ok
    end
  end
end
