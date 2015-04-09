---
title: Search API
layout: default
---

Our search API is at [https://openaddressesuk.org/addresses.json](https://openaddressesuk.org/addresses.json)

Simply specify the street, town and postcode arguments on the querystring.

* [https://openaddressesuk.org/addresses.json?street=camberwell](https://openaddressesuk.org/addresses.json?street=camberwell)
* [https://openaddressesuk.org/addresses.json?town=cheltenham](https://openaddressesuk.org/addresses.json?town=cheltenham)
* [https://openaddressesuk.org/addresses.json?postcode=se58qz](https://openaddressesuk.org/addresses.json?postcode=se58qz)

Partial search strings and multiple arguments are supported.

The response will provide you with all of the data matching your search terms including a persistent URL for each address, the addresses themselves in a format similar to the [British Standards Institute BS7666 standard](http://www.bsigroup.co.uk/en-GB/about-bsi/media-centre/press-releases/2006/7/Standardize-the-referencing-and-addressing-of-geographical-objects/#.VOxowLDkfp4), and the geographic centre of each address's postcode in latitude and longitude.

If you don’t fancy playing around with JSON but want to see how this API works then simply visit our [search page](https://openaddressesuk.org/addresses). Our website is built on our APIs.