# symfio-contrib-cruder

> Cruder plugin for Symfio.

[![Build Status](https://travis-ci.org/symfio/symfio-contrib-cruder.png?branch=master)](https://travis-ci.org/symfio/symfio-contrib-cruder) [![Dependency Status](https://gemnasium.com/symfio/symfio-contrib-cruder.png)](https://gemnasium.com/symfio/symfio-contrib-cruder)

## Usage

```coffee
symfio = require "symfio"

container = symfio "example", __dirname

container.set "pingResponse", "It's works!"

container.inject require "symfio-contrib-express"
container.inject require "symfio-contrib-mongoose"
container.inject require "symfio-contrib-cruder"

container.inject (model) ->
  model "Town", "towns", (mongoose) ->
    new mongoose.Schema
      title: type: String, required: true

  container.inject (resource, Town) ->
    resource Town
```

## Dependencies

* [contrib-express](https://github.com/symfio/symfio-contrib-express)
* [contrib-mongoose](https://github.com/symfio/symfio-contrib-mongoose)

## Services

### `cruder`

Original `cruder` module.

### `resource`

Resource define helper. First argument is model, second is
[resource options](https://github.com/rithis/cruder#available-options-and-default-values).
