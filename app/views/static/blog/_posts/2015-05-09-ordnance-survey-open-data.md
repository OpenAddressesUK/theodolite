---
author: Peter Wells
title: Ordnance Survey Open Data
---

On International Open Data Data in February the Ordnance Survey made [a number of open data announcements](http://www.ordnancesurvey.co.uk/about/news/2015/os-drives-economic-growth-and-digital-innovation-through-open-data.html).

Our team were at [Open Data Camp](/news/2015/02/24/apis-and-data-hunt) in Winchester and had the fortune of being able to see early versions of the planned new open digital maps. They looked like they had a lot of potential but we were cautious.

The [legal position for UK address data](/blog/2015/01/26/making-address-data-safe) is complex. The Open Government Licence does not guarantee that there are no third party rights in the resulting data so, [as has been uncovered with the Land Registry Price Paid dataset](http://mapgubbins.tumblr.com/post/107499166390/it-was-all-a-dream-land-registrys-price-paid), some open data released under this licence cannot be safely used.

We needed to check whether the Ordnance Survey open data pump was infected with what we term “digital cholera”.

<iframe src="https://www.flickr.com/photos/23155134@N06/7644909976/in/photolist-cDyaoG-7cdAc1-bTb1SD-fTsbGK-bWm8e7-fxgv9E-a7AXKH-myE-pVwhGu-mEjGbG-egrCoz-7YidFs-duGzew-hZ2Hz7-q2krRa-bsfBkJ-mg6Zoa-2RBBFP-6U5Ue3-6U1UtD-g4CRvu-axXen5-dXkG7v-axUxor-axUwGc-axUHfa-axXqxY-axUH7X-axXeA7-axXqrw-rucRcz-axXffA-rxrrZ-4PoyjF-fxQJyW-ftm21K-ftm5QV-6U5VAq-6GeTAE-axXfnh-8aiemd-kY9bbT-axUx2D-ajs4aC-cGNXuh-7p1i49-axUwA4-p4HpXd-axUwnM-axXdHQ/player/" width="398" height="640" frameborder="0" allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>
*Image by [Don Graham](https://www.flickr.com/photos/23155134@N06/)*

So we wrote the Ordnance Survey a letter. The team there have now responded and we wanted to share that response with everyone.

**A response from the Ordnance Survey**

We would encourage you to [read the full response](https://drive.google.com/open?id=0B1fYm74bcUvYR09MQW13dTAwU2M&authuser=0) but for those who prefer a quick summary:

+ Did the new open data releases, specifically [OS Open Map - Local](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-map-local.html) and [OS Open Map - Roads](https://www.ordnancesurvey.co.uk/business-and-government/products/os-open-roads.html), contain any third party data that was not covered by the Open Government Licence?
+ Response: for both items “<the datasets are> made available for your use under the OGL terms. No further third party considerations need to be taken into account.”

Great, there are lists of maps and road names with no digital cholera!

+ Could we use OS Open Map - Local to derive new addresses whether through manual activity, [inference](blog/inference) or [confidence](blog/confidence)
+ Response: “As we have chosen to licence OS Open Map - Local using OGL we cannot impose restrictions on what data is created from it.”

Great, by using the maps and road names we would not be creating more digital cholera!

+ Could we discover the [Unique Property Reference Number (UPRN)](http://www.ordnancesurvey.co.uk/about/news/2015/uprn-release-sharing-location-data.html) for the addresses that we store?
+ Summary of the response: An organisation that is licensed to use [AddressBase](http://www.ordnancesurvey.co.uk/business-and-government/products/addressbase-products.html) can discover and release UPRNs for addresses without creating any licensing issue as long as they do not use any spatial data or geographic co-ordinates within AddressBase to discover the address. There is a more detailed policy statement [here](http://www.ordnancesurvey.co.uk/about/governance/policies/addressbase-uprn.html).

This answer is a bit more complicated. We would observe that this will leave other organisations that release datasets containing UPRNs linked to address records derived from AddressBase in the curious position of having some fields (e.g. the road name) having licencing restrictions whilst the UPRN itself is open data. But we think that we can work within the spatial restriction, we have clean address data and [we will work out a process](https://github.com/OpenAddressesUK/roadmap/issues/102) to add UPRNs to those address records if a UPRN exists. This brings us to our next question. 

+ Could we speedily allocate a UPRN when we discover a [new address](/blog/2015/03/31/better-addresses-new-addresses) that is not published in AddressBase?
+ Response: “Ordnance Survey, GeoPlace and Improvement Service are open to the idea of other methods of sourcing change intelligence and would welcome further dialogue on this topic”

We will keep up the discussion on this last point. We know that there are address records missing from the current datasets whilst increasing the speed of publishing new addresses will [improve people’s lives](/blog/2015/03/31/better-addresses-new-addresses). As we solve these problems we would like to see linked identifiers allocated to those addresses because of all the benefits that linked data can bring. The UPRN could be a choice for that linked identifier but we and our users will need a smooth, automated and speedy process.

**Updating the roadmap**

Thank you to the team at the Ordnance Survey for their responses.

We have started working these responses into the Open Addresses [roadmap](https://huboard.com/OpenAddressesUK/roadmap/#/). Some of the required actions are things that are best performed by our own technical team but others are marked as ones that [anyone can help with](https://github.com/OpenAddressesUK/roadmap/labels/can%20be%20done%20by%20community) so do take a look and get stuck in.

The answers on third party restrictions in OS Open Map - Local and OS Open Map - Roads are particularly promising. Simplifying the licensing position for address data is something that can help everyone who wants to improve UK address data: making it simpler, better and more suited to people’s needs.

Author: Peter Wells 
