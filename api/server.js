'use strict'

const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');
const { application } = require('express');
const port = process.env.PORT || 3000;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(cors());
app.disable('x-powered-by');
app.set('port', port);

server.listen(3000, '192.168.20.34' || 'localhost', function () {
    console.log('Listening on port ' + port +' '+ process.pid + ' Iniciada...');    
});

app.get('/', (req, res) => {
    res.status(200).send('Ruta raiz Backend');
});

app.get('/test', (req, res) => {
    res.status(200).send('Esta es la ruta test');
});

app.get('/init', (req, res) => {
    res.status(200).send('Esta es la ruta init');
});

// Error Handler
app.use((err, req, res, next) => {
    console.error(err);
    res.status(500).send('Server Error');
});
