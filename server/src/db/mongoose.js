const mongoose = require('mongoose');
var mongoDB = 'mongodb://127.0.0.1:27017/woost';

mongoose.connect(mongoDB, {
	usernewUrlParser: true,
})


