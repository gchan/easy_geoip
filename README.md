# EasyGeoip
[![Gem Version](https://badge.fury.io/rb/easy_geoip.svg)](http://badge.fury.io/rb/easy_geoip) [![Dependency Status](https://gemnasium.com/gchan/easy_geoip.svg)](https://gemnasium.com/gchan/easy_geoip) ![License](https://img.shields.io/badge/license-MIT-blue.svg)

[![Build Status](https://travis-ci.org/gchan/easy_geoip.svg?branch=master)](https://travis-ci.org/gchan/easy_geoip) [![Coverage Status](https://coveralls.io/repos/gchan/easy_geoip/badge.svg?branch=master)](https://coveralls.io/r/gchan/easy_geoip?branch=master) [![Code Climate](https://codeclimate.com/github/gchan/easy_geoip/badges/gpa.svg)](https://codeclimate.com/github/gchan/easy_geoip)

A common Ruby interface to retrieve IP-based [geolocation](https://en.wikipedia.org/wiki/Geolocation) information from various free and open source IP geolocation services.

No database downloads, no registration, no API keys, ~~no~~ [minimal](https://github.com/gchan/easy_geoip/blob/master/easy_geoip.gemspec#L27) dependencies. *Easy!*

![Easy!](https://github.com/gchan/easy_geoip/blob/master/easy.gif)

#### Quick Example

```ruby
EasyGeoIP.query("8.8.8.8")

=> #<EasyGeoIP::GeoData:0x007f91b9512960
 @city="Mountain View",
 @continent_code="NA",
 @country="United States",
 @country_code="US",
 @ip="8.8.8.8",
 @isp="Google Inc.",
 @latitude=37.386,
 @longitude=-122.0838,
 @postal_code="94040",
 @region="California",
 @region_code="CA",
 @time_zone="America/Los_Angeles">

# IPv6 is also supported
EasyGeoIP.query("2001:4860:4860::8888")
```

See the 'Usage' section for more information.

## IP Geolocation Services

EasyGeoIP currently supports the geolocation services listed below. All these services are free, open source, and require no registration or authentication.

Regardless of which service is used, geolocation information is returned in the same format for ease of use. See the `EasyGeoIP::GeoData` section below for more information.

#### Telize (Default) `:telize`
* **HTTPS**: Yes
* **Limits**: None
* **Open Source License**: MIT
* **GitHub Project**: https://www.github.com/fcambus/telize
* **Homepage**: https://www.telize.com

#### Freegeoip `:freegeoip`
* **HTTPS**: Yes
* **Limits**: 10,000 queries per hour
* **Open Source License**: BSD 3-clause
* **GitHub Project**: https://www.github.com/fiorix/freegeoip
* **Homepage**: https://www.freegeoip.net

#### Nekudo `:nekudo`
* **HTTPS**: No
* **Limits**: None, but fair use policy applies
* **Open Source License**: BSD 3-clause
* **GitHub Project**: https://www.github.com/nekudo/shiny_geoip
* **Homepage**: http://geoip.nekudo.com

All of the above services use data provided by [MaxMind](http://www.maxmind.com).

### Reliability

The services listed above are free, require no registration, and supported by volunteer developers. It it generally understood that such services are traditionally more likely to experience downtime or disruption.

If IP geolocation is mission-critical in your application, consider using a paid service to mitigate the risk of downtime and disruption.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_geoip'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easy_geoip


#### Supported Ruby versions
EasyGeoIP supports MRI Ruby 1.9+ and the JRuby and Rubinius equivalent. The specific Ruby versions we build and test on can be found at [TravisCI](https://travis-ci.org/gchan/easy_geoip).

## Usage

#### Configuration

EasyGeoIP supports a few free IP geolocation services; the default is [Telize](https://www.telize.com) but EasyGeoIP can easily be configured to use another service.

```ruby
# The default geolocation service is Telize
EasyGeoIP.api_service
=> :telize

# Variable assignment
EasyGeoIP.api_service = :nekudo

# Calling `.configure` with Hash argument
EasyGeoIP.configure(api_service: :freegeoip)

# Calling `.configure` with a block
EasyGeoIP.configure do |config|
  config.api_service = :telize
end
```

#### Querying IPs - One Method to Rule Them All

Use the `query` method to retrieve geolocation information for a specified IPv4 or IPv6 address. An instance of `EasyGeoIP::GeoData` is returned.

```ruby
EasyGeoIP.query("8.8.8.8")

# `EasyGeoIP::GeoData` object is returned
=> #<EasyGeoIP::GeoData:0x007f91b9512960
 @city="Mountain View",
 @continent_code="NA",
 @country="United States",
 @country_code="US",
 @ip="8.8.8.8",
 @isp="Google Inc.",
 @latitude=37.386,
 @longitude=-122.0838,
 @postal_code="94040",
 @region="California",
 @region_code="CA",
 @time_zone="America/Los_Angeles">
```

**Bonus** - Pass in `nil`, an empty string or no arguments and the default geolocation service, [Telize](https://www.telize.com) will return the geolocation information for your IP address!

```ruby
EasyGeoIP.query(nil)
EasyGeoIP.query("")
EasyGeoIP.query
```

#### EasyGeoIP::GeoData

Regardless of which service you use, geolocation information is returned as a `EasyGeoIP::GeoData` object where its attributes are easily accessible. Calling `#to_hash` returns all information as a `Hash`.

```ruby
geo_data = EasyGeoIP.query("8.8.8.8")

geo_data.city           # => "Mountain View"
geo_data.continent_code # => "NA"
geo_data.country        # => "United States"
geo_data.country_code   # => "US"
geo_data.ip             # => "8.8.8.8"
geo_data.isp            # => "Google Inc."
geo_data.latitude       # => 37.386
geo_data.longitude      # => -122.0838
geo_data.postal_code    # => "94040"
geo_data.region         # => "California"
geo_data.region_code    # => "CA"
geo_data.time_zone      # => "America/Los_Angeles"

# Return a Hash of all attributes
geo_data.to_hash

=> {:ip=>"8.8.8.8",
 :country=>"United States",
 :country_code=>"US",
 :city=>"Mountain View",
 :region=>"California",
 :region_code=>"CA",
 :postal_code=>"94040",
 :continent_code=>"NA",
 :latitude=>37.386,
 :longitude=>-122.0838,
 :time_zone=>"America/Los_Angeles",
 :isp=>"Google Inc."}
```

#### Errors

In addition to the usual Ruby errors and exceptions, EasyGeoIP can raise the following errors:

* `EasyGeoIP::Error::ClientError`
* `EasyGeoIP::Error::ConnectionFailed`
* `EasyGeoIP::Error::TimeoutError`
* `EasyGeoIP::Error::ResourceNotFound`
* `EasyGeoIP::Error::ParsingError`

All of the above error classes inherit `EasyGeoIP::Error::ClientError`, `EasyGeoIP::Error`, and `StandardError`.

## Contributing & Development

Please view [CONTRIBUTING.md](https://github.com/gchan/easy_geoip/blob/master/CONTRIBUTING.md) for contributing and development information.

## License

EasyGeoIP is Copyright (c) 2015 Gordon Chan and is released under the MIT License. It is free software, and may be redistributed under the terms specified in the LICENSE file.
