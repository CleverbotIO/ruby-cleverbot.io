require 'httpclient'
require 'oj'

class Cleverbot
  # @return [String] The API User for the instance.
  attr_reader :api_user

  # @return [String] The API Key for the instance.
  attr_reader :api_key

  # @return [String] The reference nick for the session.
  attr_accessor :nick

  # Creates a new instance of the Cleverbot.
  # @param api_user [String] The API user for the Cleverbot API.
  # @param api_key [String] The API key for the Cleverbot API.
  # @param nick [String] The reference nick. If nil, one will be set automatically through the API.
  def initialize(api_user, api_key, nick = nil)
    @api_user = api_user
    @api_key = api_key
    @nick = nick
    @client = HTTPClient.new

    params = {
      user: @api_user,
      key: @api_key
    }
    params[:nick] = @nick unless @nick.nil?
    response = Oj.load(@client.post('https://cleverbot.io/1.0/create', params).body)
    try_throw(response['status'])
    @nick = response['nick']
  end

  # Sends the bot a message and returns its response.
  # @param str [String] The message to send to the bot.
  # @return [String] The bot's response, or its error message.
  def say(str)
    params = {
      user: @api_user,
      key: @api_key,
      text: str,
      nick: @nick
    }
    response = Oj.load(@client.post('https://cleverbot.io/1.0/ask', params).body)
    try_throw(response['status'])

    response['response']
  end

  # A generic Error class for all Cleverbot errors.
  class Error < StandardError; end

  private

  # Throws the relevant errors if possible.
  # @param status [String] The status value from the API
  # @raise [Cleverbot::Error] If an error is thrown by the Cleverbot API.
  def try_throw(status)
    return if status == 'success'
    fail Error.new(status)
  end
end
