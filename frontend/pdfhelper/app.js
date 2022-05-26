const express = require('express');
const app = express();
app.listen(7919, () => console.log('<<-- http://127.0.0.1:7919 -->>'))

const cors = require('cors');
app.use(cors());

app.use(express.urlencoded({ extended: false }));
app.use(express.json());


app.use('/api', require('./router/api'));