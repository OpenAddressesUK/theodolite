---
author: Stuart Harrison
title: Open Addresses and UPRNs
---

If you've worked for any time in the public sector, and have been lucky enough to get a look at your organisation's hallowed address file, then you'll be familiar with the Universal Property Reference Number, or UPRN.

Pretty much every property in the country has a URPN, from mansions to cash machines (yes, cash machines attract business rates and are classed as properties), and, as the name suggests, this number uniquely identifies a property, so if I'm talking about UPRN 100023336956, you know I'm talking about 10 Downing Street, London SW1A 2AA, and I can reference that property in different systems.

Up until recently, these numbers have been a proprietary part of Ordnance Survey's AddressBase product, so couldn't be released as open data.

All this changed a few months ago, though, when, along with [releasing a whole bunch of new, high quality datasets](https://alpha.openaddressesuk.org/blog/2015/05/15/os-open-data-research), Ordnance Survey [allowed AddressBase users to release UPRNs as open data](http://www.ordnancesurvey.co.uk/about/news/2015/uprn-release-sharing-location-data.html).

You may initially think "Great! This solves all the problems with an open address database doesn't it? AddressBase users can just open up all their addressing data, OpenAddresses can suck all the data up and we'll have a lovely free dataset".

Unfortunately, this is not the case, while the dispensation allows the numbers to be released, the actual addresses themselves are not covered. This means that while, in theory, councils can release datasets with addresses and UPRNs as open data, if Open Addresses were to use this data, it may open us up to litigation by Royal Mail.

That said, we've added UPRNs to the main Open Addresses data model (and you can even [search by UPRN in the advanced search](https://alpha.openaddressesuk.org/addresses) now). But how do you add UPRNs to Open Addresses?

Originally, the only way you could submit data to [Turbot](http://turbot.openaddressesuk.org/) was by writing code that scrapes and submits full addresses, but we've now added functionality which allows you to write code which submits the URI of an address that exists in Open Addressses already, together with a UPRN.

Take, for example, a planning dataset which contains addresses and UPRNs (I've used [Peterborough Council's planning data](http://datasets.opendata.esd.org.uk/inventoryDataset?datasetId=10863)). We know the UPRNs can be used safely, but we're not sure about the actual addresses themselves. So, rather than submitting the whole address, we parse the addresses using [Sorting Office](http://sorting-office.openaddressesuk.org/), search the Open Addresses database for that address, and, if it exists, output the URI of the existing address and the UPRN as JSON like so:

    {
      "uri": "https://alpha.openaddressesuk.org/addresses/Af46sz",
      "uprn": "10002324314"
    }

Here's some very rough Ruby code I've prepared earlier:

    require 'csv'
    require 'httparty'

    CSV.foreach('planning-applications.csv', headers: true) do |row|
      # Make sure there's a legit UPRN in this row
      unless ['100000000000', '200000000000', '889000000000'].include?(row['UPRN']) || row['UPRN'].nil?
        address =  row['LocationText']
        uprn = row['UPRN']
        # Use sorting office to parse the address
        response = HTTParty.post("http://sorting-office.openaddressesuk.org/address", body: {address: address})
        # Make sure this is a valid address
        unless response['error'] || response['street'].nil? || response['town'].nil? || response['postcode'].nil?
          # Search for addresses with the street, town and postcode
          results = HTTParty.get("https://alpha.openaddressesuk.org/addresses.json?street=#{URI.escape response['street']['name']}&town=#{URI.escape response['town']['name']}&postcode=#{URI.escape response['postcode']['name']}")
          # Loop through the addresses
          results['addresses'].each do |result|
            # If the Primary Addressable Objects are equal, then we have a match!
            if result['pao'] == result['paon']
              puts address
              json = {
                "uri" => result['url'],
                "uprn" => uprn
              }.to_json
              puts json
            end
          end
        end
      end
    end

Running this code with the planning data as it stands unfortunately doesn't give us any results, but, as the Open Addresses database grows (we're currently importing millions of extra records, through [inference](https://alpha.openaddressesuk.org/blog/2015/02/12/inference)), and more councils start releasing datasets containing UPRNs, this theory could quite easily be put into practice.
