var http = require('http');
var list = require('./person');
http.createServer(function (req, res) {
        res.writeHead(200, {'Content-Type': 'application/json'});
        res.write(JSON.stringify(list));
        res.end();
}).listen(3001);