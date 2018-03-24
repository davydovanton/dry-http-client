require 'dry/http/client/base'
require 'dry/http/client/version'

module Dry
  module Http
    module Client
      def self.new(host, options = {})
        Base.new(host, options)
      end
    end
  end
end
