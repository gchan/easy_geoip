module EasyGeoIP
  class Error < StandardError
    # Generic Client Error
    ClientError = Class.new(Error)

    # ConnectionFailed from Faraday
    ConnectionFailed = Class.new(ClientError)

    # TimeoutError from Faraday
    TimeoutError = Class.new(ClientError)

    # ResourceNotFound from Faraday
    ResourceNotFound = Class.new(ClientError)
  end
end
