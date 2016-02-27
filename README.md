# cleverbot.io
[![Gem Version](https://badge.fury.io/rb/cleverbot_io.svg)](https://badge.fury.io/rb/cleverbot_io)
[![Slack Status](https://slack.cleverbot.io/badge.svg)](https://slack.cleverbot.io)

A Ruby wrapper for the cleverbot.io API.

## Installation
### Ruby Gems
```shell
$ gem install cleverbot_io
```

### Bundler
Add this line to your Gemfile:
```ruby
gem 'cleverbot_io'
```

And then execute:
```shell
$ bundle install
```

## Usage
Be sure to look at the actual documentation for the cleverbot.io API when you are not sure about something. Or ask for documentation clarification in the issue tracker here.

Before using this module, please get your API keys at http://cleverbot.io/keys.

```ruby
require 'cleverbot'

# Create a new Cleverbot instance, with an optional reference nick set.
friend = Cleverbot.new('api_user', 'api_key', 'Ricardo')

# Talk with your pal, Cleverbot.
friend.say('Why am I still talking to you?')
# => 'Because you have a beautiful soul.'
```
