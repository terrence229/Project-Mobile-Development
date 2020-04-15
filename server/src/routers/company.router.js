const express = require('express');
const router = new express.Router();

// Require company model for mongodb functionality
const Company = require('../models/company.model');

/**
 * Register route for company
 * Use Postman to make new company account!
 * Can't be done using client for now.
 */
router.post('/registercompany', async (req, res) => {
	const newCompany = new Company(req.body);

	try {
		await newCompany.save();
		res.status(201)
			.header('Access-Control-Allow-Origin', '*')
			.send();
	} catch (error) {
		res.status(400)
			.send(error);
	}
});

/**
 * Register route for company
 * Use Postman to make new company account!
 * Can't be done using client for now.
 */
router.post('/registercompany', async (req, res) => {
	const newCompany = new Company(req.body);

	try {
		await newCompany.save();
		res.status(201)
			.header('Access-Control-Allow-Origin', '*')
			.send();
	} catch (error) {
		res.status(400)
			.send(error);
	}
});

/**
 * Register route for company
 * Use Postman to make new company account!
 * Can't be done using client for now.
 */
router.post('/registercompany', async (req, res) => {
	const newCompany = new Company(req.body);

	try {
		await newCompany.save();
		res.status(201)
			.header('Access-Control-Allow-Origin', '*')
			.send();
	} catch (error) {
		res.status(400)
			.send(error);
	}
});

module.exports = router;