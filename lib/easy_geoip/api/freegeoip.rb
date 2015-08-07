require "easy_geoip/query"

module EasyGeoIP
  module API
    module Freegeoip
      extend Query

      private

      def self.url(ip)
        "https://freegeoip.net/json/#{ip}"
      end

      def self.standardize_geodata(json)
        {
          ip:            json["ip"],
          country:       json["country_name"],
          country_code:  json["country_code"],
          city:          json["city"],
          region:        json["region_name"],
          region_code:   json["region_code"],
          postal_code:   json["zip_code"],
          latitude:      json["latitude"],
          longitude:     json["longitude"],
          time_zone:     json["time_zone"]
        }
      end
    end
  end
end
