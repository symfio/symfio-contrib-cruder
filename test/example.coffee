suite = require "symfio-suite"


describe "contrib-cruder example", ->
  it = suite.example require "../example"

  describe "GET /towns", ->
    it "should respond with towns", (request) ->
      request.get("/towns").then (res) ->
        res.should.have.status 200
        res.body.should.have.length 1
        res.body[0].should.have.property "title"
        res.body[0].title.should.equal "Moscow"
