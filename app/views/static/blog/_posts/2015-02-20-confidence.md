---
author: Gianfranco Cecconi
title: Trusting addresses
---

This is Open Addresses UK's registered office address:

<table cellpadding="5" cellspacing="5" border="1"><tr><td>
St James' House<br>
St James Square<br>
Cheltenham<br>
GL50 3PR
</td></tr></table>

Humans will immediately recognise this as an address and spot most of its components: postcode (GL50 3PR), town (Cheltenham) and so on. Computers perform relatively well at that, too, as we outlined [in a previous blog post](https://openaddressesuk.org/blog/2015/01/23/give-our-sorting-office-a-try) describing our "Sorting Office".

But how do we know if an address is _real_? It definitely _looks_ real, but what if there was no St James Square in Cheltenham? What if GL50 3PR wasn't one of Cheltenham's postcodes?

Human error lies around every corner, particularly as so much address information was and still is captured and processed on paper, and possibly not validated for consistency when input to software. It doesn't take much to make an error when writing a postcode, as in "GL5O 3PR"... can you see it? There's an "O" as in "Oscar" in place of the zero. Think if you had that in my handwriting, would you actually tell a zero from an "o"?

<table cellpadding="5" cellspacing="5" border="1"><tr><td>
<%= image_tag("blog/2015-02-20-confidence_1.png", alt: "Hand-written GL5O 3PR") %>
</td></tr></table>

Intuitively, it's likely you will think that this problem can't be that much of a headache. Surely, there must be good open data lists of what towns exist, what streets exist and what streets exist in which town etc. How hard can it be for Open Addresses UK to verify that GL50 3PR is a Cheltenham postcode and that St James Square belongs to that postcode?...

... but you would be wrong. The first kind of information is available: we have individual lists of building blocks such as the list of towns, the list of postcodes etc. The second kind of information is not, at least at the moment of writing.

To source the first kind of information, today Open Addresses UK relies on four open data sources:

- [Ordnance Survey's "Locator"](http://www.ordnancesurvey.co.uk/business-and-government/products/os-locator.html), from which we source our reference table of road names;
- [Ordnance Survey's "Strategi"](http://www.ordnancesurvey.co.uk/business-and-government/products/strategi.html), from which we source our reference table of settlements (localities);
- [Wikipedia's "List of post towns in the United Kingdom" article](http://en.wikipedia.org/wiki/List_of_post_towns_in_the_United_Kingdom), from which we source our reference table of post towns, and
- [The Office for National Statistics' "ONS Postcode Directory (ONSPD)"](http://www.ons.gov.uk/ons/guide-method/geography/products/postcode-directories/-nspp-/index.html), from which we source our reference table of postcodes.

Unfortunately, **these four sources are independent of each other**. For example, neither OS Locator nor OS Strategi tell us which roads belong to which localities or _vice versa_. This means that we can use these tables only as "dictionaries", for example the tables will confirm that a town called "Cheltenham" exists, and that a few "St James Squares" exist in the UK, but not that there is a St James Square in Cheltenham!

#### Enter statistical confidence

As the address data we have grows in volume, though, we have another valuable resource we can rely upon: we can observe road names, localities, towns and postcodes **being named together** in our data.

In other words, we may not have much trust in a single occurrence of our address:

<table cellpadding="5" cellspacing="5" border="1"><tr><td>
St James' House<br>
St James Square<br>
Cheltenham<br>
GL50 3PR
</td></tr></table>

But the moment we see another similar address being added to our data, even an incomplete one such as:

<table cellpadding="5" cellspacing="5" border="1"><tr><td>
St James North 1<br>
St James Square<br>
Cheltenham
</td></tr></table>

... then we have **one more hint that there's a St James Square in Cheltenham**. Multiply that by the dozens, and our _statistical confidence_ in the fact that there is a St James Square in Cheltenham improves.

Moreover, as the Open Addresses database grows through ingestion of new sources or user submissions, more and more occurrences of the same address will give us **further confidence that the full address exists, too**.

#### Enter confidence scoring

Statistics is not enough, though. There are many elements worth considering that do not come from the rigour of maths but contribute significantly to the level of trust we can or cannot put into an address. A good example is the age of the data we process.

Intuitively, you wouldn't trust an address that someone gave you _last year_ "to the same extent as" the same address given to you by someone _yesterday_. We all know that places change, houses are demolished and re-built, Local Authorities create streets and new developments, sometimes entire geographical areas are even "re-coded" against different postcodes (a recent large scale example is Cambridge in 2006).

At Open Addresses, we tweak the results of our statistical calculations, modifying them based on criteria like the age of the information we're using. These criteria change the statistical confidence into something that is not any longer just a probability estimate but rather a "score", hence the "confidence scoring" term. To avoid confusion with probabilities, our scoring range goes from 0 to 1,000. The higher the score, the more trustworthy the address.

#### Help, my head is spinning!

Now, don't panic! Accepting that there is uncertainty behind the data we deal with is a healthy thing to do, not an issue. And uncertainty can come at all levels:

- Our sources can include mistakes, or simply may not be up to date. For example, when a new street is created in a new development, it will take some time before our source for that, Ordnance Survey's "Locator", is updated. This is also why we plan to start processing submissions that refer to address building blocks that don't have a match in our existing reference tables.
- Our addresses can include mistakes: the addresses published by Companies House are not programmatically validated against a reference address database ([which is one of the reasons we can use them!](https://openaddressesuk.org/blog/2015/01/26/making-address-data-safe)) and can therefore contain errors such as misspellings.
- Third parties' addresses datasets are affected by the same issue, in different ways, as all describe a fluid reality. For example, if another address dataset was created just through the contribution of people walking the streets, the dataset would naturally miss any changes that happened between surveys.

So Open Addresses UK recognises and embraces the uncertainty that exists in all data In the next few weeks we will openly:

- incorporate your feedback on the scoring specifications discussed above;
- publish a confidence score alongside each of the addresses we publish; and
- proactively seek for the public and organisations' contribution in validating / correcting / surveying our addresses, hence further improving the confidence we can put in the data every day.

#### Why are you doing this?

There is value in being able to measure the trust we can put in an address, and there are opportunities enabled by it.

The best example comes from logistics. Think of shipping companies that already today carefully plan their drivers' journeys to optimise time and travel, minimise the traffic they find, optimise fuel consumption and environmental footprint.

Confidence scoring will enable these organisations to also calculate how likely the addresses they have as the driver's destinations for the day are safe or may become a problem. This information will allow them to give better answers to questions such as:

- How much time must be accounted for to manage a trouble destination?
- Can I make a better estimate of the exact delivery time? and...
- ...  can I improve my service by offering that to my clients?
- Which addresses on my driver's schedule are most at risk? Can I take any pre-emptive action to verify them before attempting delivery?
- If a destination address is likely wrong, what are the best possible alternative addresses the sender really meant to ship the parcel to?
- What time will my driver's shift finish, so that I can plan for the van maintenance?  

... and more!

#### Calculating statistical scores

There's [an entire paper](https://docs.google.com/a/openaddress.es/document/d/1955JNRhDGMckIRObgS-9cEduY5p6cX6fKMjY-peSE8Q/edit) we've prepared specifying how confidence scoring happens at Open Addresses. Its detail is unsuitable to this blog post but we would love to hear your thoughts and suggestions for improvements. As with everything we do, the source code that we write will also be open and posted to our GitHub repository, so that you can replicate the results for yourself.

##### Come and visit us at ODCamp for International Open Data Day 2015

The Open Addresses UK team is at ODCamp in Hampshire this weekend, as part of International Open Data Day. We would love to see you there and have your help in creating the first fully open address list for the UK.

Author: Gianfranco Cecconi
