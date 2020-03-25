require 'dotenv'
Dotenv.load('.env.test') if ENV['RACK_ENV'] == 'test'
Dotenv.load(".env")

require 'sinatra'
require './support_request'

post '/support_requests' do
  data = JSON.parse(request.body.read)

  x = erb :asana_task, locals: {request: SupportRequest.new(data)}

  puts x


end

