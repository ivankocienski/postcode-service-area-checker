# Postcode checker

The heart of the postcode checking algorithm

## Structure

### postcode_checker

The external interface of the postcode checking algorithm.

### lib/core

Core postcode normalization and checking algorithm.

### lib/allow_list

The local postcode override list logic.

### lib/remote_data_api

The encapsulation of the Postcode.io API fetch and decode logic. This also has code for stubbing calls to the remote API in test mode as this will make testing faster and more reproducable.