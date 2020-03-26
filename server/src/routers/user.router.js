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

/**
 * Register route for user
 * TODO: add security
 */
router.post('/register', async(req, res) => {
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

/**
 * Login route for user
 */
router.post('/login', async(req, res) => {
  try {
    console.log(req.body.email);
    const user = await User.getUserByEmail(req.body.email, req.body.password);
    const userId = await User.getUserIdByEmail(req.body.email);
    const token = await user.getJWT();

    res.status(200)
        .header('Access-Control-Allow-Origin', '*')
        .send({token, userId});
  } catch (e) {
    res.status(400)
        .header('Access-Control-Allow-Origin', '*')
        .send();
  }
});
module.exports = router;
