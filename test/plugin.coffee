symfio = require "symfio"
sinon = require "sinon"
chai = require "chai"


describe "contrib-cruder()", ->
  chai.use require "chai-as-promised"
  chai.use require "sinon-chai"
  chai.should()

  container = null
  sandbox = null

  beforeEach (callback) ->
    container = symfio "test", __dirname
    sandbox = sinon.sandbox.create()

    container.set "app", ->
      sandbox.spy()

    container.set "logger", ->
      debug: sandbox.spy()

    container.injectAll([
      require ".."
    ]).should.notify callback

  afterEach ->
    sandbox.restore()

  describe "container.set resource", ->
    it "should log message", (callback) ->
      container.set "cruder", ->
        (app) ->
          (Model, options) ->

      container.inject (resource) ->
        resource modelName: "Hooray"
      .then ->
        container.get "logger"
      .then (logger) ->
        logger.debug.should.be.calledOnce
        logger.debug.should.be.calledWith "resource", name: "Hooray"
      .should.notify callback
