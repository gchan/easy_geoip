require "easy_geoip/client"
require "easy_geoip/geo_data"

module EasyGeoIP
  module Query
    def query(ip = "")
      url      = url(ip)
      json     = EasyGeoIP::Client.get_json(url)
      geo_data = standardize_geodata(json)

      EasyGeoIP::GeoData.new(geo_data)
    end
  end
end
