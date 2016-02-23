require 'httpclient'
require 'json'

class Cleverbot
  attr_accessor :api_user
  attr_accessor :api_key
  attr_accessor :nick

  def initialize(api_user, api_key, nick = nil)
    @api_user = api_user
    @api_key = api_key
    @nick = nick
    @client = HTTPClient.new
  end

  # Creates a new bot instance based on the nick. If no nick has been set, this will set a random one.
  # @return [Boolean] Whether the request was successful. If true, nick will be set.
  def create
    params = {
      user: @api_user,
      key: @api_key
    }
    params[:nick] = @nick unless @nick.nil?
    response = JSON.parse(@client.post('https://cleverbot.io/1.0/create', params).body)
    @nick = response['nick'] if response['status'] == 'success'

    response['status'] == 'success'
  end

  # Sends the bot a message and returns its response. If the nick has not been set, it will call #{create}.
  # @param str [String] The message to send to the bot.
  # @return [String] The bot's response, or its error message.
  def say(str)
    params = {
      user: @api_user,
      key: @api_key,
      text: str
    }
    if @nick.nil?
      create
    end
    params[:nick] = @nick
    response = JSON.parse(@client.post('https://cleverbot.io/1.0/ask', params).body)
    if response['status'] == 'success'
      response['response']
    else
      response['status']
    end
  end
end