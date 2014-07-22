require('coffee-script/register');
var promise = require('./src/promises');

promise.then(function() {
	console.log('Last Message');
});

var tarPromise = require('./src/tar');

var exec = require('./src/child_process');
