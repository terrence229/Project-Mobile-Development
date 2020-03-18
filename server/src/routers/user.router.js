const express = require('express');
const router = new express.Router();

// Test route
router.get('/test', async(req, res) => {
  console.log("TEST GET");	
	res.status(200)
		.send();
});

module.exports = router;
