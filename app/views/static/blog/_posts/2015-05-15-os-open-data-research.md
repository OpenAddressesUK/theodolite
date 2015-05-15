---
author: Fusion Data Science
title: New OS Open data Releases - Are they a game changer for open addressing?
---

This blogpost was commissioned by Open Addresses and is written by [John Murray](https://twitter.com/murraydata) of Fusion Data Science Limited.

In building Open Addresses, one of the main challenges we have faced is how to validate addresses, to be reasonably confident that they exist and are correct in the absence of a reference source such as PAF or AddressBase.

In our discovery phase, we undertook a considerable amount of research as a result of which we adopted a combination of complementary techniques including:

* [Lexical reference tables](/developers/docs), derived from open and public data sources
* [Statistical analysis of the frequency of address items in the database](/blog/2015/02/20/confidence)
* Spatial proximity between address elements
* [Data generated from user feedback](/developers/validation)

I was fortunate enough to have a preview of the recent [Ordnance Survey (OS) Open Data releases](/blog/2015/05/09/ordnance-survey-open-data), Open Map Local and Open Names, at the [Open Data Camp](/news/2015/02/24/apis-and-data-hunt) held in February in Winchester.

Openmap local was described as a vectorised version of the popular Ordnance Survey Street View open data product, providing a generalised high resolution (1:10000) view. Open Names is a hierarchical multi-level gazetteer providing an index of definitive place names, road names, road numbers and postcodes in the UK, together with their outline geometry of centroid and minimum bounding rectangle (MBR) coordinates.

After evaluating a sample of the new product provided to delegates at the Camp, I described the new products as “game changing” in terms of open data. The reason I believed this was that, when blended with other data, the new data provided Open Addresses with additional valuable reference data sets to describe the spatial context of address elements.

There are many applications, outside addressing, where this approach could be applied. Here are some examples outside of Open Addresses:

* In utilities, mapping the gas supply network to roads using DECC postcode level [energy consumption open data](https://www.gov.uk/government/statistical-data-sets/sub-national-energy-consumption-statistics).
* In census analysis, analysing the impact of neighbourhood topology on the demographic profile of an area.

The 2 new data sets were released in beta form by Ordnance Survey at the end of March, together with two complementary open data products Open Roads, a high-level, routable view of Britain's road network, and Open Rivers, showing rivers and canals, with generalised geometry and network connectivity.

For Open Addresses, these new data sets offer a new way of validating, correcting and inferring address components using their spatial connectivity, so, after [Open Addresses worked with Ordnance Survey to confirm some licensing details](/blog/2015/05/09/ordnance-survey-open-data), I set about evaluating their potential.

Unfortunately the road layer in Open Map Local is not routable, i.e. the roads are not continuous when other features, such as other roads, railways and waterways, cross above. Fortunately, the new Open Roads product is continuous and provides node connectivity points for junctions and road ends. It also contains more roads than the Open Map layer, including some private roads leading to properties, facilitating a greater understanding of the road topology.

Scripts were written to convert both datasets into spatial tables in the Open Addresses database.

To build the reference table for validation, spatial queries were used to match the geographic centre of postcodes (also known as postcode centroids) in Open Names to the nearest named roads geometry to provide a list of possible candidate roads ranked by distance to the nearest point on the road.

<%= image_tag("blog/2015-05-15-image-1.png", alt: "Postcodes and roads") %>

<sub><sup>Open Map Local showing relationship between postcode centroids (orange circles) and road geometry (purple lines)</sup></sub>

Once this candidate list is produced, Open Names allows us to determine the locality, town, county and administrative context for the roads .

Applying this approach to randomly selected postcode RG6 1QB yields:


<table cellpadding="5" cellspacing="5" border="1">
<tr>
	<td>Street</td>
	<td>Settlement</td>
	<td>County</td>
	<td>Distance(m)</td>
</tr>
<tr>
	<td>College Road</td>
	<td>Reading</td>
	<td>Reading</td>
	<td>15.98</td>
</tr>
<tr>
	<td>Bulmershe Road</td>
	<td>Reading</td>
	<td>Reading</td>
	<td>88.28</td>
</tr>
<tr>
	<td>Wokingham Road</td>
	<td>Reading</td>
	<td>Reading</td>
	<td>112.62</td>
</tr>
</table>
<p>&nbsp;</p>

A [search](https://alpha.openaddressesuk.org/services/locate-addresses) of the same postcode in the Open Addresses database shows that the street address is indeed College Road, Reading RG6 1QB, for which [4 entries exist](https://alpha.openaddressesuk.org/addresses?postcode=RG6+1QB).

During testing it was discovered that Open Names had incomplete data for 320,000 of the 2.7million named road segments.

To remedy this, the street geometry was matched where it is close to, allowing for slight scaling inaccuracies, a road with the same name. This then allowed the missing data to be recreated to a reasonable level of accuracy. We have reported the potential problem to Ordnance Survey,

Analysis of a sample of existing data in Open Addresses, suggested that in around 86% of cases, the nearest road found using spatial proximity, is the correct one for the postcode. Ambiguities and errors can exist in several scenarios due it being snapped to the nearest property:

* Where a postcode represents an off-road development, e.g. a business park or shopping centre.
* Where a postcode centroid is situated near the junction of 2 roads.
* In rural areas, where the property representing the centroid is some distance from the road.
* An address without a street element.

<%= image_tag("blog/2015-05-15-image-2.png", alt: "Ambiguous postcode and road join") %>

<sub><sup>A postcode centroid located close to the junction of 2 roads is ambiguous as to which road it belongs to.</sup></sub>

A feature of Open Names, found during the evaluation, is that OS settlement names, don’t conform exactly with postal geography, for example Southwark is classed as a town, rather than a suburb of London. To overcome this, the postal town can be inferred from the statistical data in the Open Addresses database.

#### Conclusion

Even this short evaluation has demonstrated that the new OS Open Data releases provide significant benefits to Open Addresses:

* using the spatial interrelationship between objects provides a valuable reference source to validate and infer addresses, although due to the potential ambiguities discovered, it works best when used in conjunction with the statistical algorithms within Open Addresses to provide an additional level of confidence
* the ability to determine the closest road to a postcode can significantly improve address services such as [free-format](/services/free-format-address-input) or [type-ahead](/services/type-ahead-address-input) address entry

For those curious enough to expand on or look into the detail of the research, the scripts and datasets produced during this evaluation have been published in the [OpenAddresses Github repository](https://github.com/OpenAddressesUK/OSSpatialResearch).

In conclusion, the evaluation exercise demonstrated that the inclusion of the new OS Open Names and Open Roads datasets would significantly improve the accuracy of validation, inference, confidence and services produced by Open Addresses.


