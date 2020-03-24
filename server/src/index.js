require('dotenv').config();
require('./db/mongoose')
const cors = require('cors');

const http = require('http');
const express = require('express');

const userRouter = require('./routers/user.router');

const app = express();
const port = process.env.PORT;

app.use(cors())
app.use(express.json());
app.use(userRouter);


app.listen(port, () => {
  console.log('Server is up on port ' + port);
}); 
