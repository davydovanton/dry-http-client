require 'uri'
require 'net/https'
require 'dry-monads'

module Dry
  module Http
    module Client
      module Request
        class Get
          include Dry::Monads::Result::Mixin
          include Dry::Monads::Try::Mixin
          include Dry::Monads::Do.for(:call)

          def call(url, options)
            uri = yield parse_url(url)
            request = Net::HTTP::Get.new(uri.request_uri)
            send_request(uri, request)
          end

        private

          def parse_url(url)
            Try(URI::InvalidURIError) { URI.parse(url) }
          end

          def send_request(uri, request)
            response = http(uri).request(request)
            response.is_a?(Net::HTTPSuccess) ? Success(response) : Failure(response)
          end

          def http(uri)
            http = Net::HTTP.new(uri.host, uri.port)
            https!(uri, http)
            http
          end

          def https!(uri, http)
            if uri.scheme == 'https'
              http.use_ssl = true
              http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            end
          end
        end
      end
    end
  end
end
