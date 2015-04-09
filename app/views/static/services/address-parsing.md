---
title: Address Parsing
---

Turn unstructured addresses into useful information to help you make faster, automated decisions such as address matching.

This service is in **Alpha**.

A new demonstration of this service is coming soon but in the meantime why not play with our [technical demonstration](https://sorting-office.openaddressesuk.org) or read about how it is being used by a [political party](http://floppy.org.uk/blog/2015/03/16/provision-of-service-attack/)?

Addresses are received and stored in many different formats such as multi-line free text in letters, data stored in historic databases and systems or new data received through web forms. It can be difficult to act on address data because of its complexity.

The Open Addresses address parsing service can parse each of these formats into a common structure, turning address data into useful information. The resulting high-quality address data can be used to help you answer a wide range of questions:

+ Do these two addresses match?
+ Is this address good or bad?
+ Which regional team should I pass this incoming query to?

##### Implementation

This service uses our [Sorting Office API](/developers/sortingoffice) to parse data into a single, consistent format.

Some use cases, such as address matching or data cleansing, may also benefit from our [confidence API](/developers/confidence) to understand how confident we are that the parsed data is a real address.

If you want our help in implementing the service, want to share your ideas or want to ask the community a question then we would suggest either using the [forums](https://github.com/OpenAddressesUK/forum) or dropping us an email to [info@openaddressesuk.org](mailto:info@openaddressesuk.org).