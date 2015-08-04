require "easy_geoip/version"
require "easy_geoip/apis"

module EasyGeoIP
  extend self

  attr_accessor :api_service

  def configure(settings = {}, &block)
    apply_configuration(settings)

    yield self if block
    true
  end

  def query(ip = "")
    api.query(ip)
  end

  def api_service
    @api_service || :telize
  end

  private

  def api
    API.const_get(api_service.capitalize)
  end

  def apply_configuration(settings)
    settings.each do |attr, value|
      send("#{attr}=", value)
    end
  end
end
