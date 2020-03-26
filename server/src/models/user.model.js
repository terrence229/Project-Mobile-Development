const mongoose = require('mongoose');
const validator = require('validator');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');

/**
 * The model takes a username, email and password as input
 * The token is a JWT which can be used to authenticate the user
 */
const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  email: {
    type: String,
    unique: true,
    required: true,
    trim: true,
    lowercase: true,
    validate(value) {
      if (!validator.isEmail(value)) {
        throw new Error('Email invalid!');
      }
    },
  },
  password: {
    type: String,
    required: true,
    minlength: 5,
    trim: true,
  },
  tokens: [{
    token: {
      type: String,
      required: true,
    },
  }],
}, {
  timestamps: true,
});

/**
 * Create new token
 */
userSchema.methods.getJWT = async function() {
  // Generates new JWT
  const newJWT = jwt.sign({_id: this._id.toString()}, process.env.JWT_SECRET);

  // Add token to tokens
  this.tokens = this.tokens.concat({token: newJWT});
  await this.save();

  return newJWT;
};

/**
 * Find user by credential
 * Used for login
 * @param {email} email adress to find user by
 * @param {password} password put in by user
 */
userSchema.statics.getUserByEmail = async (email, password) => {
  const user = await User.findOne({email});
  console.log('test');
  // Return error if no user found or if password is incorrect
  if (!user) {
    throw new Error('Unable to login');
  }
  if (!await bcrypt.compare(password, user.password)) {
    throw new Error('Unable to login');
  }

  return user;
};

/**
 * Find user by Id
 * Used for login
 * @param {email} email adress to find user by
 */
userSchema.statics.getUserIdByEmail = async (email) => {
  const user = await User.findOne({email});
  return user.id;
};

/**
 * Saves user
 */
userSchema.pre('save', async function(next) {
  // Hashes new password
  if (this.isModified('password')) {
    this.password = await bcrypt.hash(this.password, 8);
  }

  next();
})

const User = mongoose.model('User', userSchema);
module.exports = User;
