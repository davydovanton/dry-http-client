require 'spec_helper'

RSpec.describe Dry::Http::Client::Base do
  let(:base_client) { described_class.new(host, options) }

  let(:host) { 'https://api.github.com' }
  let(:options) { {} }

  it { expect(base_client).to be_a Dry::Http::Client::Base }

  describe '#get' do
    let(:url) { '/users/1' }
    subject { base_client.get(url, {}) }

    it 'calls request with existed params' do
      expect(base_client.get_request).to receive(:call).with('https://api.github.com/users/1', { params: {} })
      subject
    end

    context 'when params exist in client' do
      let(:options) { { params: { page: 2 } } }

      it 'calls request with existed params' do
        expect(base_client.get_request).to receive(:call).with('https://api.github.com/users/1', params: { page: 2 })
        subject
      end
    end

    context 'when params exist in client and in call attributes' do
      let(:options) { { params: { page: 2 } } }

      subject { base_client.get(url, { params: { page: 1, key: 'test' } }) }

      it 'calls request with existed params' do
        expect(base_client.get_request).to receive(:call).with('https://api.github.com/users/1', params: { page: 1, key: 'test' })
        subject
      end
    end
  end

  describe '#post' do
    it { expect(base_client.post(options)).to eq nil }
  end
end
