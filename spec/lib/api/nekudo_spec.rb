require "minitest_helper"

describe EasyGeoIP::API::Nekudo do
  let(:expected_response) do
    {
      city:           "Mountain View",
      country:        "United States",
      country_code:   "US",
      latitude:       37.386,
      longitude:      -122.0838,
      time_zone:      "America/Los_Angeles",
      ip:             "8.8.8.8",
      region_code:    nil,
      region:         nil,
      postal_code:    nil,
      isp:            nil,
      continent_code: nil
    }
  end

  it ".query returns a correct EasyGeoIP::GeoData" do
    VCR.use_cassette("nekudo") do
      response = EasyGeoIP::API::Nekudo.query("8.8.8.8")
      response.must_be_instance_of(EasyGeoIP::GeoData)

      expected_response.each do |attribute, value|
        response.send(attribute).must_equal value
      end
    end
  end

  it ".query can make a real request" do
    live_request do
      response = EasyGeoIP::API::Nekudo.query("8.8.8.8")
      response.must_be_instance_of(EasyGeoIP::GeoData)
      response.ip.must_equal "8.8.8.8"
    end
  end
end
