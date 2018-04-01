require 'spec_helper'
require 'json'

RSpec.describe Dry::Http::Client::Request::Post do
  let(:request) { described_class.new }

  let(:url) { 'https://api.github.com/users/1' }
  let(:options) { {} }

  subject { request.call(url, options) }
end
