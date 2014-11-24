Theodolite
==========

 ![](https://upload.wikimedia.org/wikipedia/commons/3/30/SovietTheodolite.jpg)

This repository is about Open Addresses' publishing APIs software component. It is named "theodolite", after [the precision instrument for measuring angles in the horizontal and vertical planes, used mainly for surveying applications](http://en.wikipedia.org/wiki/Theodolite). Theodolite is part of the solution Open Addresses deployed for the Alpha stage of our services. Read about Theodolite [here](http://openaddressesuk.org/docs) or learn about Open Addresses in general [here](http://openaddressesuk.org).

## Dependencies

As well as Ruby version 2.1.3, you'll also need MongoDB installed. [See installation instructions](http://docs.mongodb.org/manual/installation/).

## Running

### Clone the repo:

`git clone git@github.com:OpenAddressesUK/theodolite.git`

### Bundle:

`bundle install`

### Add a file called `.env` with the following contents:

```
ERNEST_ADDRESS_ENDPOINT={URL for the list of addresses from the Ernest master database}
```

### Import some addresses

`rake theodolite:import`

If you want to only import a limited amount of addresses for development, you can run (where `n` is the number of pages you want to import from the Ernest API (25 per page))

`rake theodolite:import[n]`

### Run the server

`rails s`

##Licence
The theodolite picture is sourced from [Wikimedia Commons](http://commons.wikimedia.org/wiki/File:SovietTheodolite.jpg).

![Creative Commons License](http://i.creativecommons.org/l/by/4.0/88x31.png "Creative Commons License") This work is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).
