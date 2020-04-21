const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

/**
 * Item model used to model possible items for sale from a company
 * TODO: Link all items to a menu
 * TODO: link menu's to companies
 */
const itemSchema = new mongoose.Schema({
	itemName: {
        unique: true,
		type: String,
        required: true,
    },
    description:{
        type: String,
        required: true,
        maxlength: 200,
    },
    price: {
        type: Number,
        required: true,
    }
});

itemSchema.plugin(uniqueValidator);
const Item = mongoose.model('Item', itemSchema);
module.exports = Item;