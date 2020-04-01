const express = require('express');
const router = new express.Router();

// Require user model for mongodb functionality
const User = require('../models/user.model');


/**
 * Hello World testing route 
 */
router.get('/test', async (req, res) => {
  console.log("TEST GET");
  res.status(200)
    .send('Hello, World!');
});

/**
 * Register route for user
 */
router.post('/register', async (req, res) => {
  const newUser = new User(req.body);
  console.log('register fire!');
  console.log(req.body);
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
router.post('/login', async (req, res) => {
  try {
    console.log(req.body.email);
    const user = await User.getUserByEmail(req.body.email, req.body.password);
    const userId = await User.getUserIdByEmail(req.body.email);
    const token = await user.getJWT();

    res.status(200)
      .header('Access-Control-Allow-Origin', '*')
      .send({ token, userId });
  } catch (e) {
    res.status(400)
      .header('Access-Control-Allow-Origin', '*')
      .send();
  }
});

/**
 * Changes default user to restaurant owner
 * This is testing and admin use only
 * TODO: make it attach a restaurant to user
 */
router.patch('/makeowner/:id', async (req, res) => {
  try {
    const user = await User.findByIdAndUpdate(req.params.id, { isOwner: true }, {
      new: true,
    });
    res.send(user)
  } catch (error) {
    res.status(400).send(error);
  }
});

/**
 * Deletes user by giving it an ID
 * TODO: add verification / make secure
 */
router.delete('/delete/:id', async (req, res) => {
  try {
    const user = await User.findByIdAndDelete(req.params.id);
    res.send(user)
  } catch (error) {
    res.status(400).send(error);
  }
});

module.exports = router;
