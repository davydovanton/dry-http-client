module Dry
  module Http
    module Client
      class Base
        def initialize(host, options)
          @host = host
          @options = options
        end
      end
    end
  end
end
