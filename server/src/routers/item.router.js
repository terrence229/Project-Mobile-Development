const express = require('express');
const router = new express.Router();
const mongoose= require('mongoose');
const multer = require('multer');
const upload = multer({dest: 'uploads/'});

// Require company model for mongodb functionality
const Item = require('../models/item.model');

router.get('/testitem', async (req, res) => {
    console.log("TEST GET");
    res.status(200)
      .send('Hello, World!');
  });

router.get('/getItem', async (req, res) => {
    const item= new item(req.body);
});

router.post('/registeritem', /*upload.single('productImage'),*/ async (req, res) => {
    console.log('working');
    const item = new Item(req.body)
    item.save().then(result => {
        console.log(result);
    })
    .catch(err => console.log(err));

    res.status(201).json({
        message: 'Handling POST request to /items',
    })
});

module.exports = router;