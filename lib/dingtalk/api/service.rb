module Dingtalk
	module Api
		class Service < Base

			def auth_info
				params = {
					suite_key: Dingtalk.suite_key,
					auth_corpid: corp_id,
					permanent_code: permanent_code
				}
				http_post("get_auth_info?suite_access_token=#{suite.suite_access_token}", params)
			end

			def suite
				Api::Suite.new
			end

			private
			def base_url
				'service'
			end
		end
	end
end

