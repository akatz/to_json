[![Build Status](https://secure.travis-ci.org/akatz/to_json.png?branch=master)](http://travis-ci.org/akatz/to_json)

# ToJson

TODO: Let's reimplement to_json for fun

## Installation

Add this line to your application's Gemfile:

    gem 'to_json'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_json

## Usage

right now this support strings,fixnums,arrays, and hashes

[1,2].to_json # outputs "[1,2]"
{"1" => 2}.to_json outputs "{\"1\":2}



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
