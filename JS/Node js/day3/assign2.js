var http = require('http');

http.createServer(function (req, res) {

    var url = require('url');
    var q = url.parse(req. url, true);

      res.writeHead(200, {'Content-Type': 'text/html'});

            console.log(q.search); //returns '?param1=5&paar2=10'
            var qdata = q.query; 
            console.log(qdata); //returns an object: { param1: 5, param2: 10 }
            var ans=  parseInt(qdata.param1) +  parseInt(qdata.param2);
            res.write(`${qdata.param1} + ${qdata.param2} =  ` + ans.toString());
            res.end();

}).listen(3001);