require "easy_geoip/client"
require "easy_geoip/response"

module EasyGeoIP
  module API
    module Query
      def query(ip = '')
        url          = url(ip)
        response     = EasyGeoIP::Client.get_json(url)
        standardized = standardize_response(response)

        EasyGeoIP::Response.new(standardized)
      end
    end
  end
end
