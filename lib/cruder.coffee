module.exports = (container) ->
  container.require require
  container.require "cruder"

  container.set "resource", (app, cruder, logger) ->
    resource = cruder app

    (Model, options) ->
      logger.debug "resource", name: Model.modelName
      resource Model, options
