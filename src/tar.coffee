Promise = require 'bluebird'
targz = require 'tar.gz'
Promise.promisifyAll targz::

doAfter = ->
  console.log 'Done after the action'

error = (err) ->
  console.error 'There was an error: ', err

compress = ->
  (new targz()).compressAsync './bin', './bin/archive.tar.gz'
               .then doAfter

extract = ->
  (new targz()).extractAsync './bin/archive.tar.gz', './bin'
               .then doAfter

compression = compress().then extract
                        .then doAfter
                       .catch error

module.exports = compression
