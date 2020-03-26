const mongoose = require('mongoose');
const validator = require('validator');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');


const companySchema = new mongoose.Schema({
	name:  {
		type: String,
		required: true,
		trim: true,
	},
	password: {
		type: String,
		required: true,
		minlength: 5,
		trim: true,
  },
  branch: { // branch = filiaal van bedrijf
    type: String,
    required: true,
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
companySchema.methods.getJWT = async function() {
  // Generates new JWT
  const newJWT = jwt.sign({_id: this._id.toString()}, process.env.JWT_SECRET);

  // Add token to tokens
  this.tokens = this.tokens.concat({token: newJWT});
  await this.save();

  return newJWT;
};

/**
 * Saves company user & encrypts password
 */
companySchema.pre('save', async function(next) {
		this.password = await bcrypt.hash(this.password, 8);
});

const Company = mongoose.model('Company', companySchema);
module.exports = Company;
