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

LARDER_CUSTOM_FIELD_ID = "1168364399641134"
LARDER_CUSTOM_FIELDS = {
  blackbird_leys: "1168364399641136",
  rose_hill: "1168364399707698",
  arkt:"1168364399707699",
  barton: "1168364399707702"
}

HOW_CUSTOM_FIELD_ID = "1168366802048122"
HOW_CUSTOM_FIELDS = {
  pickup: "1168366802049153",
  delivery: "1168366802049158"
}

class SupportRequest
  include CommonFields
  attr_accessor :details

  attr_accessor :closest_larder_text, :delivery_instructions, :delivery_or_pickup

  def is_larder_box_request?
    !!closest_larder_text
  end

  def initialize(params)
    set_common_fields(params)
    self.details = params["848357083"]

    self.closest_larder_text = params["1027888410"]
    self.delivery_instructions = params["1056965329"]
    self.delivery_or_pickup = params["1097017324"]
  end

  def closest_larder
    return nil unless closest_larder_text

    if closest_larder_text =~ /barton/i
      :barton
    elsif closest_larder_text =~ /rose/i
      :rose_hill
    elsif closest_larder_text =~ /ark/i
      :arkt
    elsif closest_larder_text =~ /blackbird/i
      :blackbird_leys
    end
  end

  def how
    if delivery_or_pickup =~ /pickup/i
      :pickup
    else
      :delivery
    end
  end

  def custom_fields
    return {} unless is_larder_box_request?

    h = { HOW_CUSTOM_FIELD_ID => HOW_CUSTOM_FIELDS[how] }
    h[LARDER_CUSTOM_FIELD_ID] = closest_larder_field_id if closest_larder
    
    h
  end

  def closest_larder_field_id
    closest_larder && LARDER_CUSTOM_FIELDS[closest_larder]
  end

end

# require 'asana'
# require 'dotenv/load'
# client = Asana::Client.new { |c| c.authentication :access_token, ENV["ASANA_API_KEY"] }
# client.custom_fields.find_by_workspace(workspace: "1167461191326899")



