suite = require "symfio-suite"


describe "contrib-cruder()", ->
  it = suite.plugin (container) ->
    container.inject ["suite/container"], require ".."

    container.set "resource", (sandbox) ->
      sandbox.spy()

    container.set "cruder", (sandbox, resource) ->
      cruder = sandbox.stub()
      cruder.returns resource
      cruder

    container.set "app", (sandbox) ->
      sandbox.spy()

  describe "container.set resource", ->
    it "should define resource", (setted, app, resource) ->
      factory = setted "resource"
      factory().then (wrappedResource) ->
        factory.dependencies.cruder.should.be.calledOnce
        factory.dependencies.cruder.should.be.calledWith app
        wrappedResource "model", "options"
        resource.should.be.calledOnce
        resource.should.be.calledWith "model", "options"
