require 'spec_helper'

RSpec.describe Dry::Http::Client::Base do
  let(:base_client) { described_class.new(host, options) }

  let(:host) { 'site.com' }
  let(:options) { {} }

  it { expect(base_client).to be_a Dry::Http::Client::Base }
end
