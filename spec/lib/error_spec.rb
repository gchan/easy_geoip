require "minitest_helper"

describe EasyGeoIP::Error do
  it "has a superclass of StandardError" do
    EasyGeoIP::Error.superclass.must_equal StandardError
  end

  describe EasyGeoIP::Error::ClientError do
    it "has a superclass of EasyGeoIP::Error" do
      EasyGeoIP::Error::ClientError.superclass.must_equal EasyGeoIP::Error
    end

    it "is a descendent of StandardError" do
      EasyGeoIP::Error::ClientError.ancestors.must_include StandardError
    end
  end

  client_errors = %w(
    ConnectionFailed TimeoutError ResourceNotFound
  )

  client_errors.each do |client_error|
    klass = EasyGeoIP::Error.const_get(client_error)
    describe klass do
      it "has a superclass of EasyGeoIP::Error::ClientError" do
        klass.superclass.must_equal EasyGeoIP::Error::ClientError
      end

      it "is a descendent of StandardError" do
        klass.ancestors.must_include StandardError
      end
    end
  end
end
