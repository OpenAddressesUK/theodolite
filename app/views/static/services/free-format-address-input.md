---
title: Free-Format Address Input
---

Make a website more accessible with our simple address entry service. Suitable for all users from those with high digital skills to those with less confidence.

This service is in **Alpha**.

*Demonstration coming soon. In the meantime you can see how we use it on our [own site](/get-involved/add-an-address).*

Free-format address input eases website user journeys. It makes your website more accessible and increases order completion rates. This service is particularly useful for sites or apps where the user base includes people with have low digital skills. The service removes the need for address drop-down boxes or multi-field entry that requires users to know how an address is structured within your database. Instead the computer does the hard work and your user's life is simpler.

This is a straightforward service to implement, powered by APIs that structure addresses based on our knowledge of roads, towns, postcodes and how they relate to one another.

The APIs do not rely on us having a full address list. In fact, they allow users to enter addresses of new properties and you can, if you choose, contribute those new addresses to the platform so that you and your users can help make UK address data better for everyone.

##### Implementation

To implement a basic version of this service you can use our [Sorting Office API](/developers/sortingoffice) to interpret the results of a simple text entry box.

Some organisations may wish to also check how [confident](/developers/confidence) we are in the results to determine whether an address is unusual enough to require an extra confirmation step with the user.

That extra confidence step is likely to include presenting the interpreted address back to the user for confirmation or correction before the user journey proceeds.

Some service providers may choose to go further by [locating the address](/services/locate-addresses) and visualising the results on a map such as [OpenStreetMap](http://www.openstreetmap.org/) or [Ordnance Survey Open Map Local](http://www.ordnancesurvey.co.uk/business-and-government/products/os-open-map-local.html).

If you want our help in implementing the service, want to share your ideas or want to ask the community a question then we would suggest either using the [forums](https://github.com/OpenAddressesUK/forum) or dropping us an email to [info@openaddressesuk.org](mailto:info@openaddressesuk.org).