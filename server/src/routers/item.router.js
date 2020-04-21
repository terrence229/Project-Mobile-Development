const express = require('express');
const router = new express.Router();
const mongoose= require('mongoose');


// Require company model for mongodb functionality

router.get('/testitem', async (req, res) => {
    console.log("TEST GET");
    res.status(200)
      .send('Hello, World!');
  });



module.exports = router;