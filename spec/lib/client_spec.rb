require "minitest_helper"

describe EasyGeoIP::Client do
  let(:url)      { "http://jsonip.com" }
  let(:response) { stub(body: "{\"a\": \"b\"}") }

  describe ".get" do
    it "delegates to Faraday::Connection" do
      Faraday::Connection.any_instance.stubs(:get).
        with(url).returns(response)

      EasyGeoIP::Client.get(url).must_equal response
    end

    errors = %w(
      ConnectionFailed ResourceNotFound TimeoutError ClientError
    )

    errors.each do |error|
      it "EasyGeoIP::Error::#{error} is raised on Faraday::#{error} error" do
        Faraday::Connection.any_instance.stubs(:get).
          raises(Faraday.const_get(error), "message")

        -> { EasyGeoIP::Client.get(url) }.
          must_raise(EasyGeoIP::Error.const_get(error))
      end
    end
  end

  describe ".get_json" do
    it "delegates to .get and returns a Hash of JSON response" do
      EasyGeoIP::Client.stubs(:get).returns(response)

      EasyGeoIP::Client.get_json(url).must_equal("a" => "b")
    end
  end

  it "can make a real request" do
    live_request do
      EasyGeoIP::Client.get_json(url).must_be_instance_of Hash
    end
  end
end
