require 'spec_helper'

RSpec.describe Dry::Http::Client::Base do
  let(:base_client) { described_class.new(host, options) }

  let(:host) { 'site.com' }
  let(:options) { {} }

  it { expect(base_client).to be_a Dry::Http::Client::Base }

  describe '#get' do
    it { expect(base_client.get(options)).to eq nil }
  end

  describe '#post' do
    it { expect(base_client.post(options)).to eq nil }
  end
end
