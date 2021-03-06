module Dingtalk
  module Api
    class User < Base
      def get_user_info(code)
        http_get("getuserinfo?access_token=#{access_token}&code=#{code}")
      end

      def get(userid)
        http_get("get?access_token=#{access_token}&userid=#{userid}")
      end

      def get_by_mobile(mobile)
        http_get("get_by_mobile?access_token=#{access_token}&mobile=#{mobile}")
      end

      def create(name, mobile, department = [1])
        params = {
          name: name,
          mobile: mobile,
          department: department
        }
        http_post("create?access_token=#{access_token}", params)
      end

      def get_list(dept_id, offset = 0, size = 100)
        http_get("list?access_token=#{access_token}&department_id=#{dept_id}&offset=#{offset}&size=#{size}")
      end

      private
        def base_url
          'user'
        end
    end
  end
end

