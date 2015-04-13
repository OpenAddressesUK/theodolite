---
title: Validation
layout: default
---

The address validation API is part of our [ingester module](https://openaddressesuk.org/about/docs#ingester) (or "Ernest").

Validation is an important part of the Open Addresses model for collaborative maintenance. It allows users to validate whether an address that is published by the platform actually exists. Every user of the platform benefits from this validation and every user can provide information through it. Our software consider this feedback when calculating a confidence score for an individual address. The confidence score then allows users of the data to take an informed decision as to how to use it.

You can see how we have implemented the validation API on our own website by looking at a single address, for example take the "tell us what you know about this address" link on this page: [https://openaddressesuk.org/addresses/ODK23N](https://openaddressesuk.org/addresses/ODK23N).

Alternatively read the detailed documentation at [https://ernest.openaddressesuk.org/](https://ernest.openaddressesuk.org/).