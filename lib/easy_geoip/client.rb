require "faraday"
require "json"
require "easy_geoip/error"

module EasyGeoIP
  module Client
    def self.get(*args, &block)
      connection.get(*args, &block)
    rescue Faraday::ClientError => error
      handle_error(error)
    end

    def self.get_json(*args, &block)
      body = get(*args, &block).body
      JSON.parse(body)
    end

    private

    def self.connection
      @connection ||= Faraday::Connection.new do |connection|
        connection.adapter Faraday.default_adapter
        connection.use Faraday::Response::RaiseError
      end
    end

    def self.handle_error(error)
      case error
      when Faraday::ConnectionFailed
        raise EasyGeoIP::Error::ConnectionFailed.new error
      when Faraday::ResourceNotFound
        raise EasyGeoIP::Error::ResourceNotFound.new error
      when Faraday::TimeoutError
        raise EasyGeoIP::Error::TimeoutError.new error
      else # Faraday::ClientError
        raise EasyGeoIP::Error::ClientError.new error
      end
    end
  end
end
