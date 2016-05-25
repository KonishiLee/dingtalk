module Dingtalk
  module Api
    class Sso < Base
      SUITE_SSO_TOKEN = 'suite_sso_access_token'
      attr_accessor :corp_id
      attr_accessor :sso_secret

      def initialize corp_id, sso_secret
        @corp_id = corp_id
        @sso_secret = sso_secret
      end

      def token
        token = redis.get(SUITE_SSO_TOKEN)
        unless token
          json = http_get("gettoken?corpid=#{corp_id}&corpsecret=#{sso_secret}")
          redis.set(SUITE_SSO_TOKEN, json['access_token'])
          token = json['access_token']
        end
        token
      end

      def user_info code
        http_get("getuserinfo?access_token=#{token}&code=#{code}")
      end

      private
      def base_url
        'sso'
      end
    end
  end
end
