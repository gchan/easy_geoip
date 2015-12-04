0.1.1
------
* Minor changes and grammatical fixes in README.
* The `ip` parameter for the `.query` method is now optional as specified in the README.
* Update tests to use another test URL as the previous one has a limit.
* Moved the `Query` module namespace up a level, removing it from the `API` scope.
* Changed the default geolocation service from Telize to Freegeoip.

#### YARD and Documentation
* Added yard as a development dependency
* Markup changes to support better YARD documentation generation.
* Add code documentation!

0.1.0 / 2015-08-03
------
First release of EasyGeoIP.

Supports the three following free IP lookup services:

* [Teilize](https://www.telize.com)
* [Freegeoip](https://www.freegeoip.net)
* [Nekudo](http://geoip.nekudo.com)