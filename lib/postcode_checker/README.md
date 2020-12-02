# Postcode checker

The heart of the postcode checking algorithm

## Structure

### postcode_checker

The external interface of the postcode checking algorithm.

### lib/core

Core postcode normalization and checking algorithm. It will fail quickly if the config is empty. It will skip the remote API pull if the LSOA allowed name list is empty.

### lib/config

Configuration for the postcode checker. Loads a YAML file from `$APP/config/postcode_checker.yml` that stores the 'override postcode list' and the 'allowed lsoa list'. A sample configuration is provided in the same directory as this. If no configuration file can be found then it will be the equivelant of having blank values.

### lib/allow_list

The local postcode override list logic. Reads in allowed list from config. Will fail if list is empty.

### lib/remote_data_api

The encapsulation of the Postcode.io API fetch and decode logic. This also has code for stubbing calls to the remote API in test mode as this will make testing faster and more reproducable.