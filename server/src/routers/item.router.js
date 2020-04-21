const express = require('express');
const router = new express.Router();
const mongoose= require('mongoose');
const multer = require('multer');
const storage = multer.diskStorage({
    destination: function(req, file, cb){
        cb(null, './uploads/')
    },
    filename: function(req, file, cb){
        cb(null, file.filename)
    }
});

const upload = multer({storage: storage});

// Require company model for mongodb functionality
const Item = require('../models/item.model');

/*router.get('/testitem', async (req, res) => {
    console.log("TEST GET");
    res.status(200)
      .send('Hello, World!');
  });*/


router.post('/registeritem', upload.single('productImage'), async (req, res) => {
    console.log('working');
    const item = new Item({
        itemName: req.body.itemName,
        description: req.body.description,
        price: req.body.price,})
    item.save().then(result => {
        console.log(result);
    })
    .catch(err => console.log(err));

    res.status(201).json({
        message: 'Handling POST request to /items',
    })
});

router.get('/getAllItems', async(req, res) => {
    Item.find({}, function(err, items) {
      const itemMap = {};
  
      items.forEach(function(item) {
        itemMap[item._id] = item;
      });
  
      res.send(itemMap);  
    });
  });

module.exports = router;