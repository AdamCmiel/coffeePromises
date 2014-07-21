require('coffee-script/register');
var promise = require('./src/promises');

promise.then(function() {
	console.log('Last Message');
});
