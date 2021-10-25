var http = require('http');

http.createServer(function (req, res) {

    var url = require('url');
    var q = url.parse(req. url, true);

        const fs = require('fs')
        const path = require('path');
        const currentPath = path.join(__dirname, "demo.txt");
        try {
            const data = fs.readFileSync(currentPath, 'utf8')
            res.writeHead(200, {'Content-Type': 'text/plain'});
            var qdata = q.query;
            if (typeof localStorage === "undefined" || localStorage === null) {
                var LocalStorage = require('node-localstorage').LocalStorage;
                localStorage = new LocalStorage('./scratch');
            }
            localStorage.setItem('myFirstKey', data);
            res.write(localStorage.getItem('myFirstKey'));
            res.end();
        } catch (err) {
            console.error(err)
        }
}).listen(3001);