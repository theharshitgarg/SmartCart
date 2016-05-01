var http = require("http");
var events = require("events");
var path = require('path');
var express = require('express');
var bodyParser = require('body-parser');
var mysql      = require('mysql');


var connection;
var app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static(__dirname));

function createDBConnection()
{
	connection = mysql.createConnection({
		host     : 'localhost',
		user     : 'root',
		password : 'root',
		database : 'test_schema'
	});
	connection.connect(function(err){
		if(!err) {
			// console.log("Database is connected ... ");    
		} else {
			console.log("Error connecting database ...");    
		}
	});
	// console.log('server created.');
}

function destroyDBConnection()
{
	connection.end();
}



app.get('/index', function(req, res) {
	res.sendFile(path.join(__dirname + '/index.html'));
});

app.get('/history', function(req, res) {
	res.sendFile(path.join(__dirname + '/history.html'));
});


app.get('/fetch_history', function(req, res) 
{
	createDBConnection();
	connection.query('select one.product_id, one.product_name, three.vendor_id, two.product_cat_type, one.product_price,  three.date from product one , product_category two, transaction three where one.product_cat_id = two.product_cat_id and three.item_id = one.product_id;', 
		function(err, rows, fields) 
		{
			if (err)
			{
				console.log('Error while performing Query.');
			//connection.end();
		}	
			//console.log(rows);
			res.send(rows);	
		});
	destroyDBConnection();
});



app.get('/fetch_product_list', function(req, res) 
{
	createDBConnection();
	connection.query('select product_id,product_name from product;',
		function(err, rows, fields) 
		{
			if (err)
			{
				console.log('Error while performing Query.');
			//connection.end();
		}	
			//console.log(rows);
			res.send(rows);	
		});
	destroyDBConnection();
});



app.post('/add-transaction', function(req, res) 
{
	var json = req.body.values;
	
	var tmp = JSON.parse(json);
	console.log(tmp);

	var date = new Date();
	date = date.getUTCFullYear() + '-' +
	('00' + (date.getUTCMonth()+1)).slice(-2) + '-' +
	('00' + date.getUTCDate()).slice(-2) + ' ' + 
	('00' + date.getUTCHours()).slice(-2) + ':' + 
	('00' + date.getUTCMinutes()).slice(-2) + ':' + 
	('00' + date.getUTCSeconds()).slice(-2);


	createDBConnection();

	
	for (i = 0; i < tmp.data.length; i++) 
	{
		d = tmp.data[i];
		console.log(d.product_id + ' ' + d.quantity);
		connection.query("INSERT INTO transaction(item_id,vendor_id,quantity,location,date) VALUES ( '"+d.product_id+"','A','"+d.quantity+"','Bangalore','"+date+"');", 
			function (err, result) {  
			});

	}
	destroyDBConnection();


	res.send("Successfully Added to cart");
});










console.log('Server running at http://127.0.0.1:8081/');
console.log(__dirname);




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


