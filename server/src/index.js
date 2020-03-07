require('dotenv').config();
const http = require('http');
const express = require('express');


const app = express();
const port = process.env.PORT;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});

app.listen(port, () => {
  console.log('Server is up on port ' + port);
});

