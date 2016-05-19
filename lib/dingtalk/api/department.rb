module Dingtalk
  module Api
    class Department < Base
      def list
        http_get("list?access_token=#{access_token}")
      end

      def info dep_id
        http_get("get?access_token=#{access_token}&id=#{dep_id}")
      end

      private
      def base_url
        'department'
      end
    end
  end
end
