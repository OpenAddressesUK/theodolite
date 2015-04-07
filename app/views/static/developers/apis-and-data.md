---
title: APIs and Data Download
layout: default
---

The Open Addresses platform exposes APIs to allow people and organisations to retrieve data from the platform, to build their own services, and to collaboratively maintain the data that the platform publishes.

The APIs are still in development but currently available to be freely used by anyone. We'd love your feedback so give them a try.

What do you want to do?

* <a href='#sortingoffice'>Parse an address</a>
* <a href='#search'>Search for an address(es) that match(es) certain criteria</a>
* <a href='#submitone'>Submit a single address</a>
* <a href='#submitmany'>Submit a large quantity of addresses</a>
* <a href='#confidence'>Learn how confident we are in an address</a>
* <a href='#validate'>Validate an address</a>

Do remember that we are still in development so be gentle with us and the APIs. If you do find a bug then we are very sorry. [Let us know](https://github.com/OpenAddressesUK/forum) and we will get it sorted.

We will be launching more APIs and features over the coming weeks so if you didn’t find a feature that you need then do [let us know](https://github.com/OpenAddressesUK/forum) and we will see what we can do.

<h2 id='sortingoffice'>Parse an address</h2>

We have named our address parsing API the 'Sorting Office'.

We use this API in the address submission box on the front-page of the website. It removes the need for a user to know how their address is structured, instead we do the hard work for them. Why not build it into your own user journeys?

Sorting Office takes a free-format text string and returns the address decomposed into building blocks (street name, locality, town, postcode...), along with any other information that we already hold about the address.

Sorting Office can simultaneously submit addresses to the platform by setting the 'Contribute' argument described in the documentation: [https://github.com/OpenAddressesUK/sorting_office#how-to-use](https://github.com/OpenAddressesUK/sorting_office#how-to-use).

By submitting addresses you, or your organisation become part of our collaborative model from which every user benefts. 

If you do choose to submit addresses in this way then please read and adhere to the [Submission Guidelines](https://github.com/OpenAddressesUK/sorting_office#subguidelines) and ensure that your site's terms and conditions provide appropriate information to your users.

Detailed documentation for this API can be found at [https://github.com/OpenAddressesUK/sorting_office](https://github.com/OpenAddressesUK/sorting_office).

A technical demonstration of the API can be found at [https://sorting-office.openaddressesuk.org/](https://sorting-office.openaddressesuk.org/).

<h2 id='search'>Search for address(es)</h2>

Our search API is at [https://openaddressesuk.org/addresses.json](https://openaddressesuk.org/addresses.json)

Simply specify the street, town and postcode arguments on the querystring.

* [https://openaddressesuk.org/addresses.json?street=camberwell](https://openaddressesuk.org/addresses.json?street=camberwell)
* [https://openaddressesuk.org/addresses.json?town=cheltenham](https://openaddressesuk.org/addresses.json?town=cheltenham)
* [https://openaddressesuk.org/addresses.json?postcode=se58qz](https://openaddressesuk.org/addresses.json?postcode=se58qz)

Partial search strings and multiple arguments are supported.

The response will provide you with all of the data matching your search terms including a persistent URL for each address, the addresses themselves in a format similar to the [British Standards Institute BS7666 standard](http://www.bsigroup.co.uk/en-GB/about-bsi/media-centre/press-releases/2006/7/Standardize-the-referencing-and-addressing-of-geographical-objects/#.VOxowLDkfp4), and the geographic centre of each address's postcode in latitude and longitude.

If you don’t fancy playing around with JSON but want to see how this API works then simply visit our [search page](https://openaddressesuk.org/addresses). Our website is built on our APIs.

<h2 id='submitone'>Submit an address</h2>

If you want to submit a single, or a small quantity of addresses, then the Sorting Office API can also do this for you.

Simply set the 'Contribute' argument described in the documentation: [https://github.com/OpenAddressesUK/sorting_office#how-to-use](https://github.com/OpenAddressesUK/sorting_office#how-to-use).

By submitting addresses you, or your organisation contributes to the platform and every user can benefit. If you choose to build Sorting Office into your user journey to help simplify your own work then why not contribute back to the community by submitting the resulting addresses to the platform?

If you do choose to submit addresses in this way then please read and adhere to the [Submission Guidelines](https://github.com/OpenAddressesUK/sorting_office#subguidelines) and ensure that your site's terms and conditions provide appropriate information to your users.

<h2 id='submitmany'>Submit a large quantity of addresses</h2>

To ingest large quantities of addresses we use an open-source tool called Turbot. Turbot was originally conceived by the great team at [OpenCorporates](http://opencorporates.com/).

Our version of Turbot and all of the necessary documentation and instructions can be found at [http://turbot.openaddressesuk.org/](http://turbot.openaddressesuk.org/).

If you do choose to submit addresses in this way then please read and adhere to our [Submission Guidelines](https://github.com/OpenAddressesUK/sorting_office#subguidelines).

<h2 id='confidence'>Learn how confident we are in an address</h2>

There is uncertainty in all data. It is important to recognise this. With our collaborative model to build and maintain address data we believe it is essential for us to embrace it.

Therefore we have built a way to determine how much we [trust address data](/blog/2015/02/20/confidence).

Our confidence API is exposed from the canonical Open Addresses graph database, [Ernest](https://ernest.openaddressesuk.org).

The address first needs to be structured into the BS7666 standard, for example by using the [Sorting Office API](/developers/apis-and-data#sortingoffice). 

When the address is submitted to the confidence API Ernest will return a confidence score between 1 and 1000.

It is not necessary for the address to exist in Ernest for the API to provide a confidence score.

Detailed documentation and sample code can be found at [Ernest](https://ernest.openaddressesuk.org).

<h2 id='validate'>Validate an address</h2>

The address validation API is part of our [ingester module](https://openaddressesuk.org/about/docs#ingester) (or "Ernest").

Validation is an important part of the Open Addresses model for collaborative maintenance. It allows users to validate whether an address that is published by the platform actually exists. Every user of the platform benefits from this validation and every user can provide information through it. Our software consider this feedback when calculating a confidence score for an individual address. The confidence score then allows users of the data to take an informed decision as to how to use it.

You can see how we have implemented the validation API on our own website by looking at a single address, for example take the "tell us what you know about this address" hyperlink on this page: [https://openaddressesuk.org/addresses/ODK23N](https://openaddressesuk.org/addresses/ODK23N).

Alternatively read the detailed documentation at [https://ernest.openaddressesuk.org/](https://ernest.openaddressesuk.org/).


<div prefix="dcat: http://www.w3.org/ns/dcat#
             foaf: http://xmlns.com/foaf/0.1/
             rdf: http://www.w3.org/1999/02/22-rdf-syntax-ns#
             dct: http://purl.org/dc/terms/">

<div typeof="dcat:Catalog" resource="http://alpha.openaddressesuk.org<%=request.path%>">

      <h1 property="dct:title">Open Addresses Data</h1>

      <p property="dct:description">
          The Open Addresses dataset is available through the <a href="/addresses">search function</a>; through <a href="/about/docs#publishingapis">the publishing APIs</a>; and for download on this page.
      </p>
<p>
             If you think that some of your or your organisation’s Intellectual Property has been published through the Open Addresses Platform please <a href="/about/reportaninfringement">report the infringement</a>.
</p>
      <p>
          The downloadable data was generated from the live platform on
          <span property="dct:issued" content='2014-12-10' datatype='xsd:date'><b>10 December 2014</b></a>.
      </p>
      <p>
          We plan to publish updated versions for download every time any of the <a href="/about/docs#sources">current sources of address data</a> change. When we start processing end-user contributions in Beta, the data for download will be re-generated nightly.
      </p>

    <p property="dct:license" resource="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/2/">
      The Open Addresses dataset is licensed as Open Data under the
      <a href="https://creativecommons.org/licenses/by/4.0/">
        <span property="dct:title">Creative Commons Attribution 4.0 International (CC BY 4.0) licence</span>
      </a>. The database contains data that, in its original form, was previously licensed under the UK Open Government Licence or the Ordnance Survey Open Data Licence, subject to Crown copyright and Crown database rights. Read more about our sources <a href="/about/docs#sources">here</a>.
    </p>

    <p property="dct:publisher" resource="http://openaddressesuk.org">
      Published by
      <a href="http://openaddressesuk.org" about="http://openaddressesuk.org" property="foaf:homepage">
        <span property="foaf:name">Open Addresses Ltd.</span>
      </a>
    </p>

    <script src='https://certificates.theodi.org/datasets/22687/certificate/badge.js'></script>

    <p>
      You will need a BitTorrent client in order to download the data. Each download type is available as one large file, or split by postcode sector
    </p>

    <div property="dcat:dataset" typeof="dcat:Dataset" resource="http://alpha.openaddressesuk.org<%=request.path%>#address-only">
      <h3 property="dct:title">Open Addresses dataset (downloadable, addresses-only)</h3>
      <p property="dct:description">
        This is the addresses-only version of the Open Addresses dataset. It includes the current list of addresses without provenance information. It is distributed as a single ZIP file, containing one ZIP file per postcode initial, containing one CSV file per <a href="http://en.wikipedia.org/wiki/Postcodes_in_the_United_Kingdom#Postcode_area">postcode area</a>. Each row in the CSV file is one address.
      </p>

      <h4>As a single file</h4>

        <p>
          <span property='dcat:distribution' typeof='dcat:Distribution'>
            <a class='btn btn-primary' href='/torrent?file=2014-12-10-openaddressesuk-addresses-only.csv.zip.torrent' property='dcat:accessURL'>
              <i class='fa fa-cloud-download'></i>
              <span property="dct:type" content="indirect-access">Download</span>
              <span property="dct:format" typeof="dct:IMT">
                <span content="text/csv" property="rdf:value">CSV</span>
              </span>
            </a>
          </span>

          <span property='dcat:distribution' typeof='dcat:Distribution'>
            <a class='btn btn-primary' href='/torrent?file=2014-12-10-openaddressesuk-addresses-only.json.zip.torrent' property='dcat:accessURL'>
              <i class='fa fa-cloud-download'></i>
              <span property="dct:type" content="indirect-access">Download</span>
              <span property="dct:format" typeof="dct:IMT">
                <span content="application/json" property="rdf:value">JSON</span>
              </span>
            </a>
          </span>
        </p>

      <h4>Split by postcode sector</h4>

        <p>
          <span property='dcat:distribution' typeof='dcat:Distribution'>
            <a class='btn btn-primary' href='/torrent?file=2014-12-10-openaddressesuk-addresses-only-split.csv.zip.torrent' property='dcat:accessURL'>
              <i class='fa fa-cloud-download'></i>
              <span property="dct:type" content="indirect-access">Download</span>
              <span property="dct:format" typeof="dct:IMT">
                <span content="text/csv" property="rdf:value">CSV</span>
              </span>
            </a>
          </span>

          <span property='dcat:distribution' typeof='dcat:Distribution'>
            <a class='btn btn-primary' href='/torrent?file=2014-12-10-openaddressesuk-addresses-only-split.json.zip.torrent' property='dcat:accessURL'>
              <i class='fa fa-cloud-download'></i>
              <span property="dct:type" content="indirect-access">Download</span>
              <span property="dct:format" typeof="dct:IMT">
                <span content="application/json" property="rdf:value">JSON</span>
              </span>
            </a>
          </span>
        </p>
    </div>

    <div property="dcat:dataset" typeof="dcat:Dataset" resource="http://alpha.openaddressesuk.org<%=request.path%>#full">
        <h3 property="dct:title">Open Addresses dataset (downloadable, full)</h3>
        <p property="dct:description">
          As above, but including:
          <ul>
            <li>references to the live, persistent URIs of each component of the address and of the address itself, and
            <li>provenance information.
          </ul>
          The CSV files in this distribution do not have one line per address, but one line <b>for each provenance element being described</b>. The actual address is repeated for every row. Rows referring to the same addresses can be identified as they have the same address URI (the 'url' column).
        </p>

        <h4>As a single file</h4>

        <p>
          <span property='dcat:distribution' typeof='dcat:Distribution'>
            <a class='btn btn-primary' href='/torrent?file=2014-12-10-openaddressesuk-full.csv.zip.torrent' property='dcat:accessURL'>
              <i class='fa fa-cloud-download'></i>
              <span property="dct:type" content="indirect-access">Download</span>
              <span property="dct:format" typeof="dct:IMT">
                <span content="text/csv" property="rdf:value">CSV</span>
              </span>
            </a>
          </span>

          <span property='dcat:distribution' typeof='dcat:Distribution'>
            <a class='btn btn-primary' href='/torrent?file=2014-12-10-openaddressesuk-full.json.zip.torrent' property='dcat:accessURL'>
              <i class='fa fa-cloud-download'></i>
              <span property="dct:type" content="indirect-access">Download</span>
              <span property="dct:format" typeof="dct:IMT">
                <span content="application/json" property="rdf:value">JSON</span>
              </span>
            </a>
          </span>
        </p>

        <h4>Split by postcode sector</h4>

        <p>
          <span property='dcat:distribution' typeof='dcat:Distribution'>
            <a class='btn btn-primary' href='/torrent?file=2014-12-10-openaddressesuk-full-split.csv.zip.torrent' property='dcat:accessURL'>
              <i class='fa fa-cloud-download'></i>
              <span property="dct:type" content="indirect-access">Download</span>
              <span property="dct:format" typeof="dct:IMT">
                <span content="text/csv" property="rdf:value">CSV</span>
              </span>
            </a>
          </span>

          <span property='dcat:distribution' typeof='dcat:Distribution'>
            <a class='btn btn-primary' href='/torrent?file=2014-12-10-openaddressesuk-full-split.json.zip.torrent' property='dcat:accessURL'>
              <i class='fa fa-cloud-download'></i>
              <span property="dct:type" content="indirect-access">Download</span>
              <span property="dct:format" typeof="dct:IMT">
                <span content="application/json" property="rdf:value">JSON</span>
              </span>
            </a>
          </span>
        </p>
    </div>


  </div>
</div>

