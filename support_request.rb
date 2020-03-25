module CommonFields
  attr_accessor :request_num
  attr_accessor :referrer_name, :referrer_phone, :referrer_email, :referrer_relationship
  attr_accessor :person_name, :person_phone, :person_email
  attr_accessor :postcode, :address
  attr_accessor :request_type
  attr_accessor :other_info

  def set_common_fields(params)
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

    self.other_info = params["830188072"]
  end
end


class SupportRequest
  include CommonFields
  attr_accessor :details

  attr_accessor :closest_larder, :delivery_instructions, :delivery_or_pickup

  def initialize(params)
    set_common_fields(params)
    self.details = params["848357083"]

    self.closest_larder = params["1027888410"]
    self.delivery_instructions = params["1056965329"]
    self.delivery_or_pickup = params["1097017324"]
  end

end
