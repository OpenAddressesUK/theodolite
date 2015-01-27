---
author: Gianfranco Cecconi
title: Multiplying addresses
---

![Picture of a Shetlands landscape](blog/2015-01-28-inference_view_fae_shona_and_peters_by_peter_mackinnon.jpg "'view fae shona and peters', (C) Peter MacKinnon, https://www.flickr.com/photos/petemackinnon/7127622199'")

Postcode area 'ZE' is the *black sheep* of the launch edition of the Open Addresses UK dataset. It was generated (or “[distilled](https://openaddressesuk.org/about/docs)”) from our source data on 10th December 2014, and we knew only 117 addresses belonging to it at the time. (Actually, postcode area 'BT' - that describes Northern Ireland - is even worse. Its zone is empty for the time being, as we can't cover it because of data licensing restrictions, but bear with me.)

We can be forgiving with *ZE*. After all, it describes the Shetlands, islands off the north coast of Scotland, whose area is less than 600 square miles, covered by rugged, beautiful nature.

Let's take a look at the data for urban areas, as in the town of Lerwick. Take the street named Fogralea, in Sound: on the outskirts to the south-west of the town. [A simple search on the Open Addresses website](https://openaddressesuk.org/addresses?street=fogralea&town=shetland) shows just two addresses in the ZE1 0SE postcode: no. 5 and no. 30.

![Screenshot of Open Addresses' search page](blog/2015-01-28-inference_search_screenshot.png "Screenshot of Open Addresses' search page")

Or, if you know a little [R](http://en.wikipedia.org/wiki/R_%28programming_language%29), you can look in the dataset as shown in [this Gist](https://gist.github.com/giacecco/599b043ce333249b0f8b).

Could it be that 5 and 30 are the only two addresses in Fogralea? I don't know about you, but a little voice in my head is screaming: "Of course not!".

We can reasonably expect that most of the house numbers between 5 and 30 exist, too. That's what we call *inference*. We have *inferred* the existence of 24 addresses from the other 2. We can also be reasonably confident about the original two addresses, as they came from a reliable source at the time of distillation: [Companies House's "Free Company Data"](http://download.companieshouse.gov.uk/en_output.html). Repeating the exercise similar couple of addresses in *ZE* would allow us to infer 264 more addresses. That's more than doubling the size of the dataset we started from.

Now, the kind of inference we used is the simplest one can think of. It is simply based on experience and the knowledge we have of the numbering system used in addressing. The technique is not without error and we need to deal carefully with addresses generated this way. One of the inferred addresses, for example, may have been an old farm, demolished 50 years ago to make room for a new road. We won't know for sure until new sources or contributions from volunteers tell us (that's *you*, on your next hols in Scotland!).

Inference does not stop here. Our geographical data and mapping experts have tested heuristic techniques that are much more advanced. For example, say we had open mapping data whose licensing is compatible with ours (CC-BY 4.0). We could then use the actual shape of the street to assess which of the addresses we've inferred are less likely to exist than others. We could spot a side street that 'breaks' the continuity of the house numbers - where the farm in my example might have been. Mind-blowing :-)

In future blog posts we will describe how this more complex inference works, and how we can calculate rigorous statistical confidence for the addresses produced through inference, measuring the uncertainty I've described.

Open Addresses UK is not just about the team working at OA HQ: [we're looking for partners](https://openaddressesuk.org/blog/2015/01/22/crowdsourcing-challenge) and [contributors](https://openaddressesuk.org/about/addingdata), [our source code is open](https://github.com/openaddressesuk), [our planning is in the open](https://huboard.com/OpenAddressesUK/roadmap/). Perhaps you could write the next inference algorithm, or develop a surveying tool that volunteers can use to tell us if those inferred addresses actually exist or not. Follow us on Twitter at [@OpenAddressesUK](https://twitter.com/openaddressesuk) and keep in touch!

<sub><sup>The picture is ["view fae shona and peters"](https://www.flickr.com/photos/petemackinnon/7127622199), (C) Peter MacKinnon, licensed under CC-BY 2.0. </sup></sub>
