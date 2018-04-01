require 'uri'
require 'net/https'
require 'dry-monads'

module Dry
  module Http
    module Client
      module Request
        class Post
          include Dry::Monads::Result::Mixin
          include Dry::Monads::Try::Mixin
          include Dry::Monads::Do.for(:call)

          def call(url, params: {}, **options)
          end
        end
      end
    end
  end
end
