class SupportRequest
  attr_accessor :referrer_name, :referrer_phone, :referrer_email, :referrer_relationship
  attr_accessor :person_name, :person_phone, :person_email
  attr_accessor :postcode, :address
  attr_accessor :request_type
  attr_accessor :details
  attr_accessor :other_info
  attr_accessor :request_num

  def initialize(params)
    self.request_num = params["number"]

    self.referrer_name = params["113648108"]
    self.referrer_email = params["email"]
    self.referrer_phone = params["1183401688"]
    self.referrer_relationship = params["154304881"]

    self.person_name = params["939576256"]
    self.person_email = params["649491609"]
    self.person_phone = params["1055745204"]
    self.address = params["1692830319"]
    self.postcode = params["858656279"]

    self.request_type = params["1224654153"]
    self.details = params["848357083"]
    self.other_info = params["830188072"]
  end

end
