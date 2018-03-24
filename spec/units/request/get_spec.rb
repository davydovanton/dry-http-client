require 'spec_helper'

RSpec.describe Dry::Http::Client::Request::Get do
  let(:request) { described_class.new }

  let(:host) { 'https://api.github.com/users/1' }
  let(:options) { {} }

  subject { request.call(host, options) }

  context 'when request is success' do
    it { VCR.use_cassette("github_user_success") { expect(subject.code).to eq '200' } }
  end
end
