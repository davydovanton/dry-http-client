require 'dry/http/client/request/get'

module Dry
  module Http
    module Client
      class Base
        attr_reader :host

        def initialize(host, options)
          @host = host
          @options = options
        end

        def get(url, options = {})
          Dry::Http::Client::Request::Get.new.call(host + url, options)
        end

        def post(options = {})
        end
      end
    end
  end
end
