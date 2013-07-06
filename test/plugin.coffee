suite = require "symfio-suite"


describe "contrib-cruder()", ->
  it = suite.plugin [
    require ".."

    (container) ->
      container.set "app", null
  ]

  describe "container.set resource", ->
    it "should log message", (container, logger) ->
      container.set "cruder", ->
        (app) ->
          (Model, options) ->

      container.inject (resource) ->
        resource modelName: "Hooray"
        logger.debug.should.be.calledOnce
        logger.debug.should.be.calledWith "resource", name: "Hooray"
