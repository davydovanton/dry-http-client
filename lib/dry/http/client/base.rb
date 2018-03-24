require 'dry/http/client/request/get'

module Dry
  module Http
    module Client
      class Base
        def initialize(host, options)
          @host = host
          @options = options
        end

        def get(options = {})
        end

        def post(options = {})
        end
      end
    end
  end
end
