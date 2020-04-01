const mongoose = require('mongoose');


/**
 * Company model used to model company documents
 * TODO: link company model to owner(s)
 * TODO: link menu's to companies
 */
const companySchema = new mongoose.Schema({
    photo: {
        type: Image,
        required: true,
    },
	itemName: {
		type: String,
		required: true,
    },
    description:{
        type: String,
        required: true,
        maxlength: 200,
    },
    price: {
        type: double,
        required: true,
    }
});

const Item = mongoose.model('Item', userSchema);
module.exports = Item;