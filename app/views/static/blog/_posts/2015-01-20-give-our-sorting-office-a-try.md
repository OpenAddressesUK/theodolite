---
author: Stuart Harrison
title: Give our sorting office a try!
---

Addresses are hard. Really hard. Especially if you're a programmer. We've been [applying addresses to buildings since before the explosion in computing technology](http://www.huffingtonpost.co.uk/jeni-tennison/a-brief-history-of-open-a_b_6485628.html), and it shows.

Addresses are full of strange exceptions and things that programmers might miss when taking user input and trying to apply machine-like logic to it. (There's a [blog post called 'Falsehoods programmers believe about addresses'](https://www.mjt.me.uk/posts/falsehoods-programmers-believe-about-addresses/) which highlights some of the most well-known problems, if you want to read all the gory details.)

As the name of our particular game is addresses, this has been an issue we've had to get to grips with at an early stage, and, as we start accepting submissions from other developers, we know it's an issue that they'll have to deal with too.

For part of the past two weeks, we've tried to try and ease some of that pain for those who would come after us, and, using some of the logic which [Fusion Data Science](http://www.fusiondatascience.com/) used for importing addresses from Companies House, we have built [a web service that tries to take a single address and break it down into its constituent parts](https://github.com/OpenAddressesUK/sorting_office).

The service (which we've called [Sorting Office](https://sorting-office.openaddressesuk.org)) accepts an address as a `POST` request, and gives you back an address split up into a saon (Secondary Addressable Object - usually something like a flat number), a paon (Primary Addressable Object - usually a building name or number), a street, a locality, a town and a postcode.

For example, if you were to post the following to the web service like so:

    curl --data "address=10 Downing Street, London, SW1A 2AA" https://sorting-office.openaddressesuk.org/address

You'd get the following response in JSON format:

    {
      "saon": null,
      "paon": "10",
      "street": "Downing Street",
      "locality": null,
      "town": "London",
      "postcode": "SW1A 2AA"
    }

When a request is made, we work through the address, first extracting the postcode (which is probably the easiest part), then working backwards through the address, using [Elasticsearch](http://elasticsearch.org), and some extra parsing magic to work out the locality and town, finding streets that are close to the postcode and doing some matching to get the street, and then some logic at the end to work out the PAON  and the SAON.

If you're interested in exactly how we do this, then the [source code is open](https://github.com/OpenAddressesUK/sorting_office) for you to look at. We know it's not 100% perfect, so we would, of course be open to any pull requests. Have a look at the [Readme](https://github.com/OpenAddressesUK/sorting_office/blob/master/README.md) for more information on how to get it running locally, and some of the things we might need help with.

As the project moves on, and we start accepting user submitted data, we'll be providing wrapper libraries for our supported programming languages to make working with the service a bit easier. In the meantime, please feel free to have a play and try to break it! If there's anything you notice wrong, please feel free to [log an issue in the Github repo](https://github.com/OpenAddressesUK/sorting_office/issues).
