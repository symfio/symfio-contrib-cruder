chai = require "chai"
w = require "when"


describe "contrib-cruder example", ->
  chai.use require "chai-as-promised"
  chai.use require "chai-http"
  chai.should()

  container = require "../example"
  container.set "env", "test"

  before (callback) ->
    container.promise.should.notify callback

  describe "GET /towns", ->
    it "should respond with towns", (callback) ->
      container.get("app").then (app) ->
        deferred = w.defer()
        chai.request(app).get("/towns").res deferred.resolve
        deferred.promise
      .then (res) ->
        res.should.have.status 200
        res.body.should.have.length 1
        res.body[0].should.have.property "title"
        res.body[0].title.should.equal "Moscow"
      .should.notify callback
