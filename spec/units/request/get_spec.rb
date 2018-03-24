require 'spec_helper'

RSpec.describe Dry::Http::Client::Request::Get do
  let(:request) { described_class.new }

  let(:url) { 'https://api.github.com/users/1' }
  let(:options) { {} }

  subject { request.call(url, options) }

  context 'when url is invalid' do
    let(:url) { :asd }

    it { expect(subject).to be_error }
  end

  context 'when request is success' do
    it { VCR.use_cassette("github_user_success") { expect(subject.code).to eq '200' } }
  end

  context 'when request is failure' do
    let(:url) { 'https://api.github.com/sers/1' }

    it { VCR.use_cassette("github_user_failure") { expect(subject.code).to eq '404' } }
  end
end
