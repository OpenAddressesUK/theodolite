---
title: Confidence API
layout: default
---

There is uncertainty in all data. It is important to recognise this. With our collaborative model to build and maintain address data we believe it is essential for us to embrace it.

Therefore we have built a way to determine how much we [trust address data](/blog/2015/02/20/confidence).

Our confidence API is exposed from the canonical Open Addresses graph database, [Ernest](https://ernest.openaddressesuk.org).

The address first needs to be structured into the BS7666 standard, for example by using the [Sorting Office API](/developers/apis-and-data#sortingoffice). 

When the address is submitted to the confidence API Ernest will return a confidence score between 1 and 1000.

It is not necessary for the address to exist in Ernest for the API to provide a confidence score.

Detailed documentation and sample code can be found at [Ernest](https://ernest.openaddressesuk.org).