# Theodolite
 ![](https://upload.wikimedia.org/wikipedia/commons/3/30/SovietTheodolite.jpg)

This is the main public API for the OpenAddresses service

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
