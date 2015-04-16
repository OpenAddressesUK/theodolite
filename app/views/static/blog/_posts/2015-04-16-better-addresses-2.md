---
author: Peter Wells
title: Can We Make Address Entry Work For More Of Us
---


This is the second of our blog series, (part 1 on new addresses can be found [here](/blog/2015/03/31/better-addresses-new-addresses)), discussing what Open Addresses is learning from meeting the public sector.

Here, I explore how users enter addresses online and how the current [challenges](/blog/2015/02/09/living-breathing-problem) can affect vital public services such as [voter registration](https://www.gov.uk/register-to-vote).

We:

* found four common methods, known as [design patterns](http://en.wikipedia.org/wiki/Interaction_design_pattern), for entering addresses online: drop-down boxes, multiple address fields, type-ahead address entry, free-format address entry
* considered digital inclusion as a challenge the public sector faces
* explored whether Open Addresses can improve online address entry and make it work for more of us

#### The challenge of digital inclusion

The public sector is in a unique position: they cannot choose their users. Users of public services might even have to use the service even when they don’t want to, for example paying income or council tax.

The public sector has to serve **everyone** from those with high digital skills to those with no digital skills or without the ability to access the Internet.

The UK Government has published a [digital inclusion scale](https://www.gov.uk/government/publications/government-digital-inclusion-strategy/government-digital-inclusion-strategy) showing the percentage of the population with differing levels of digital access and skills.

<%= image_tag("blog/2015-04-15-digital-inclusion-scale.png", alt: "Sample from Royal Mail - Find an Address") %>

The digital inclusion scale shows many of us struggle to use online services (this can be for a number of reasons: lack of skills, lack of access, lack of confidence). Whilst many marvellous organisations such as [Go ON UK](http://www.go-on.co.uk/), the [Tinder Foundation](http://www.tinderfoundation.org/) and [housing associations](http://digitalhousinghub.ning.com/) are helping people get online and improve their skills it is important that public sector online services are simple and accessible.

Open Addresses cannot directly help people at some of these levels but by considering people with [low digital skills and confidence](http://www.go-on.co.uk/basic-digital-skills/) we wanted to see if we could improve UK address entry and increase the number of people who could use online public services.

As we considered each pattern for entering addresses online we wanted to see if they could help with these two issues that affect the public sector: new addresses and digital inclusion.

#### Burn your drop-down boxes

The most commonly used design pattern to enter addresses is the drop-down box. As well as “drop-down box” some people might call this design “address finder”or “postcode lookup”.

It looks like this:

<%= image_tag("blog/2015-04-15-postcode-finder.png", alt: "Sample from Royal Mail - Find an Address") %>

*Image source: [Royal Mail - Find an Address](http://www.royalmail.com/find-a-postcode)*

This design pattern begins with a user entering a postcode then selecting their address from a drop-down list of addresses matching that postcode. The drop-down list is generated from an existing address list, in this case it is the Royal Mail’s Postal Address File (PAF).

Does this pattern work for new addresses? **It can but it’s a struggle**.

If the website designer has considered new addresses there is an entry at the bottom of the drop-down list saying “Is your address missing?” which, when taken, triggers an exception path. Many users will miss that entry: their house will be missing from the *middle* of the numerically sorted list. For others it is cumbersome and disheartening, consider a user on a smartphone scrolling through a hundred entries before learning their address isn’t there.

Does this pattern work for people with low digital skills? **No**.

We were pointed to a talk called “Burn your select tags” by Alice Bartlett of the Government Digital Service ([GDS](https://gds.blog.gov.uk/about/)). A select tag is a piece of HTML code that is used to create drop-down boxes.

<iframe width="560" height="315" src="https://www.youtube.com/embed/CUkMCQR4TpY" frameborder="0" allowfullscreen></iframe>

This talk demonstrates the problems that users with low digital skills and confidence have with drop-down boxes. People struggle to work out how to use them.

We need to see if we can design something better.

#### Greater Manchester or Lancashire

Other online services use a different approach, multiple address fields. Here, the user is asked to enter their address in the correct combination of boxes:

*<%= image_tag("blog/2015-04-15-universal-jobmatch.png", alt: "Sample from Universal Jobmatch") %>*

Image source: [Universal Jobmatch](https://jobsearch.direct.gov.uk/Home.aspx). 

Does this pattern work for new addresses? **It depends**.

Without validation a new address can be entered but the developer may have built strong validation into the front-end or even into the processing after the form has been submitted. The validation may prevent a new address being entered and the service being delivered. 

Does this pattern work for people with low digital skills? **We think not**.

Regardless of their level of skills this pattern creates a number of questions in a user’s mind:

* Do I put the house number into the Address field and the road into Address Line 2?
* Is the City ‘Camberwell’ or ‘London’?
* What County or Region do I live in?
* Do I live in ‘Greater Manchester’ or ‘Lancashire’?
* Does my friend live in ‘Slough’ or Windsor? 

Answering these questions causes users to pause and think. If they put data in a different field then the developer expected it can  generate bad data.

Overall we think the pattern causes website journeys to be slower than drop-down boxes or, in some cases, to fail altogether. Yet we know that drop-down boxes cause trouble for users with low digital skills.

We need to see if we can design something better.

#### Smart addresses for smart people

The third pattern is “type ahead address entry”, some people call it “smart address entry”. As the user types the website starts to predict what address they are looking for, offering suggestions in either a drop-down box or the main entry field. It looks like this:

<%= image_tag("blog/2015-04-15-google-maps.png", alt: "Sample from Google Maps") %>

*Image source: [Google Maps](https://www.google.co.uk/maps/).*

This pattern is becoming more frequent, esepcially on mapping websites and apps like [City Mapper](https://citymapper.com/), [Google Maps](https://www.google.co.uk/maps/) and [Apple Maps](https://www.apple.com/uk/ios/maps/).  We did not find this method used on any public sector service but it was something that people had considered. 

Does this pattern work for new addresses? **Yes.**

If developed well then this pattern can allow the service to learn by discovering new addresses entered by users.

Does this pattern work for people with low digital skills? **No.**
It suffers from similar issues to the “drop-down boxes” pattern. The user interface is complex so users with low digital skills can struggle to use it.

So despite “[type ahead address entry](/services/type-ahead-address-input)” being useful for many services outside of the public sector it seems like it may not be optimal for the public sector and their wide range of users.

#### Free format input is best for a wide range of users

We think that free-format address input is likely to be the best way to support a wide range of users.

<%= image_tag("free-format-text-image.png", alt: "Submission box screenshot") %>

In this pattern the computer does the hard work and the user’s life is simple.

The digital service takes freely entered text, parses the address to turn it into structured information and, where appropriate, passes it back to the user for confirmation.

This pattern can support the entry of addresses that do not exist in any address list. That is how and why we use it on our [own website](/get-involved/add-an-address).

 We believe that it is simple to use for users with low digital skills or confidence. It has predictable behaviour and the user can type the address how they wish.

It will make address entry work for more of us

But in the past this pattern has not been easy to implement. That is something we want to change by building a [service](/services/free-format-address-input) that everyone can use.

#### Free-text addresses are really hard

Address parsing is part of the problem that needs to be tackled to implement this service. Our [service is in Alpha](/services/free-format-address-input)  and yet to be perfected - as our team has previously described [UK addresses are hard, really hard](blog/2015/01/23/give-our-sorting-office-a-try) to handle and interpret. 

When building our Alpha service we wanted to learn how people entered addresses so our [address submission form](/get-involved/add-an-address) was designed without a prompt for this address format. We wanted to learn from what people entered.

Given the complexity of UK addresses we suspect that we may need to have a second confirmation step for more complex addresses (“We haven’t seen that address before. Did we understand it correctly?”, “Sorry, but we struggled with that address. Can you help us?”). This is something that we need to research.

In the meantime the submission form is continually giving us new examples of addresses, and is helping our team to keep [improving the service](https://github.com/openaddressesuk/sorting_office/issues). If you want to see how it works behind the scenes you can play with a [technical demonstration](https://sorting-office.openaddressesuk.org/) or  dive into the [source code](https://github.com/OpenAddressesUK/sorting_office). The code is open so anyone can improve it or fork it if they wish.

The more data we receive the more we can improve it and support more scenarios within the service. Trialists that generate more data will help us to develop this further so we are keen to get your [support](/get-involved/trialists).

The service can also be used to publish open data through the Open Addresses platform. Creating open data through useful services is one of our techniques to build an open data address list for the UK.

#### What’s happening next

Over the next month, with our friends at [Error Creative](http://www.errorstudio.co.uk/) we will be researching, designing and developing the [free format address input](/services/free-format-address-input) service.

This research will:

* produce a non-technical demonstration
* help prove, or disprove, our belief that this service will increase the number of users able to enter addresses online

We will be ready to share our results in mid-May. 

In addition to our own research we would love to [hear your thoughts](https://alpha.openaddressesuk.org/get-involved/contact-us).

In the meantime keep an eye out for our next blog in this series discussing Welsh language addresses and why a user who works at an address in the town of Slough may be correct in claiming that it is actually in Windsor...