require "easy_geoip/api/query"

module EasyGeoIP
  module API
    module Telize
      extend Query

      private

      def self.url(ip)
        "https://www.telize.com/geoip/#{ip}"
      end

      def self.standardize_geodata(json)
        {
          ip:             json["ip"],
          country:        json["country"],
          country_code:   json["country_code"],
          city:           json["city"],
          region:         json["region"],
          region_code:    json["region_code"],
          postal_code:    json["postal_code"],
          continent_code: json["continent_code"],
          latitude:       json["latitude"],
          longitude:      json["longitude"],
          time_zone:      json["timezone"],
          isp:            json["isp"]
        }
      end
    end
  end
end
