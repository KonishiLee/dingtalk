module Dingtalk
  module Api
    class Callback < Base

      def reg_callback url, tags = ['user_add_org', 'user_modify_org', 'user_leave_org', 'org_dept_create', 'org_dept_modify', 'org_dept_remove']
        params = {
            call_back_tag: tags,
            token: Dingtalk.suite_token,
            aes_key: Dingtalk.suite_aes_key,
            url: url
        }
        http_post("register_call_back?access_token=#{access_token}", params)
      end

      private

      def base_url
        'call_back'
      end

    end
  end
end
