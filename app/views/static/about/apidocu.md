---
title: APIs
layout: default
---

The Open Addresses platform exposes APIs to allow people and organisations to retrieve data from the platform, to build their own services, and to collaboratively maintain the data that the platform publishes.

The APIs are still in development but currently available to be freely used by anyone. We'd love your feedback so give them a try.

What do you want to do?

* <a href='#search'>Search for an address(es) that match(es) certain criteria</a>
* <a href='#sortingoffice'>Parse an address</a>
* <a href='#submitone'>Submit a single address</a>
* <a href='#submitmany'>Submit a large quantity of addresses</a>
* <a href='#validate'>Validate an address</a>

Do remember that we are still in development so be gentle with us and the APIs. If you do find a bug then we are very sorry. [Let us know](https://github.com/OpenAddressesUK/forum/labels/development) and we will get it sorted.

We will be launching more APIs and features over the coming weeks so if you didn’t find a feature that you need then do [let us know](https://github.com/OpenAddressesUK/forum/issues?q=is%3Aopen+label%3Adevelopment+label%3A%22feature+requests%22) and we will see what we can do.

<h2 id='search'>Search for address(es)</h2>

Our search API is at [https://openaddressesuk.org/addresses.json](https://openaddressesuk.org/addresses.json)

Simply specify the street, town and postcode arguments on the querystring.

* [https://openaddressesuk.org/addresses.json?street=camberwell](https://openaddressesuk.org/addresses.json?street=camberwell)
* [https://openaddressesuk.org/addresses.json?town=cheltenham](https://openaddressesuk.org/addresses.json?town=cheltenham)
* [https://openaddressesuk.org/addresses.json?postcode=se58qz](https://openaddressesuk.org/addresses.json?postcode=se58qz)

Partial search strings and multiple arguments are supported.

The response will provide you with all of the data matching your search terms including a persistent URL for each address, the addresses themselves in a format similar to the [British Standards Institute BS7666 standard](http://www.bsigroup.co.uk/en-GB/about-bsi/media-centre/press-releases/2006/7/Standardize-the-referencing-and-addressing-of-geographical-objects/#.VOxowLDkfp4), and the geographic centre of each address's postcode in latitude and longitude.

If you don’t fancy playing around with JSON but want to see how this API works then simply visit our [search page](https://openaddressesuk.org/addresses). Our website is built on our APIs.

<h2 id='sortingoffice'>Parse an address</h2>

We have named our address parsing API the 'Sorting Office'.

We use this API in the address submission box on the front-page of the website. It removes the need for a user to know how their address is structured, instead we do the hard work for them. Why not build it into your own user journeys?

Sorting Office takes a free-format text string and returns the address decomposed intobuilding blocks (street name, locality, town, postcode...), along with any other information that we already hold about the address.

Detailed documentation for this API can be found at [https://github.com/OpenAddressesUK/sorting_office](https://github.com/OpenAddressesUK/sorting_office) whilst the API itself can be found at [https://sorting-office.openaddressesuk.org/](https://sorting-office.openaddressesuk.org/).

<h2 id='submitone'>Submit an address</h2>

If you want to submit a single, or a small quantity of addresses, then the Sorting Office API can also do this for you.

Simply set the 'Contribute' API argument described in the documentation: [https://github.com/OpenAddressesUK/sorting_office#how-to-use](https://github.com/OpenAddressesUK/sorting_office#how-to-use).

By submitting addresses you, or your organisation contributes to the platform and every user can benefit. If you choose to build Sorting Office into your user journey to help simplify your own work then why not contribute back to the community by submitting the resulting addresses to the platform?

If you do choose to submit addresses in this way then please read and adhere to the [Submission Guidelines](https://github.com/OpenAddressesUK/sorting_office#subguidelines).

<h2 id='submitmany'>Submit a large quantity of addresses</h2>

To ingest large quantities of addresses we use an open-source tool called Turbot. Turbot was originally conceived by the great team at [OpenCorporates](http://opencorporates.com/).

Our version of Turbot and all of the necessary documentation and instructions can be found at [http://turbot.openaddressesuk.org/](http://turbot.openaddressesuk.org/).

If you do choose to submit addresses in this way then please read and adhere to our [Submission Guidelines](https://github.com/OpenAddressesUK/sorting_office#subguidelines).

<h2 id='validate'>Validate an address</h2>

The address validation API is part of our [ingester module](https://openaddressesuk.org/about/docs#ingester) (or "Ernest").

Validation is an important part of the Open Addresses model for collaborative maintenance. It allows users to validate whether an address that is published by the platform actually exists. Every user of the platform benefits from this validation and every user can provide information through it. Our software consider this feedback when calculating a confidence score for an individual address. The confidence score then allows users of the data to take an informed decision as to how to use it.

You can see how we have implemented the validation API on our own website by looking at a single address, for example take the "tell us what you know about this address" hyperlink on this page: [https://openaddressesuk.org/addresses/ODK23N](https://openaddressesuk.org/addresses/ODK23N).

Alternatively read the detailed documentation at [https://ernest.openaddressesuk.org/](https://ernest.openaddressesuk.org/).
