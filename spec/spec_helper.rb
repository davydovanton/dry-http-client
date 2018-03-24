require 'rspec'
require 'vcr'
require 'dry/http/client'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
end
