require 'spec_helper'

RSpec.describe 'Dry::Http::Client' do
  let(:host) { 'site.com' }
  let(:options) { {} }

  it { expect(Dry::Http::Client.new(host, options)).to be_a Dry::Http::Client::Base }
end
