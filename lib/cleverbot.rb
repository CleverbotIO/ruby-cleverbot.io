require 'httpclient'
require 'oj'
require_relative 'cleverbot_errors'

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

  private

  # Throws the relevant errors if possible.
  # @param status [String] The status value from the API
  # @raise [IncorrectCredentialsError] If the api_user and api_key are incorrect.
  # @raise [DuplicatedReferenceNamesError] If the reference name is already in use by the instance.
  def try_throw(status)
    case status
    when 'Error: API credentials incorrect' then fail Cleverbot::Errors::IncorrectCredentialsError
    when 'Error: reference name already exists' then fail Cleverbot::Errors::DuplicatedReferenceNamesError
    when 'success' then return
    else fail "#{status} UNRECOGNIZED ERROR! PLEASE REPORT TO CLEVERBOT RUBY ISSUE TRACKER."
    end
  end
end
