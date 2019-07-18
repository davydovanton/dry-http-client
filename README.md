# NOT MAINTAINED

**This repository is no longer maintain**

# Dry::Http::Client

**Proof of Concept**, see full todo list in [TODO.md](https://github.com/davydovanton/dry-http-client/blob/master/TODO.md).

Fundctional HTTP client based on dry stack. Inspired by [serradura/request_via](https://github.com/serradura/request_via)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dry-http-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dry-http-client

## Usage

```ruby
client = Dry::Http::Client.new(host: 'https://example.com')

client.get # GET https://example.com and return dry-result monad
client.get(params: { a: 1 }, headers: { 'Header-Name' => 'Header-Value' })
# => Success(request_object)
# => Success(request_object)

# or dry-struct
options = Dry::Http::Client::Options.new(params: { a: 1 }, headers: { 'Header-Name' => 'Header-Value' })
client.get(options)

client.get('foo', params: { a: 1 })
client.get('/bar', headers: { 'User-Agent' => 'REST Example' })

# also, you can put block in to request:
client.get('foo', params: { a: 1 }) do |request|
  request['Header'] = 'Value'
end


# Supported HTTP methods:
# client.get
# client.head
# client.post
# client.put
# client.delete
# client.options
# client.trace
# client.patch

Dry::Http::Client.new(host: 'example.com', port: 3000, open_timeout: 10, read_timeout: 100)

# or with default params
Dry::Http::Client.new(host: 'example.com', params: { key: '...' }, headers: { 'Header-Name' => 'Header-Value' })
```

### Response Struct
```ruby
module Types
  include Dry::Types.module
end

class UserResponseStruct < Dry::Struct
  attribute :name, Types::String
  attribute :age,  Types::Coercible::Int
end

client.get('users/1', success_struct: UserResponseStruct) # => Success([200, UserResponseStruct.new(name: 'Anton', age: '21')])
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davydovanton/dry-http-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dry::Http::Client project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/dry-http-client/blob/master/CODE_OF_CONDUCT.md).
