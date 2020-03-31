require 'dotenv'
Dotenv.load('.env.test') if ENV['RACK_ENV'] == 'test'
Dotenv.load(".env")

require 'sinatra'
require './support_request'
require 'active_support/time'
require 'asana'

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

post '/support_requests' do
  data = JSON.parse(request.body.read)

  request = SupportRequest.new(data)

  if request.is_larder_box_request?
    notes = erb :larder_box_request, locals: {request: request}
    title = "[##{request.request_num + 102}] Larder box request for #{request.person_name}, #{request.postcode}"
    project = "1168339813840817"
  else
    notes = erb :regular_request, locals: {request: request}
    title = "[##{request.request_num + 102}] Support request for #{request.person_name}, #{request.postcode}"
    project = "1167559196211825"
  end

  payload = {
    projects: [project],
    due_on: Date.today,
    name: title,
    html_notes: notes.strip,
    custom_fields: request.custom_fields
  }

  if ENV["ASANA_API_KEY"] && !ENV["ASANA_API_KEY"].empty?
    client = Asana::Client.new { |c| c.authentication :access_token, ENV["ASANA_API_KEY"] }

    client.tasks.create(payload)
  else
    puts "Not sending to asana"

    puts notes.strip
  end

  status :ok
end

