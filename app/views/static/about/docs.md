---
title: Technology
layout: default
---

This document describes the Open Addresses solution for the *Alpha-4* phase (23 February 2015). It was last updated on 20 February 2015.

The description follows the flow of data processing from its third party public domain or open data sources down through the final Open Addresses database.

<%= link_to image_tag("docs/data_workflow_preview.png"), image_path("docs/data_workflow.png") %>

Click on the diagram to see the full version.

##Table of Contents

- <a href='#sources'>Our sources of data</a>
- <a href='#etls'>The Submission APIs and the ETL software modules ("Extract, Transform, Load")</a>
- <a href='#sortingoffice'>Sorting Office</a>
- <a href='#ingester'>The Ingester software module</a>
- <a href='#distiller'>The Distiller software module</a>
- <a href='#publishingapis'>The publishing APIs</a>
- <a href='#downloadable'>The downloadable Open Addresses database</a>
- <a href='#validationapis'>The validation APIs</a>
- <a href='#provenance'>How provenance is documented</a>

<h2 id='sources'>Our sources of data</h2>

Open Addresses uses three types of data:

- **reference data** of address "building blocks" such as post towns or postcodes,
- **addresses**, and
- **validation data**.

All of the data that we use is either free of third-party Intellectual Property Rights (IPR) or is fully licensed as open data with no constraints but for attribution. This is to assure compatibility with the licence we apply to the data Open Addresses publishes, that is [CC-BY 4.0 International](https://creativecommons.org/licenses/by/4.0/). Some candidate sources of addresses could not be used as they included third party IP that is not openly licensed. Find out more about these challenges and how you can help add more data in [this blog post](https://alpha.openaddressesuk.org/blog/2015/01/26/making-address-data-safe) or on our [Get Involved](/about/involved/) page.

###Reference data

For the Alpha-4 phase we used four reference datasets for the addresses' "building blocks":

- [Ordnance Survey's "OS Locator"](http://www.ordnancesurvey.co.uk/business-and-government/products/os-locator.html), from which we source our reference table of **road names**.
- [Ordnance Survey's "Strategi"](http://www.ordnancesurvey.co.uk/business-and-government/products/strategi.html), from which we source our reference table of **settlements (localities)**.
- [Wikipedia's "List of post towns in the United Kingdom" article](http://en.wikipedia.org/wiki/List_of_post_towns_in_the_United_Kingdom), from which we source our reference table of **post towns**, and
- The [Office for National Statistics' "ONS Postcode Directory (ONSPD)"](http://www.ons.gov.uk/ons/guide-method/geography/products/postcode-directories/-nspp-/index.html), from which we source our reference table of **postcodes**. Note that Northern Ireland's postcodes are dropped from the reference data as ["a separate licence for commercial use is required, direct from the Irish Land and Property Services"](http://www.ons.gov.uk/ons/guide-method/geography/beginner-s-guide/licences/index.html).

###Address data
Address data is either ingested from public domain/open data sources or submitted by our contributors, interactively or through APIs.

Alpha-4 uses two bulk sources for ingestion:

- [Companies House's "Free Company Data Product"](http://download.companieshouse.gov.uk/en_output.html), and
- An extract of [Spend Network's historical "TED" data](https://drive.google.com/folderview?id=0B46kGZDllbTKfjdMaU5OeXB2Qk1jaGhxNU9NUk5zRndlMDE3cWFTMF9YYnI1eXNHdmkyTUE&usp=sharing)

Both sources have been assessed not to include third party IP or to be appropriately licensed for re-use. In Company House's case, this was done throuh [FOI](https://www.whatdotheyknow.com/request/free_company_data_third_party_in).

Our contributors can submit addresses interactively using our [website](https://openaddressesuk.org) or using the [Sorting Office](https://sorting-office.openaddressesuk.org/) APIs and website.

###Validation data
Validation data is collected from our contributors interactively using our website or through APIs. Anybody can state if one of the address we publish exists or not. This information is then used to calculate the confidence score we associate to each addreess or building blocks.

###Updating the data
Apart from Spend Network's data, that was a one-off contribution, each of the sources described above are currently maintained and updated regularly by their respective publishers. It can happen, though, that they do not account for recent changes, such as new streets. During Beta we will be updating the reference data and bulk source data every time they are changed.

It is important to note that, for the time being, we also decided to ignore addresses whose building blocks (towns, street names...) cannot be matched against their respective reference tables. This approach will change in [future developments](https://github.com/OpenAddressesUK/roadmap/issues/81).

<h2 id='etls'>The Submission APIs and the ETL software modules</h2>

###The Common ETL
The reference data created from its sources described above by the software component we call *common ETL* (ETL as in "Extract, Transform, Load"). We consider the data highly reliable, hence it goes through minimal processing before being used by the platform.

You are welcome to review or contribute to the current version of the Common ETL on GitHub [here](https://github.com/OpenAddressesUK/common-ETL).

###The submission APIs (Turbot)
All ELTs but for the Common ETL described above run on a shared submission management platform implemented using Turbot: an open source software originally designed by [Open Corporates](https://opencorporates.com/) to manage their own data ingestion processes. Contributors can first develop and test their own ETLs "at home" and then deploy them to Turbot, where they will be verified by our team and scheduled to run periodically.

For the time being, Open Addresses uses a fork of the original Turbot; it is our ambition to merge our effort with Open Corporates' later in time.

You are welcome to review or contribute to the our version of Turbot on GitHub [here](https://github.com/OpenAddressesUK/turbot-client) for the command line client and [here](https://github.com/OpenAddressesUK/turbot-runner) for the "runner" component.

###The Companies House ETL
The software component that is responsible for interpreting Companies House Free Company Data Product for use in Open Addresses is the *Companies House ETL*. The addresses are stored as "free text" in the source, so an important responsibility of the ETL is to decompose the addresses in their components and normalise each of the components vs the reference tables, wherever suitable. As described above, addresses that cannot be matched vs the reference tables are discarded.

You are welcome to review a past version of the Companies House ETL on GitHub [here](https://github.com/OpenAddressesUK/common-ETL). The software is currently being rewritten to run within Turbot.

###Open Addresses' own inference “engine”
Some ETLs can be dedicated to "inferrring" addresses rather than ingesting it from one source or another. [Inference is the process by which we infer the existence of addresses from data we have about _other_ addresses](https://openaddressesuk.org/blog/2015/02/12/inference). Open Addresses' own inference engine will soon implement a basic algorithm described [here](https://github.com/theodi/shared/issues/504#issuecomment-72818881) and potentially many inference implementations could be run in parallel as long as they are complementary to each other.

<h2 id='sortingoffice'>Sorting Office</h2>
Sorting Office is an independent software component we developed to provide address normalisation services internally to other Open Addresses software components but also externally, as an API. Users of Sorting Office can use it also to submit addresses as they normalise them.

<h2 id='ingester'>The Ingester software module</h2>
The Open Addresses solution is designed to support a distributed set of ETL modules in the future, many of which may not necessarily be owned directly by Open Addresses but contributed and operated by other individuals or organisations.

The *Ingester* module - called internally "Ernest" in honour of Ernest Marples who was [postmaster general at the time of the introduction of postcodes in the UK](http://en.wikipedia.org/wiki/Ernest_Marples) - is the interface between Open Addresses and this *ecosystem* of contributing ETLs running on Turbot and the custodian of our "raw database".

We call it *raw* as we cannot make (yet) any general assumption on the quality of the addresses that are submitted to us to this point, but just store them for later processing. The Ingester's database need to be effective at dealing with large volumes of loosely structured, incomplete and duplicate addresses submissions.

It is also important for the Ingester to manage different submissions as if they were 'transactions'. This is useful, for example, in case we had concerns around any of the submission - e.g. any intellectual property not licensed for our use - so that we can take down that data while any necessary due diligence is performed.

You are welcome to review or contribute to the current version of the Ingester on GitHub [here](https://github.com/OpenAddressesUK/ernest).

<h2 id='distiller'>The Distiller software module</h2>
The Distiller module 'distills' the raw database into the best possible consistent set of addresses we can produce at the moment of execution.

For Alpha-4, this mainly means:

- identifying (most) duplicates; for example, data from Companies House can include more than one company registered at the same addresses, and
- document the provenance for the data from all the relevant information in the raw database.

In upcoming releases the Distiller's role will become much more substantial. It will detect misspellings and alternative spellings; manage contradicting sources for the same addresses; calculate [statistical scoring](https://openaddressesuk.org/blog/2015/02/20/confidence) for each address and its building blocks etc.

The Distiller is also responsible for creating unique identifiers for each unique component of all known addresses so that they can be referenced in a linked data fashion and published accordingly.

The Distiller is run every night to capture any address being submitted from non-bulk sources over the previous day.

You are welcome to review or contribute to the current version of the Distiller on GitHub [here](https://github.com/OpenAddressesUK/distiller).

<h2 id='publishingapis'>The publishing APIs</h2>
Open Addresses offers several APIs (Application Programming Interfaces) to integrate our live data into your applications. During Alpha cover the following functionality:

- We publish each address component (street, locality, post town and postcode) and each address as URIs (unique resource identifiers) so that they can be easily referenced from third party applications. The URIs have the following format:

		http://alpha.openaddressesuk.org/{addresses|streets|localities|towns|postcodes}.json/{identifier}

Open Addresses' own address for example is [http://alpha.openaddressesuk.org/addresses/ODK23N.json](http://alpha.openaddressesuk.org/addresses/ODK23N.json). If you browse this URL you will get its full JSON representation, including the references to its components (e.g. [http://alpha.openaddressesuk.org/postcodes/KmY4vG](http://alpha.openaddressesuk.org/postcodes/KmY4vG) for the postcode) and its provenance.

	{"address":{
	    "url":"http://alpha.openaddressesuk.org/addresses/ODK23N",
	    "sao":null,
	    "pao":"ST JAMES'S HOUSE BPE SOLICITORS",
	    "street":{
	        "name":{"en":["ST JAMES' SQUARE"],"cy":[]},
	        "url":"http://alpha.openaddressesuk.org/streets/77NwRC"
	    },
	    "locality":{
	        "name":{"en":[null],"cy":[]},
	        "url":null
	    },
	    "town":{
	        "name":{"en":["CHELTENHAM"],"cy":[]},
	        "url":"http://alpha.openaddressesuk.org/towns/pHQiLb"
	    },
	    "postcode":{
	        "name":"GL50 3PR",
	        "url":"http://alpha.openaddressesuk.org/postcodes/KmY4vG"
	    },
	    "provenance":{
	        (...)
	    }
	}}

- You can search the Open Addresses database by querying with an HTTP GET:

		http://alpha.openaddressesuk.org/addresses.json?town={town}&street={street}&postcode={postcode}

The parameters must be expressed in the query string and encoded accordingly, e.g. as in [http://alpha.openaddressesuk.org/addresses.json?street=st+james%27+square&town=Cheltenham](http://alpha.openaddressesuk.org/addresses.json?street=st+james%27+square&town=Cheltenham). For Alpha the match must be exact; in Beta we will introduce partial matching and the management of alternative spellings.

Browsing any of these URIs using a conventional Web browser will offer you a human-readable Web page of the data describing that address or address component. You can also request the data in JSON format, either by adding `.json` to the URI, or passing an `Accept: application/json` header in your request.

<h2 id='downloadable'>The downloadable Open Addresses database</h2>
Downloadable versions of the Open Addresses database are available, too. See the [download page](/data) for more detail.

The software module responsible for producing the downloadable versions has been named "Hippodamus" after [Hippodamus of Miletus](https://en.wikipedia.org/wiki/Hippodamus_of_Miletus): an ancient Greek architect, urban planner, physician, mathematician, meteorologist and philosopher commonly considered to be the 'father of urban planning'.

At the moment of writing the development of Hippodamus is on hold while completing the delivery and testing of Turbot.

You are welcome to review or contribute to the current version of the Hippodamus on GitHub [here](https://github.com/OpenAddressesUK/hippodamus/).

<h2 id='validationapis'>The validation APIs</h2>
The validation APIs allow users to produce the validation data described above. At the moment of writing the APIs are unconstrained and can be used from any third party application without the need for registration, e.g. by using this [sample code](https://openaddressesuk.org/assets/validate_address.js).

<h2 id='provenance'>How provenance is documented</h2>
Given the sensitiveness of the intellectual property matters surrounding address data in the UK, it is critical for Open Addresses to work fully in the open and to document in detail how our data is created or derived from its sources.

[All of our source code is published on GitHub](https://github.com/openaddressesuk) and the data we publish is available for distribution in formats that include sufficient provenance information to fully assess its origin. It is our ambition to give anybody the means to reproduce all of our work.

The typical provenance information associated to each address can be seen in the JSON code below, that is the provenance of Open Addresses' own address [https://openaddressesuk.org/addresses/ODK23N.json](https://openaddressesuk.org/addresses/ODK23N.json). It references the exact source code that was run and the data sources that were used, and when the data processing and the download took place.

	"provenance":{
		"activity":{
			"executed_at":"2014-12-01T15:49:55.563Z",
			"processing_scripts":"https://github.com/OpenAddressesUK/distiller",
			"derived_from":[
				{"type":"Source","urls":["http://ernest.openaddressesuk.org/addresses/814421"],"downloaded_at":"2014-12-01T15:49:55.563Z","processing_script":"https://github.com/OpenAddressesUK/distiller/tree/3de740587c878a18da85b1e95c957c575cde088a/lib/distil.rb"},
				{"type":"Source","urls":["http://alpha.openaddressesuk.org/postcodes/KmY4vG"],"downloaded_at":"2014-12-01T15:49:55.563Z","processing_script":"https://github.com/OpenAddressesUK/distiller/tree/3de740587c878a18da85b1e95c957c575cde088a/lib/distil.rb"},
				{"type":"Source","urls":["http://alpha.openaddressesuk.org/streets/77NwRC"],"downloaded_at":"2014-12-01T15:49:55.563Z","processing_script":"https://github.com/OpenAddressesUK/distiller/tree/3de740587c878a18da85b1e95c957c575cde088a/lib/distil.rb"},
				{"type":"Source","urls":["http://alpha.openaddressesuk.org/towns/pHQiLb"],"downloaded_at":"2014-12-01T15:49:55.563Z","processing_script":"https://github.com/OpenAddressesUK/distiller/tree/3de740587c878a18da85b1e95c957c575cde088a/lib/distil.rb"}]
		}
	}

Whenever technically and legally feasible [we also store unmodified copies of the source data for reference and due diligence](http://download.openaddressesuk.org.s3-website-eu-west-1.amazonaws.com/?prefix=sources_archive/), e.g. the four files listed in the example.

We are evaluating adopting a recognised standard for documenting provenance in Beta, such as W3C's [PROV](http://www.w3.org/TR/prov-dm/).
