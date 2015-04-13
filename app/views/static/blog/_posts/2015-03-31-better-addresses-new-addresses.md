---
author: Peter Wells
title: Better addresses - "It’s what our residents need"
---

Over the last few months we have been talking to various public sector organisations, both central government and local authorities, around the country.

There has been a great reaction from the public sector to the benefits that Open Addresses can bring:

+ making [new addresses available faster](https://alpha.openaddressesuk.org/blog/2015/02/09/living-breathing-problem) so that the people who live or work at these addresses can receive better services
+ publishing open data that is [safe for everyone to use](https://alpha.openaddressesuk.org/blog/2015/01/26/making-address-data-safe), from the smallest local charity to the largest service provider
+ helping to build digital services that better meet user needs and improve user experience

This is the first of a blog series focussing on how Open Addresses can help the public sector provide better services. In this blog we investigate common issues with new addresses and how Open Addresses can help.

#### Making new addresses available faster

We have already written a blogpost on the [human impact](https://alpha.openaddressesuk.org/blog/2015/02/09/living-breathing-problem) caused by the current legacy approach to creating and publishing new addresses. These issues affect every new house and every new office block.

Over the last few weeks we have learnt more about how much these issues are costing people, businesses and local authorities.

The delay in making new addresses available to the right people creates effort for a wide network of organisations: local authorities, utility companies (for example water or gas), Internet providers and online shopping. These organisations end up working together with those at new addresses in an attempt to overcome these challenges. The legacy processes used to publish new addresses are the root of this problem; until this is resolved the cost and time wasted will keep on stacking up.

As part of our mission to improve addresses in the UK we have investigated these processes. Many people have told us that new addresses contain third party rights and can not be published as open data. We wanted to discover whether this was true.

<iframe src="https://www.flickr.com/photos/129754713@N03/16697853256/player/" width="640" height="461" frameborder="0" allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen></iframe>

At the simplest level, if a property is being built and requires a new address then the local authority should be be notified by the property developer. The local authority then manages a process to create the new address and make it available.

Sometimes the property developer will request a specific address (possibly including a postcode) and in other cases the property developer may suggest an address. The new address request is negotiated between the property developer and local authority staff until both parties are comfortable with proceeding. 

The local authority staff will then pass the data (typically this includes a suggested postcode) to Geoplace and Royal Mail for further processing.

After this point Geoplace or Royal Mail may have a legal right over the address data and may object to it being released as open data by a local authority. That is the right of those organisations, but it creates a legal obstacle when trying to release address data as open data.

#### Making new addresses open data

Our recommendation is that local authorities simply release the data before it is passed to Geoplace and Royal Mail. The property developer and the people who will live and work there would clearly want the address to be as widely published as possible.

So, for a local authority to help solve [the problems that people experience](https://alpha.openaddressesuk.org/blog/2015/02/09/living-breathing-problem) in new addresses they, or their  suppliers, simply need to automate a process to send Open Addresses a copy of a new address at this point.

#### How to publish new addresses

If a local authority wants to publish new addresses singly our [Sorting Office API](https://sorting-office.openaddressesuk.org/) allows easy input of single addresses. If they prefer to input a batch of addresses our [Turbot ETL](http://turbot.openaddressesuk.org/) engine will be simplest and can also be easily automated. 

If a local authority wants help with either of those tools, or simply wants people to know that new addresses in their area are now being published as open data, then let us know on our [forums](https://github.com/OpenAddressesUK/forum).

The address may change between being passed to Open Addresses and the property build completing. Don't worry too much about this - it may also change after it is completed! As we receive the data we will apply a confidence factor to give clarity on how much people can [trust the address](https://alpha.openaddressesuk.org/blog/2015/02/20/confidence). Our collaborative maintenance model will then pick up any change in the address as it is used in our services.

#### How to use new addresses

Our platform will publish the address within days, rather than the months that the legacy processes can take.

The new addresses will be published through our linked data (URLs), through our web services ([APIs](https://alpha.openaddressesuk.org/about/apidocu)), or from the bulk [download](https://alpha.openaddressesuk.org/data).

Anyone can use the data to discover new addresses and to provide the services that the people who live and work there want and need.

#### “It’s what our residents need”

Finally, this blogpost is titled “it’s what our residents need”.

This is simply part of a quote from an address management department at a local authority we spoke to. We think it’s worth putting the quote in full:

> “The more people and services that know addresses faster the better. It’s what our residents need. Can you let us know when we can start sending you our addresses?”

As this post explains the answer is pretty simple.

You can send us addresses now.

Author: Peter Wells
