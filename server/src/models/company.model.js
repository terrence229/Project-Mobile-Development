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

/**
 * Find restauarnt by name
 * Used to find traveltime to location
 * @param {companyName} companyName name to find company by
 */
companySchema.statics.getCompanyByName= async (companyName) => {
  const company = await Company.findOne({name});
  return company.name;
};

const Company = mongoose.model('Company', companySchema);
module.exports = Company;
