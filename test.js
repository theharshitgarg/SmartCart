var http = require('http');
var events = require("events");
var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var mysql      = require('mysql');
var exec = require('child_process').exec;

var app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(__dirname));




var server = app.listen(8081, function () {
    var host = server.address().address;
    var port = server.address().port;

    var request = require('request');
    


    request('http://127.0.0.1:8081/', function (error, response, body) {
 // console.log(response)
 if (!error && response.statusCode == 200) {
    console.log("Success") // Show the HTML for the Google homepage.
}
else
    console.log(error)
})

    // console.log('Server Started %s:%s', host, port);
});





server.configure(function(){    

    server.use(express.static(__dirname + '/public'));

});






server.get('/', function(req, res) {

    res.writeHead(200, {'Content-Type': 'text/html'});

    res.write('R graph<br>');

    process.env.R_WEB_DIR = process.cwd() + '/public';

    var child = exec('Rscript script/xyplot.R', function(error, stdout, stderr) {

        console.log('stdout: ' + stdout);

        console.log('stderr: ' + stderr);

        if (error !== null) {

            console.log('exec error: ' + error);

        }

        res.write('<img src=”/xyplot.png"/>');

        res.end('<br>end of R script');

    });

});

server.listen(8081, '127.0.0.1');

console.log('Server running at http://127.0.0.1:8081/');