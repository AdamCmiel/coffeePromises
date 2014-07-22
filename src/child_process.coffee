Promise = require 'bluebird'
cp = Promise.promisifyAll require 'child_process'
exec = cp.execAsync

result = (stdout, stderr) ->
  if stderr then throw new Error stderr
  console.log 'STDOUT'
  console.log stdout

delay = ->
  deferred = Promise.pending()
  cb = ->
    deferred.fulfill()
  setTimeout cb, 2000
  return deferred.promise

error = (err) ->
  console.log 'Error'
  console.error err

done = (err, result) ->
  if err then error err else console.log result

child = exec.call cp, 'ifconfig'
            .then result
        #   .then delay
         .nodeify done
           .catch error

