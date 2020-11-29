# Postcode Service Area Checker

A small web form application for determining if a postcode entered is
within a user's service area.

## Requiremenst

- ruby > 2.6
- rbenv (+ rbenv-gemset + rbenv-ruby-build)
- bundler
- git
- working internet connection

This was developed on OS X. (It does not require any database provider.)

## To set up code locally

To set up code locally open a Terminal and follow these commands:

    mkdir postcode-app

    cd postcode-app

    git clone git@github.com:ivankocienski/postcode-service-area-checker.git

    cd postcode-service-area-checker

    bundle

    rspec

## To run server

Follow instructions for above code set up and then run `rails s`.
In a browser visit http://localhost:3000 and enter postcode in input
box, click "check" and the results will be shown.

## Considerations

Here are some ideass for future work on this code.

### Caching lookups

Lookups across the internet to postcode.io could be cached to save time.
Either in a formal database or in a memcache.

### Pre-loading data

The postcode information from postcode.io can be downloaded and stored
in a application-local database. Then considerations about lookup throttling
could be amelierated.

### Styling

The UI could be made clearer with a more considered layout and colours.

### Allow list storage

Currently the postcode overide list is defined in ruby code
in `lib/postcode_allow_list.rb`. This was done for simplicity of implementation
and speed of development. This list could easily be moved into a config
file, loaded into a proper database or pulled from a third party API on startup.
