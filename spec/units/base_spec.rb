require 'spec_helper'

RSpec.describe Dry::Http::Client::Base do
  let(:base_client) { described_class.new(host, options) }

  let(:host) { 'https://api.github.com' }
  let(:options) { {} }

  it { expect(base_client).to be_a Dry::Http::Client::Base }

  describe '#get' do
    let(:url) { '/users/1' }
    subject { base_client.get(url, {}) }

    it { VCR.use_cassette("github_user_success") { expect(subject).to be_success } }
  end

  describe '#post' do
    it { expect(base_client.post(options)).to eq nil }
  end
end
