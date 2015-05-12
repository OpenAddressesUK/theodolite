---
author: Ed Jones of Error Creative
title: Address Entry User Research
---

We tested a selection of participants to confirm or disprove our hypothesis that a single-field address input form would be easier and quicker for users. The subjects were drawn from across the scale of the GDS Digital Inclusion Score. When using a single field, we found a general increase in speed of entry, **text to be finished off**

Participants generally preferred a single field. We have built a [working prototype form](http://embed.openaddressesuk.org/) which can be embedded in any website, and checks data against the Open Addresses ‘[Sorting Office](/developers/sortingoffice)’ API.

#### What’s wrong with address forms on the internet?

Putting an address into a web form is a day-to-day task for anyone who spends even a small amount of time on the internet. Ecommerce deliveries, online government forms, online service verifications: all tasks that usually require an address.

How users input building addresses online has barely changed for at least  the last decade. The paradigm for entering building addresses usually includes a collection of fields with labels such as: street address, town or city, county, postcode, maybe a few address line 1s and 2s.

We all have a mental format for our own address. For example, my work address, according to my mental format is:

<table cellpadding="5" cellspacing="5" border="1"><tr><td>
Unit 205<br>
Vanilla Factory<br>
39 Fleet Street<br>
Liverpool<br>
L1 4AR
</td></tr></table>
<p>&nbsp;</p>

There’s a variety of ways I will likely have to reprocess how my address fits into the usual form address input fields. Here’s a typical mental conundrum: do I put ‘Unit 205’ in street address? Should I type out ‘Unit 205, Vanilla Factory, 39 Fleet Street’ all in one field for street address? Even if enough address liness have been provided, does ’39 Fleet Street’ go into street address, and ‘Unit 205, Vanilla Factory’ go into Address Line 1 and 2? Like most people, I’d likely put ‘Unit 205’ in street address and populate the rest below, meaning ’39 Fleet Street’ becomes the second line and not, as it probably was meant to be, the street address.

Once I’ve conquered that snafu, do I really need to select a county? I don’t normally put ‘Merseyside’ in the address. Why is the form asking me for this?

Of course, much of this happens in the blink of an eye. In the words of [information architect Steve Krug](https://www.sensible.com/), I generally [satisfice](http://en.wikipedia.org/wiki/Don%27t_Make_Me_Think) and succeed. (Judging by my Amazon and Ebay account, I really do.)

#### Can we do better?

So, here we all are in 2015 still occasionally being flummoxed by building address forms (a little, if you’re an experienced user; moreso if you’re not used to the internet or having difficulties using it). Quite simply, the fields force a user to think about changing the arrangement of something that they know works in their own format, and is actually quite unnecessary to change.

So, as part of [our](http://www.errorstudio.co.uk/) work with Open Addresses we have set out to find the simplest way for a user to input an address. A simpler way that is both correct according to the user and offers them the least interaction ‘friction’; and, is valid according to the system receiving the data.

#### One single address field

We’ll lay our cards on the table. Open Addresses have been using a single, solitary form field (a [textarea](http://www.w3schools.com/tags/tag_textarea.asp) in HTML speak) to capture address information for the past couple of months. Data results from the form have been good. No difference in data capture quality versus a traditional multiple field form.

The folks here at Open Addresses [posited that a single field is a lot easier for folks to input their building address data](/blog/2015/04/16/better-addresses-2), and quite a few people agree. So, we arranged some user testing to find out how a single field compared to a more traditional multiple field form.

#### User testing

We tested 14 participants with two different forms: a pretty standard multi-field form, and a single-field form, and asked users to perform a few tasks. Some participants were tested on mobile, tablet, and desktop devices. Most were tested on one device only. We provided all three platforms: an Android smartphone, an Apple iPad, and an Apple Macbook Pro laptop. In some instances we were more than happy for the participant to provide their own.

Based on the test tasks below, we observed how the participants interacted and dealt with issues themselves, without guidance from the testers. Specifically, we were looking to determine which form:

* was the easiest to use;
* resulted in the most valid input;
* offered the best validation feedback (if required);
* offered the best solution for correction (of an invalid address);

We tested with two types of address: an address the participant was familiar with and could recall from memory, such as a home or work address and an unfamiliar address, (such as a government department that they may have to send a document to).

We tested the different addresses to see if entry of familiar versus unfamiliar data had any bearing on a user’s experience with the forms.

#### The two test forms

Multi-field form

<%= image_tag("blog/2015-05-13-multi-line.png", alt: "Multi-line address form") %>

Test Form 1 was formatted in much the same way as the majority of address entry web forms. We added multiple field elements, one for each address part. An input element for the building number and street name, and separate elements for address Line 2, line 3, town/city, and postcode.

The multiple-fields form takes inspiration from some of the better examples of multiple-field address web forms such as Paypal’s account address input, Amazon.co.uk’s delivery address form, and Gov.uk’s ‘register to vote’ web form.

Single-field form

<%= image_tag("blog/2015-05-13-single-field.png", alt: "Single field address form") %>

Test Form 2 was one single textarea element. We expect participants to input the whole of their address into the single field.

As this method is similar to writing an address on paper or seeing your address on an letter you received through the door, we suspected that this form would be proven to be the easier input method.

We also thought that the supporting help text for the single-field element would be important. The supporting text would need to describe in clear language (broadly following the excellent [GDS service manual and guides](https://www.gov.uk/guidance/content-design/writing-for-gov-uk)) what is expected of the user in order to fill in the form.

A final important factor was be the user’s experience of validation, and recovering from a mistake. For example, if the system does not think the address is a valid one, how can the user be guided to re-evaluate their entry and make a correction?

#### The test

We asked participants to complete four tasks. We asked them to input a:

* known address (home or work) into the multiple field form;
* provided unknown address (we supplied government department addresses) into the multiple field form;
* known address into the single field form;
* provided unknown address into the single form field.

### The results

Our test participants ranged from 10 years old, up to those in their 60s. On the [Digital Inclusion Scale](https://www.gov.uk/government/publications/government-digital-inclusion-strategy/government-digital-inclusion-strategy#annex-2-digital-inclusion-scale-for-individuals), the range was from 3 (willing and unable) up to 9 (Expert). Most participants registered between 5–7.

For a breakdown of the individual participants, please see the addendum at the end of this report.

#### Observations

**Multiple-field form**

By far the most widespread observation concerning the multiple field form was the participants’ eagerness to just crack on and fill in the form, without recourse to the field labels. More often than not, each input was filled out sequentially, matching how the participant’s mental format of their address was sequenced. For example, the ‘street address’ field generally contained their building number and street name, followed by town, then borough into the additional Address line 1 & 2 fields. The participant would then realise they’d reached the Town or city field, backtrack and re-input the address according to the field labels. (9 people)

A side-effect of this phenomenon was that some participants would realise they’d made clerical errors with their typing and re-correct them.

There was mild confusion concerning where to input county and borough details. For example, where to type ‘Wirral’ as the borough; and where to type ‘Merseyside’ as the county. We found that there were other details within participants’ known addresses for which they struggled to find a place on the form (3 people)

Participants would separate the building number and road into different fields (4 people)

Optional Address line 2 & 3 fields didn’t feel optional (1 person)

Most participants used the mouse or trackpad to click into the next field. Only expert users seemed to know about tabbing into fields.

There was the occasional accidental form submit when pressing enter within a field (1 person)

There was some confusion concerning placeholder text and what it meant (1 person)

On smartphones and tablets, struggling with user interface annoyances was common. The operating system’s insistence to jump up and down between fields was particularly irksome. (1 person)

**A summary of our multi-field form testing**

All users were familiar with using a standard multiple field form for address entry. The most common occurrence was participants not evaluating the field labels before entering data, resulting in data in the incorrect fields. A side effect of this occurrence was that participants would re-correct any errors they had originally made when having to transpose the information to a different field. It meant the end result was often quite accurate.

**Single Field**

There was an initial unfamiliarity with the single field (5 people)

Using an address placeholder made things unclear, there was an expectation of a blank field (3 people)

Some participants were surprised when the example placeholder disappeared. It served as a reference (1 person)

Knowing to click the text area to focus was difficult for some participants (3 people)

Knowing to hit return for the next line was also a bit of an unknown for some participants (3 people)

Some participants impulsively selected the Submit button instead of return or enter on a phone or tablet, which resulted in an inaccurate address being submitted (2 people)

A few participants had problems knowing where to click if they had typed something incorrectly (2 people)

There were a few difficulties positioning the cursor on tablet or mobile (1 person)

One participant expected a ‘help’ prompt (1 person)

**A summary of our single-field testing**

All participants entered their addresses much more quickly in the single field form. In most cases, it took half the time it would take in the multiple field form. Not having to transpose entries to a different field possibly had a lot to do with the faster entries. However, with some participants, it did mean that the quality of their entry was worse (with more spelling and formatting mistakes).

There was initial resistance to the single field form from more experienced users: their expectations were for something more familiar. However, these participants still managed to input their addresses in more quickly in a single field. 

The single field form was also more open to a variety of formatting decisions. For example, participant Tom entered his home address all on one line, and with the postcode first.

**Overall summary**

Of the 14 participants, 9 expressed a definite preference for the single field form, stating that the ease of use and level of control concerning the format to be a major factor. 

The main reason the remaining 5 preferred the multiple fields form was because of familiarity with existing forms. The 5 who preferred the multiple fields still entered their addresses into a single field much faster than the multi-field form.

In principle, the single field was the front-runner in terms of ease-of-use and speed. But before making a firm recommendation, there are some caveats:

* All users would benefit from plain language instructions, regardless of the type of form;
* All users would also benefit from feedback about their inputted address;
Whichever system receives the address information should be forgiving and accommodate for the multitude of different ways a user would format an address. This isn’t just how users at Digital Inclusion Scale level 5 and upwards input their own address, but also those lower down the scale who have difficulty inputting an address and may not be aware of formatting conventions;
* It was apparent that there is still room for multi-field forms for address entry to be improved. See our recommendations below.
* This was not an exhaustive test, we think a wider more quantitative analysis of the forms in practice would help ascertain how well received a single field might be.

#### Recommendations

Our recommendation is that a single input field for addresses, as a textarea, can be used as a simpler and faster way for users to enter building address data. The service receiving the data should be robust enough to be able to process a variety of user formats of the address information.

As an aside, as point 4 outlines above, there are still ways a multiple form could be improved. The best example we have found is the GOV.UK register to vote’ form. The user is presented with simple entry fields titled ‘Address line 1’ etc, no Town or City labels. Essentially, the user is allowed to populate the information in a similar fashion to a single field form.

A suggested prototype
In making the overall single field recommendation, we have designed a [prototype form](http://embed.openaddressesuk.org/), which links with the Open Addresses ‘Sorting Office’ service and can be embedded in any existing form by developers.

<div id="openaddresses-form"></div>

The prototype form is a single field form with a few helpful guidance devices for the user.

**Example address hint**
The example address is positioned outside of the input field. Placing it outside serves as a reference whilst the user is typing, rather than when it was inside the field and only visible before typing.

**Placeholder instruction text**
‘Type address here...’ is used as a placeholder instruction inside the field. The instructive ‘Type’ helps users focus on the field as the mode of input.
Field dimensions
In our test version, the input field was fairly wide. This felt unnatural to some participants as a most addresses (unless stated on one line) are reasonably narrow as a block of text. Keeping the field narrow helps keep the field analogous to an envelope address block.

**Entry visual aids**
The single field has a background lined rule set to the baseline of the input text. We felt that certain participants were slightly uneasy with the single field because there was no visual ‘hint’ as to where to input the next line. Something a single, deep textarea does not do intuitively (particularly to the uninitiated).

**Validation**
Particular to Open Addresses (and most likely to all that would use this form) is that the entered data needs to be validated as an acceptable address for the database. Hence, we have included a ‘confirm address’ button. If the user fails to include or types in data that is unrecognisable as an address, they will be prompted to edit their entry and submit again. If the data is considered a correct entry, the user receives a thank you message.

A final word on the prototype form: During subsequent user testing of this form (by no means as thorough as the initial testing round), the single field prototype worked well. The two considerations that we have been left pondering are:
*Will people understand the ‘Contribute this address to Open Addresses’ option? Or can this be made part of a site's terms and conditions?
*Two submit buttons on one form could cause confusion amongst users. One solution maybe to disable the main Submit button until the Confirm Address button is used. In our effort to produce this form as a widget to be served up through an iFrame, disabling the main submit button is out of our control, but could be easily achieved by the integrating developer




#### Addendum

Users
Please note, the acronym DIS means Digital Inclusion Score.

Phillip
10 years old, primary school boy
Laptop & trackpad, Windows 8
DIS: 7
Personal preference: multiple field

Observations
* Fairly self-confident filling both forms in.
* Unaware that certain input errors had been made, such as using his own postcode for a government address  rather than the postcode supplied.

Quotes
‘I preferred lots of boxes because it reminded me of things 
I might miss out.’

Tom
12 years old, secondary school boy
Laptop & trackpad, Windows 8
DIS: 8
Personal preference: multiple field

Observations
* Confident inputting into both types of forms. 
* Consistently put postcode first in an address. 
* Inputted the whole address on one line within the single field.

Quotes

‘[Multiple fields] felt like you were doing the correct thing.’

Joan
60 years old, grandmother, part-time shop assistant
Laptop & trackpad, Windows 8
DIS: 7
Personal preference: multiple field

Observations
* Confident inputting addresses in both forms. 
* Didn’t care about case formatting of addresses (some in all capital letters, others all lower case).

Quotes
Preferred multiple fields because,
‘it felt more familiar.’

Keith
60 years old, grandfather, full-time engineer
Desktop PC & mouse, Windows 10
DIS: 9
Personal preference: multiple field

Observations
* Own computer populated the multiple form fields incorrectly. 
* Knowingly added county to the Town field because, ‘it doesn’t matter’.
Uses [Dashlane](https://www.dashlane.com/) to pre-populate fields

Quotes
‘I preferred multiple fields. Format is laid out for you how it is wanted (how the information maybe required).’

‘[Multiple fields] feels structured and useful. It feels like your adding data correctly. Single didn’t.’

Paula
43 years old, mother and business owner
English as a second language
Macbook Air laptop with trackpad
DIS: 8
Personal preference: single field

Observations
* Consistently typed in all lowercase. 
* Made interesting ‘mistakes’ such as ‘3 rd Floor’ and extra spaces in postcodes, such as ‘EC1A 4 HD’.

Quotes
‘[I preferred the] single field. Lots of jumping up and down with multiple fields on mobile.’

Claire
40 years old, full-time mother
Macbook Pro with trackpad
DIS: 5
Personal preference: single field

Observations
* Confident filling in both forms. 
* Struggled a little with the example provided with the single field form.

Quotes
Single field form: 
‘I like this, you’re just so used to writing your address, I didn’t have to think, I just wrote it how I wanted to’, ‘There’s no pressure to put extra stuff in’

Diane
64 years old, retired accountant
Macbook Pro with trackpad, iPad, Android smartphone
DIS: 5
Personal preference: single field (originally answered multiple fields)

Observations
* Struggle with tablet and mobile text input

Quotes
‘Oh for god’s sake, I hate that, now it says Town or City, 
I’ll got to go back now and put Hoylake.’

Matt
39 years old, self-employed handyman
Macbook Pro with trackpad, iPad, Android smartphone
DIS: 7
Personal preference: single field

Observations
* Consistently put number on first line and road name on the next line.

Quotes
‘I preferred the second [single field form] way, because you can just type what you want.’

‘You do wonder where to click, but you always click on the box, don’t you.’

Sandy
30 years old, self-employed craft-maker
Macbook Pro with trackpad
DIS: 8
Personal preference: undecided

Observations
* Felt that there wasn’t much difference between both forms - ‘You’re either entering or using tab to go to the next bit, so it’s the same thing really’

Quotes
‘Town or City bugs me because we don’t really live in one’

Tamara
33 years old, full-time mother & self-employed craft-maker
Macbook Pro with trackpad, iPad, Android smartphone
DIS: 8
Personal preference: single field

Observations
* Consistently put number on first line and road name on the next line.
* Thought that the multi-line placeholder example was useful and meant that you would know to put the whole thing in.

Quotes
‘On Tablet and Phone, Form 2 [single field form] was a lot easier because you don’t have to go through all the fields’

Yasser
50 years old, cafe-owner
Macbook Pro with trackpad
DIS: 3
Personal preference: single field

Observations
* Had trouble getting back into the box after the postcode error, tried pressing all sorts of keys, had to be prompted to click back into the field.
* Doesn’t know what to put in Town or City.

Quotes
Thought that Form 2 was easier,
 ‘For the simple reason, you’ve got your own way and you’re used to it, you just write it your own way’

Jan
61 years old, retired head teacher
Macbook Pro with trackpad
DIS: 7
Personal preference: single field

Observations
* Appraised whole form before starting
* Tablet: tried to click on the headings and expected focus to move to the fields, which it didn’t. Implementation should ensure labels.

Quotes
“Oh this is much better - easier to type into one field”

George
65 years old, retired merchant sailor
Macbook Pro with trackpad, iPad
DIS: 4
Personal preference: multiple fields

Observations
* Typed slowly, double checked each line
* Re-read each line before clicking into the next input
* Used trackpad to click into next field, rather than tab

Lilly
30 years old, midwife
Macbook Pro with trackpad
DIS: 5
Personal preference: single field

Observations
* Quickly completed the fields, tabbed through the whole form
* Preferred the multi-field form for the unknown-provided address as it is ‘set out and you don’t have to think as much.’
* Stated that the single text field was better for their own address as there was no need to check the fields.


