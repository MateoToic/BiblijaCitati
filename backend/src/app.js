const express = require('express');
const dailyQuoteRoutes = require('./routes');

const app = express();
app.use(express.json());

app.use('/api/quotes', dailyQuoteRoutes);

module.exports = app;