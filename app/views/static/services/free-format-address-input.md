---
title: Free-Format Address Input
---

Make a website more accessible with our simple free-format address entry service that is suitable for all users, from those with high digital skills to those with less confidence.

This service is in **Alpha**.

You can try our simple, pre-packaged version of this service here:

<div id="openaddresses-form"></div>

(The contribution box is optional, on your own service you could include an appropriate clause in the terms and conditions.)

Free-format address input eases website user journeys, you can find details of some of our research [here](/blog/2015/05/13/free-format-user-research) and [here](/blog/2015/04/16/better-addresses-2).

It makes your website more accessible and increases order completion rates. This service is particularly useful for sites or apps where the user base includes people with have low digital skills. The service removes the need for address drop-down boxes or multi-field entry that requires users to know how an address is structured within your database. Instead the computer does the hard work. Your user's life is simpler.

This is a straightforward service to implement, powered by APIs that structure addresses based on our knowledge of roads, towns, postcodes and how they relate to one another.

The APIs do not rely on us having a full address list. In fact, they allow users to enter addresses of new properties. You can, if you choose, contribute those new addresses to the platform so that you and your users can help make UK address data better for everyone.

##### Implementation

We have built a simple, pre-packaged form for organisations that want to quickly embed this service. Instructions for how to include this form on your website can be found at [http://openaddressesuk.github.io/openaddresses_form/](http://openaddressesuk.github.io/openaddresses_form/).

Alternatively, if you wish to create your own version of this service you can use our [Sorting Office API](/developers/sortingoffice) and build your own. Some organisations may wish to check how [confident](/developers/confidence) we are in the results to determine whether an address is unusual enough to require an extra confirmation step with the user. That extra confidence step could include presenting the interpreted address back to the user for confirmation or correction before the user journey proceeds.

Some service providers may choose to go even further by [locating the address](/services/locate-addresses) and visualising the results on a map such as [OpenStreetMap](http://www.openstreetmap.org/) or [Ordnance Survey Open Map Local](http://www.ordnancesurvey.co.uk/business-and-government/products/os-open-map-local.html).

If you want our help in implementing the service, want to share your ideas or want to ask the community a question then we would suggest either using the [forums](https://github.com/OpenAddressesUK/forum) or dropping us an email to [info@openaddressesuk.org](mailto:info@openaddressesuk.org).