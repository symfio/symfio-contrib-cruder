suite = require "symfio-suite"


describe "contrib-cruder()", ->
  it = suite.plugin (container, containerStub) ->
    require("..") containerStub

    container.set "resource", (sandbox) ->
      sandbox.spy()

    container.set "cruder", (sandbox, resource) ->
      cruder = sandbox.stub()
      cruder.returns resource
      cruder

    container.set "app", (sandbox) ->
      sandbox.spy()

  describe "container.set resource", ->
    it "should define resource",
      (containerStub, app, cruder, logger, resource) ->
        factory = containerStub.set.get "resource"
        wrappedResource = factory app, cruder, logger
        cruder.should.be.calledOnce
        cruder.should.be.calledWith app
        wrappedResource "model", "options"
        resource.should.be.calledOnce
        resource.should.be.calledWith "model", "options"
