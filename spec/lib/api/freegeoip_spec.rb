require "minitest_helper"

describe EasyGeoIP::API::Freegeoip do
  let(:expected_response) do
    {
      ip:             "8.8.8.8",
      country_code:   "US",
      country:        "United States",
      region_code:    "CA",
      region:         "California",
      city:           "Mountain View",
      postal_code:    "94040",
      time_zone:      "America/Los_Angeles",
      latitude:       37.386,
      longitude:      -122.084,
      isp:            nil,
      continent_code: nil,
    }
  end

  it ".query returns a correct EasyGeoIP::Response" do
    VCR.use_cassette("freegeoip") do
      response = EasyGeoIP::API::Freegeoip.query("8.8.8.8")
      response.must_be_instance_of(EasyGeoIP::Response)

      expected_response.each do |attribute, value|
        response.send(attribute).must_equal value
      end
    end
  end

  it ".query can make a real request" do
    live_request do
      response = EasyGeoIP::API::Freegeoip.query("8.8.8.8")
      response.must_be_instance_of(EasyGeoIP::Response)
      response.ip.must_equal "8.8.8.8"
    end
  end
end
