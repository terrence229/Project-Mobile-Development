const mongoose = require('mongoose');


/**
 * Company model used to model company documents
 * TODO: link company model to owner(s)
 * TODO: link menu's to companies
 */
const companySchema = new mongoose.Schema({
	name: {
		type: String,
		required: true,
		trim: true,
	}
});

const Company = mongoose.model('Company', companySchema);
module.exports = Company;
