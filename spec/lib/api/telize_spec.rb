require "minitest_helper"

describe EasyGeoIP::API::Telize do
  let(:expected_response) do
    {
      longitude:      -122.0838,
      latitude:       37.386,
      ip:             "8.8.8.8",
      continent_code: "NA",
      city:           "Mountain View",
      time_zone:      "America/Los_Angeles",
      region:         "California",
      country_code:   "US",
      isp:            "Google Inc.",
      postal_code:    "94040",
      country:        "United States",
      region_code:    "CA"
    }
  end

  it ".query returns a correct EasyGeoIP::Response" do
    VCR.use_cassette("telize") do
      response = EasyGeoIP::API::Telize.query("8.8.8.8")
      response.must_be_instance_of(EasyGeoIP::Response)

      expected_response.each do |attribute, value|
        response.send(attribute).must_equal value
      end
    end
  end

  it ".query can make a real request" do
    live_request do
      response = EasyGeoIP::API::Telize.query("8.8.8.8")
      response.must_be_instance_of(EasyGeoIP::Response)
      response.ip.must_equal "8.8.8.8"
    end
  end
end
