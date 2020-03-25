require './app'
run Sinatra::Application
$stdout.sync = true

require 'bugsnag'

Bugsnag.configure do |config|
  config.api_key = 'YOUR_API_KEY_HERE'
end

use Bugsnag::Rack

set :raise_errors, true
set :show_exceptions, false
