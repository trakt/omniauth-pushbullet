require 'omniauth-oauth2'
require 'net/http'
require 'json'

module OmniAuth
  module Strategies
    class Pushbullet < OmniAuth::Strategies::OAuth2
      BASE_URL = 'https://www.pushbullet.com'
      API_URL  = 'https://api.pushbullet.com'

      option :name, 'pushbullet'

      option :client_options, {
        :site           => BASE_URL,
        :authorize_url  => "#{BASE_URL}/authorize",
        :token_url      => "#{API_URL}/oauth2/token"
      }

      uid do
        raw_data.delete('iden')
      end

      info do
        {
          :name  => raw_data.delete('name'),
          :email => raw_data.delete('email'),
          :image => raw_data.delete('image_url')
        }
      end

      extra do
        raw_data
      end

      private

      def raw_data
        return @data if @data

        uri     = URI.parse("#{API_URL}/v2/users/me")
        http    = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.request_uri)

        http.use_ssl     = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER

        request['Content-Type'] = 'application/json'
        request['Access-Token'] = access_token.token

        @data = JSON.parse(http.request(request).body)
      end
    end
  end
end
