require "minitest_helper"

describe EasyGeoIP do
  let(:ip) { "8.8.8.8" }

  before do
    EasyGeoIP.api_service = nil
  end

  it "has a version number" do
    EasyGeoIP::VERSION.wont_be_nil
  end

  it ".api_serivce defaults to :freegeoip" do
    EasyGeoIP.api_service.must_equal :freegeoip
  end

  it ".api_serivce= sets @api_service to provided parameter" do
    EasyGeoIP.api_service = :freegeoip
    EasyGeoIP.api_service.must_equal :freegeoip
  end

  it ".configure accepts a block for configuration" do
    EasyGeoIP.configure do |config|
      config.api_service = :nekudo
    end
    EasyGeoIP.api_service.must_equal :nekudo
  end

  it ".configure accepts a hash for configuration" do
    EasyGeoIP.configure(api_service: :nekudo)
    EasyGeoIP.api_service.must_equal :nekudo
  end

  describe ".query" do
    it "uses the set @api_service when present" do
      EasyGeoIP::API::Nekudo.expects(:query).with(ip)

      EasyGeoIP.api_service = :nekudo
      EasyGeoIP.query(ip)
    end

    it "uses the default API when @api_service is nil" do
      EasyGeoIP::API::Freegeoip.expects(:query).with(ip)

      EasyGeoIP.query(ip)
    end
  end
end
