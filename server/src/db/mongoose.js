const mongoose = require('mongoose');
var mongoDB = 'mongodb://127.0.0.1:27017/woost';

mongoose.connect(mongoDB, {
	useNewUrlParser: true,
	useUnifiedTopology: true,
	useCreateIndex: true, // Removes DeprecationWarning, no clue what it does
})
