const express = require('express');
const router = new express.Router();

// Require user model for mongodb functionality
const Company = require('../models/company.model');

/**
 * Register route for company
 * TODO: plan how to do this
 */
router.post('/register', async(req, res) => {
	const newCompany = new Company(req.body);
  
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
 * Login route for company 
 * TODO: doesn't work yet!
 */
router.post('/login', async(req, res) => {
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
