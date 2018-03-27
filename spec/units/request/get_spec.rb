require 'spec_helper'
require 'json'

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
    it { VCR.use_cassette("github_user_success") { expect(subject).to be_success } }
    it { VCR.use_cassette("github_user_success") { expect(subject.value!.code).to eq '200' } }

    context 'and request has custom params' do
      let(:url) { 'https://api.github.com/users/davydovanton/repos' }

      it do
        result, other_result = nil, nil
        VCR.use_cassette("github_anton_repos_first_page_success") do
          result = request.call(url, params: { page: 1 })
          expect(result).to be_success
          expect(result.value!.code).to eq '200'
        end

        VCR.use_cassette("github_anton_repos_second_page_success") do
          other_result = request.call(url, params: { page: 2 })
          expect(other_result).to be_success
          expect(other_result.value!.code).to eq '200'
        end

        body = JSON.parse(result.value!.body)
        other_body = JSON.parse(other_result.value!.body)
        expect(body.first).to_not eq other_body.first
      end
    end
  end

  context 'when request is failure' do
    let(:url) { 'https://api.github.com/sers/1' }

    it { VCR.use_cassette("github_user_failure") { expect(subject).to be_failure } }
    it { VCR.use_cassette("github_user_failure") { expect(subject.failure.code).to eq '404' } }
  end
end
