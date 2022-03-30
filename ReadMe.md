# WAWI API DOCUMENTATION

## Setting up the API
To use the API, first, apply following commands on your server:
	pip install flask_mysqldb
	pip install flask_cors

Then, make sure to run XAMPP and add the database .sql file found in the project folder to your localhost using myphpadmin. With this, you're ready to start using the API.

## Using the API

The API can be accessed through the localhost IP 127.0.0.1.
The API allows for editing of three different tables: Products, producers, categories.
To access and edit these tables, the URL https//:127.0.0.1/wawi/(table name) can be used through the application Postman. 

The URLs can be accessed with a GET, POST and DELETE paramater.
To output data, use GET. This will give you a full output of the table if the root URL is used. You can specifiy a single object to be output through the URL https//:127.0.0.1/wawi/(table name)/(object ID). Data will be output in JSON format.
To add data, use POST. Data must be input in JSON format, such as: {param1:"p1",param2:"p2",param3:"p3"}.
To delete data, use DELETE. This allows you to delete single datasets through the URL https//:127.0.0.1/wawi/(table name)/(object ID).


Warning: Unfortunately, only the producer and category tables work properly. Due to time constraints, the products table is only available with limited functionality.