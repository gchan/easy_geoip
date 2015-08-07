require "easy_geoip/query"

module EasyGeoIP
  module API
    module Nekudo
      extend Query

      private

      def self.url(ip)
        "http://geoip.nekudo.com/api/#{ip}"
      end

      def self.standardize_geodata(json)
        {
          ip:            json["ip"],
          country:       json["country"]["name"],
          country_code:  json["country"]["code"],
          city:          json["city"],
          latitude:      json["location"]["latitude"],
          longitude:     json["location"]["longitude"],
          time_zone:     json["location"]["time_zone"]
        }
      end
    end
  end
end
