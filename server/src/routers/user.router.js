const express = require('express');
const router = new express.Router();

// Test route
router.get('/test', async(req, res) => {
	res.status(200)
		.send();
});

module.exports = router;
