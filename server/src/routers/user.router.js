const express = require('express');
const router = new express.Router();

// Require user model for mongodb functionality
const User = require('../models/user.model');

// Test route
router.get('/test', async(req, res) => {
  console.log("TEST GET");	
	res.status(200)
		.send('Hello, World!');
});

// Test POST routei
// TODO: make post
router.post('/testpost', async(req, res) => {
  console.log("TEST POST");
	console.log(req.body);
	const newUser = new User(req.body);
	try {
		await newUser.save();
		res.status(201)
			.header('Access-Control-Allow-Origin', '*')
			.send();
	} catch (error) {
		res.status(400)
			.send(error);
	}
});


module.exports = router;
