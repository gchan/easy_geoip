module EasyGeoIP
  class GeoData
    attr_reader :ip, :country, :country_code, :city, :region, :region_code,
                :postal_code, :continent_code, :latitude, :longitude,
                :time_zone, :isp

    def initialize(attributes = {})
      @ip             = attributes[:ip]
      @country        = attributes[:country]
      @country_code   = attributes[:country_code]
      @city           = attributes[:city]
      @region         = attributes[:region]
      @region_code    = attributes[:region_code]
      @postal_code    = attributes[:postal_code]
      @continent_code = attributes[:continent_code]
      @latitude       = attributes[:latitude]
      @longitude      = attributes[:longitude]
      @time_zone      = attributes[:time_zone]
      @isp            = attributes[:isp]
    end

    def to_hash
      {
        ip:             ip,
        country:        country,
        country_code:   country_code,
        city:           city,
        region:         region,
        region_code:    region_code,
        postal_code:    postal_code,
        continent_code: continent_code,
        latitude:       latitude,
        longitude:      longitude,
        time_zone:      time_zone,
        isp:            isp
      }
    end
  end
end
