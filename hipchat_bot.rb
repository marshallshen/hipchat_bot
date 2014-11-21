require "json"
require "net/http"
require "uri"
require "yaml"

module HipchatBot
  class  << self
    attr_accessor :config

    def broadcast(message)
      uri = URI.parse("https://api.hipchat.com/v2/room/#{room_id}/notification")
      header = {"content-type" => "application/json", "authorization" => "Bearer #{auth_token}"}

      req = Net::HTTP::Post.new(uri.path, header)
      req.body = {"color" => text_color, "message_format" => "text", "message" => message}.to_json

      Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme = "https") { |http| http.request req }
    end

    def receive
      url = "https://api.hipchat.com/v2/room/#{room_id}/history/lastest?auth_token=#{auth_token}"
      Net::HTTP.get(URI.parse(url))
    end

    def configure
      yield ( @config ||= Hash.new )
    end

    private
    def auth_token
      @config.fetch("auth_token")
    end

    def room_id
      @config.fetch("room_id")
    end

    def text_color
      @config.fetch("text_color")
    end
  end
end
