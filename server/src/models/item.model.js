const mongoose = require('mongoose');

/**
 * Item model used to model possible items for sale from a company
 * TODO: Link all items to a menu
 * TODO: link menu's to companies
 */
const itemSchema = new mongoose.Schema({
    id: mongoose.SchemaTypes.ObjectId,
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
        type: Number,
        required: true,
    }
});

const Item = mongoose.model('Item', itemSchema);
module.exports = Item;