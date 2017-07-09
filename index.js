const express = require('express')
var http = require('http');
var fs = require('fs');

const app = express()
app.use(express.static('static_html'))

app.get('/', function (req, res) {
    fs.readFile('static_html/index.html', function(err, data) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    return res.end();
  });
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})
