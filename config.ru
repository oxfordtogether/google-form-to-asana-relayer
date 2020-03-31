require './app'
run Sinatra::Application
$stdout.sync = true

require 'bugsnag'

Bugsnag.configure do |config|
  config.api_key = ENV['BUGSNAG_API_KEY']
end

use Bugsnag::Rack

set :raise_errors, true
set :show_exceptions, false
