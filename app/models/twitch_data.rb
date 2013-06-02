# inspired by https://github.com/kustom666/cathodic

require 'json'
require 'open-uri'
require 'openssl'

class TwitchData
  BASE_API = "https://api.twitch.tv/kraken"
  API_VERSION = "v2"

  METHODS = %w(preview viewers game)

  attr_accessor :online, :stream, :username

  def initialize username
    @username = username.split('/').last.split('?').first.gsub(/\u200e/, '')

    response = JSON.parse(request("streams"))
    
    @stream = response["stream"]
    @online = @stream.present?
  end

  def chat_url
    "http://twitch.tv/chat/embed?channel=#{@username}"
  end

  def video_url
    "http://www.twitch.tv/widgets/live_embed_player.swf?channel=#{@username}"
  end

  def status
    @stream["channel"]["status"]
  end

  def method_missing(method, *args, &block)
    if (!@stream.nil? && @stream.include?(method.to_s)) || METHODS.include?(method.to_s)
      @stream.try("[]", method.to_s)
    else
      super
    end
  end

  private

    def request path
      open(BASE_API + "/" + path + "/" + @username, {"Accept" => "application/vnd.twitchtv.#{API_VERSION}+json"}).read
    end
end