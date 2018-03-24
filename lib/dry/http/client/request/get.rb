require 'uri'
require 'net/https'

module Dry
  module Http
    module Client
      module Request
        class Get
          def call(url, options)
            uri = URI.parse(url)
            request = Net::HTTP::Get.new(uri.request_uri)
            yield request if block_given?

            http(uri).request(request)
          end

        private

          def http(uri)
            http = Net::HTTP.new(uri.host, uri.port)
            if uri.scheme == 'https'
              http.use_ssl = true
              http.verify_mode = OpenSSL::SSL::VERIFY_NONE
            end
            http
          end
        end
      end
    end
  end
end
