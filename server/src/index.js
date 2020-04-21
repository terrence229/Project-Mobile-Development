require('dotenv').config();
require('./db/mongoose')
const cors = require('cors');

const http = require('http');
const express = require('express');

const userRouter = require('./routers/user.router');
const companyRouter = require('./routers/company.router');
const itemRouter = require('./routers/item.router');

const app = express();
const port = process.env.PORT;

app.use(cors())
app.use(express.json());

app.use(userRouter);
app.use(companyRouter);
app.use(itemRouter);


app.listen(port, () => {
  console.log('Server is up on port ' + port);
}); 
