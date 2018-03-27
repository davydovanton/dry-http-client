require 'dry/http/client/request/get'

module Dry
  module Http
    module Client
      class Base
        attr_reader :host

        def initialize(host, options)
          @host = host
          @options = options
          @get_request = Dry::Http::Client::Request::Get.new
        end

        def get(url, options = {})
          @get_request.call(host + url, options)
        end

        def post(options = {})
        end
      end
    end
  end
end
