Promise = require('bluebird');

###*
 * @class PromiseError
 * @extends Error
 * @member {string} message, identifying the problem to the logs
 * @member {string} type, identifying the constructor to the logs
 * @param {string} message
###
class PromiseError extends Error
  constructor: (@message) ->
    @type = 'PromiseError'
    Error.captureStackTrace @, PromiseError

###*
 * Returns a new promise with the input object
 * @function createPromise
 * @param {Object} object
 * @returns {Promise} a new promise resolved with the input object
###
createPromise = (object) ->
  new Promise((res, rej) -> res object)

###*
 * Edits a property on the promised Object
 * @function consumePromise
 * @param {Object} object
 * @returns {Object} object
###
consumePromise = (object) ->
  object.otherProperty = not object.otherProperty
  console.log object
  object

###*
 * Throws an error to be caught in the promise chain
 * @function throwSomething
 * @param {Object} object
 * @throws {PromiseError} PromiseError with a description of the object's otherProperty
 * @returns {Object} object
###
throwSomething = (object) ->
  console.log "I will throw something"
  throw new PromiseError(object.otherProperty.toString())
  object

###*
 * Returns a new promise with the input object
 * @function createPromise
 * @param {Object} object
 * @return Promise
###
error = (err) ->
  console.error err

###*
 * @var {Object} someObject
 * @memeber {Boolean} property, identifies the state of the object to the consumePromise logs
###
someObject =
  property: true

###*
 * @exports {Promise} result of promise method chaining
###
module.exports = createPromise someObject
                         .then consumePromise
                         .then consumePromise
                         .then throwSomething
                        .catch error
