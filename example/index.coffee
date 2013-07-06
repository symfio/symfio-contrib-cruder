symfio = require "symfio"
nodefn = require "when/node/function"


module.exports = container = symfio "example", __dirname

module.exports.promise = container.injectAll [
  require "symfio-contrib-winston"
  require "symfio-contrib-express"
  require "symfio-contrib-mongoose"
  require ".."

  (model) ->
    model "Town", "towns", (mongoose) ->
      new mongoose.Schema
        title: type: String, required: true

    container.inject (resource, Town) ->
      resource Town

      nodefn.call(Town.remove.bind Town).then ->
        moscow = new Town title: "Moscow"
        nodefn.call moscow.save.bind moscow
]


if require.main is module
  module.exports.promise.then ->
    container.get "listener"
  .then (listener) ->
    listener.listen()
