require 'uri'
require 'net/https'
require 'dry-monads'

module Dry
  module Http
    module Client
      module Request
        class Get
          include Dry::Monads::Try::Mixin

          def call(url, options)
            Try(URI::InvalidURIError) { URI.parse(url) }.bind do |uri|
              request = Net::HTTP::Get.new(uri.request_uri)
              yield request if block_given?
              # res.is_a?(Net::HTTPSuccess)
              http(uri).request(request)
            end
          end

        private

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
