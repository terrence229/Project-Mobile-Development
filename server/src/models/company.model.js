const mongoose = require('mongoose');


/**
 * Company model used to model company documents
 * TODO: link company model to owner(s)
 * TODO: link menu's to companies
 */
const companySchema = new mongoose.Schema({
	photo:{
		type: Image,
		required: true,
	},
	name: {
		type: String,
		required: true,
		trim: true,
	},
	openingHours: {
		type: String,
		required: true,
	},
	closingHours: {
		type: String,
		required: true,
	}
});

const Company = mongoose.model('Company', companySchema);
module.exports = Company;
