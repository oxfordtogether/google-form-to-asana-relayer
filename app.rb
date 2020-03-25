require 'dotenv/load'
require 'sinatra'

post '/support_requests' do
  puts params
end

