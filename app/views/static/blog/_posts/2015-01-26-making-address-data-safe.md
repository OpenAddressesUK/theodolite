---
author: Peter Wells
title: Making Address Data Safe to Use
---

#### Cholera and Open Data

I spoke at an [event for geographic services recently](http://geomobldn.org/post/102358677210/first-geomob-of-2015-13th-january-back-at-ucl), it was great fun but one of the presentations reminded me of one of our greatest challenges. It is one that the Open Addresses UK team are spending significant time thinking about and working on; we need to tackle it to make our service [available for everyone](https://alpha.openaddressesuk.org/about/vision).

The event had fantastic presentations on some of the themes that are close to our heart: location-based services, geography and accessibility but it wasn't those that captured my attention.

The presentation that most caught my eye had a darker theme.

Robin Wilson talked about his [open data](http://blog.rtwilson.com/john-snows-cholera-data-in-more-formats/) version of [John Snow's maps](http://en.wikipedia.org/wiki/John_Snow_(physician)#Cholera) of the fatal cholera outbreak in 1854. John Snow used some basic techniques of what we would now call data science to trace the source of the outbreak to a contaminated water pump. The water pump was poisoned, it wasn't safe to use.

Just like Snow's water pump, there are open data sources that aren't safe to use. This is because they contain third party intellectual property rights (IPR) that have not been explicitly openly licensed. There are good reasons to have copyright law that protect IPR but from the perspective of the open data user the dataset is poisoned. There is a risk in using it.

#### Open data: is it safe to use?

[Open data is a term](http://opendefinition.org/) that should only be used if the data can be used by anyone for any purpose. Open data that is safe to use does not expose people to the risk of legal action from third parties who did not give explicit permission for their intellectual property to be included in an open data release.

A data publisher is liable for any inappropriate use of third party data and in some cases so will their users. The impact can be severe. If the third party owner asserts their rights then the publisher and the user might need to change their business processes, pay a licence fee, or even stop offering a service. If a settlement can't be reached then the third party might take the publisher and users to court.

Intellectual property law in the UK is complex, with some of it, particularly that concerning rights over data, untested in court. For now no one can say for certain how far intellectual property rights in data extend, or what constitutes extracting or reusing data. This makes it difficult for people to be certain whether anything they wish to do might infringe third party rights or even if those rights exist at all. The best that can be done is to try to understand the level of risk.

Users of open data need to be aware of these issues and risks, they can affect any dataset. But some responsibility also has to lie with the publisher, particularly when they are encouraging certain behaviour from their users.

#### Open Addresses’ approach

There are tens of thousands of people and organisations in the UK that want to use address data to build products and deliver services. We hope that many of them will choose to use our new open address dataset in the future.

We want them to be able use the data for any purpose, whether commercial or not. We want them to be able combine it with other datasets and create exciting and innovative new products and services. We believe that these aims mean that we have a level of responsibility to protect our users against these legal risks.

It's essential that people have confidence in our data so that they can use it to build whichever new products and services they want to. That is the behaviour we are encouraging: we don't want to simply make a list of addresses that is available to everyone; we want to publish a list of addresses *that is safe for everyone to use for any purpose*.

Our approach to addressing this problem is causing us to invest significant effort in consulting lawyers and developing processes and technology. We know that the job is not complete, but we think the effort will be worth it.

To ensure that we publish safe data we are implementing the following model:

* a publishing platform which allows members of the public to contribute data, or datasets;
* guidelines that discourage contributions that are plainly unlawful (i.e. the contribution of an extract from a database which violates others' intellectual property rights) or incompatible with our desired licence;
* tools and processes to spot possible unlawful use;
* tracking provenance of data throughout the model to provide transparency on data sources; and
* a clear “takedown” policy that will be followed by our team

We are a neutral platform for hosting address data and cannot be responsible for the data that our users upload, but we do take others’ rights seriously and will try to avoid infringing them.

This approach both protects us and protects our users.

#### Is there another way?

Some people might question why we need to go to this level of detail and cost. Surely there are many clean sources of address data in the UK?

Many have suggested that we should use the marvellous [OpenStreetMap](http://www.openstreetmap.org/#map=5/51.500/-0.100) dataset. Can that be used?

Unfortunately not. OpenStreetMap has chosen to use a [share-alike licence](http://www.openstreetmap.org/copyright), which means that both Open Addresses and users of the data that Open Addresses publishes would have to adopt the same licence if we were to reuse their data. In our [Discovery phase](http://theodi.org/blog/the-open-addresses-symposium) we learnt that publishing data with this licence would discourage many potential users of Open Addresses, in particular commercial users of the data. It limits what they can use the data for. 

Even individual contributions into OpenStreetMap are likely to be derived from other OpenStreetMap contributions due to the tools used to submit addresses and maps. This means that an individual’s data cannot be untangled: it may contain third party IPR that would require a share-alike licence which is not suitable for some of our users. Although OpenStreetMap is very valuable for some purposes it is not something that we can safely republish. We want to publish data that everyone can use.

Other people have suggested that our task should be easy because of public sector open data. The government is publishing many large datasets containing addresses as open data under the [Open Government Licence (OGL)](http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/). Why can't we just import, cleanse and republish that data?

Government does publish such datasets, but we're not wholly confident that all the data is truly open. The OGL licence clearly states that it “does not cover (...) third party rights the Information Provider is not authorised to license”. It may not be safe to use.

The Land Registry have issued a statement on the [Price Paid Dataset](https://www.gov.uk/government/collections/price-paid-data) which says that “[there are third party rights in addresses in the Price Paid Data which, at present, Land Registry is not authorised to license under the OGL](http://mapgubbins.tumblr.com/post/107499166390/it-was-all-a-dream-land-registrys-price-paid)”. The Land Registry Price Paid data is not safe to use by anyone for any purpose. It is not open data.

We expect to uncover similar issues as we and the community continue our efforts to [add more data](https://alpha.openaddressesuk.org/about/addingdata) to the platform.

#### Address data that is safe to use

The model that we are implementing will seem strangely rigorous to some. There are few (if any) open data publishers that go to these lengths. That is their choice, and it is the choice of their users to consume that data and take the risk. 

Over time we hope that those projects, and the public sector open data teams, will learn from our research and methodologies. Some of it will be suitable to be reused elsewhere.

We strongly believe that our approach to publishing open data is the right choice for UK address data. We think it makes the address data that Open Addresses UK publishes safe to use by anyone for any purpose.

We hope that you do too.
