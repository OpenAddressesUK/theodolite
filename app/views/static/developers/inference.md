---
title: Inference API
layout: default
---

One of the techniques that we are using to build an address list without breaching copyright law is to infer the existence of addresses from other addresses. We have written a blog post discussing how this lets us [multiply addresses](/blog/2015/02/12/inference).

Our inference API is called [Jess](http://jess.openaddressesuk.org/) it takes a single address as an argument and is typically used when new addresses are submitted to the platform.

The address first needs to be structured into the BS7666 standard, for example by using the [Sorting Office API](/developers/apis-and-data#sortingoffice). 

When the address is submitted to the inference API Jess will look at other addresses in the database and return a list of addresses that we would infer based on the addition of this new addresses.

These addresses, plus your initial seed address, can then be added through our submissions APIs.

It is not necessary for the address to exist in the database for Jess to be able to perform inference

Detailed documentation and sample code can be found at [Jess](https://jess.openaddressesuk.org).