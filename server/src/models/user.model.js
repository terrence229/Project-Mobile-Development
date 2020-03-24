const mongoose = require('mongoose');
const validator = require('validator');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');


const userSchema = new mongoose.Schema({
	name:  {
		type: String,
		required: true,
		trim: true, // removes whitespace
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
 * Saves user & encrypts password
 */
userSchema.pre('save', async function(next) {
		this.password = await bcrypt.hash(this.password, 8);
});

const User = mongoose.model('User', userSchema);
module.exports = User;
