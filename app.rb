require 'dotenv'
Dotenv.load('.env.test') if ENV['RACK_ENV'] == 'test'
Dotenv.load(".env")

require 'sinatra'

post '/support_requests' do
  puts JSON.parse(request.body.read)
end

