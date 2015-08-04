require "minitest_helper"

describe EasyGeoIP::GeoData do
  let(:response) { EasyGeoIP::GeoData.new(attributes) }

  let(:attributes) do
    {
      city: "Mountain View",
      continent_code: "NA",
      country_code: "US",
      country: "United States",
      ip: "8.8.8.8",
      isp: "Google Inc.",
      latitude: 37.386,
      longitude: -122.0838,
      postal_code: "94040",
      region: "California",
      region_code: "CA",
      time_zone: "America/Los_Angeles"
    }
  end

  describe ".new" do
    it "can be initialized without a parameter" do
      EasyGeoIP::GeoData.new.must_be_instance_of EasyGeoIP::GeoData
    end

    it "can be initialized with attributes" do
      response.must_be_instance_of EasyGeoIP::GeoData
    end

    it "can be initialized with incomplete attributes" do
      EasyGeoIP::GeoData.new(ip: "8.8.8.8").
        must_be_instance_of EasyGeoIP::GeoData
    end

    it "ignores invalid attributes when initialized" do
      EasyGeoIP::GeoData.new(foo: "bar").wont_respond_to :foo
    end
  end

  describe "attributes" do
    it "stores attributes that are accessible" do
      attributes.each do |attribute, value|
        response.send(attribute).must_equal value
      end
    end

    it "returns nil for missing attributes" do
      EasyGeoIP::GeoData.new(ip: "8.8.8.8").city.must_be_nil
    end

    it "stores partial attributes that are accessible" do
      EasyGeoIP::GeoData.new(ip: "8.8.8.8").ip.must_equal "8.8.8.8"
    end
  end

  it "#to_hash returns attributes as Hash" do
    response.to_hash.must_be_instance_of Hash
    response.to_hash.must_equal attributes
  end

  it "#to_hash values are nil for missing attributes" do
    hash = EasyGeoIP::GeoData.new(ip: "8.8.8.8").to_hash

    attributes.each do |attribute, _value|
      next if attribute == :ip
      hash[attribute].must_be_nil
    end

    hash[:ip].must_equal "8.8.8.8"
  end

  it "#to_hash excludes invalid attributes from .new" do
    hash = EasyGeoIP::GeoData.new(foo: "bar").to_hash

    hash.keys.wont_include :foo

    attributes.each do |attribute, _value|
      hash.keys.must_include attribute
    end
  end
end
