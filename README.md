#coffeePromises

A quick demo illustrating the mechanics of creating, returning, consuming, and throwing with Bluebird promises.

###Create and a Promise
	var createPromise = function createPromise(object, condition) {
		condition || (condition = true);
		return new Promise(function(resolve, reject) {
			switch (condition) {
				case true:
					resolve(object);
					break
				case false:
					reject(object);
					break;
				default:
					resolve(object);
			}
		});
	};

	createPromise = (object, condition=true) ->
	  new Promise (resolve, reject) ->
		switch condition
		  when true then resolve object
		  when false then reject object
		  else resolve object

###Consuming and returning an object within a promise chain
`object` was either resolved or rejected in creating the promise, so we can pass it into a function that consumes a promise

	var consumePromise = function consumePromise(object) {
		object.method();
		return object;
	};

	consumePromise = (object) ->
		object.method()
		object

###Catching and throwing in promise chains

	var throwSomething = function throwSomething() {
		throw new Error("There's a problem");
	};

	var errorHandler = function errorHandler(error) {
		console.error(error);
	};

	throwSomething = -> throw new Error "There's a problem"
	errorHandler = (error) -> console.error error

###Putting it all together

	var object = {
		method: function() {
			console.log("Method called");
		}
	};

	createPromise(object, true)
			.then(consumePromise)
			.then(consumePromise)
			.then(throwSomething)
		   .catch(errorHandler)

	object =
	  method: ->
	    console.log "Method called"

	createPromise object, true
	        .then consumePromise
	        .then consumePromise
	        .then throwSomething
	       .catch errorHandler

#Coming Soon

More advanced tricks including spreads, waterfalls, maps and alls