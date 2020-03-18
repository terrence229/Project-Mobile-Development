const mongoose = require('mongoose');

mongoose.connect(process.env.MONGO_URI, {
	usernewUrlParser: true,
	useCreateIndex: true,
	useFindAndModify: false,
})


