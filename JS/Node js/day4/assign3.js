var http = require('http');

http.createServer(function (req, res) {

    var url = require('url');
    var q = url.parse(req. url, true);

                res.writeHead(200, {'Content-Type': 'text/plain'});
                var qdata = q.query;
                res.write(`${qdata.input} first vowel character is: ` + qdata.input.match(/[aeiou]/gi)[0]);
                res.end();

}).listen(3001);