module.exports = (container) ->
  container.set "cruder", (logger) ->
    logger.debug "require module", name: "cruder"
    require "cruder"

  container.set "resource", (app, cruder, logger) ->
    resource = cruder app

    (Model, options) ->
      logger.debug "resource", name: Model.modelName
      resource Model, options
