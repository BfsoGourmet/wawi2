from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
from flask_cors import CORS, cross_origin

from config import config
from validation import *

app = Flask(__name__)

# CORS(app)
CORS(app, resources={r"/wawi/*": {"origins": "http://localhost"}})

conn = MySQL(app)


# ------------------------------------------ CATEGORIES ------------------------------------------

# @cross_origin
# get all categories
@app.route('/wawi/categories', methods=['GET'])
def list_categories():
    try:
        cursor = conn.connection.cursor()
        sql = "SELECT id, name, description FROM categories ORDER BY name ASC"
        cursor.execute(sql)
        data = cursor.fetchall()
        result = []
        for row in data:
            category = {'id': row[0], 'name': row[1], 'description': row[2]}
            result.append(category)
        return jsonify({'result': result, 'message': "wawi result list.", 'exit': True})
    except Exception as ex:
        return jsonify({'message': "Error", 'exit': False})


def list_category(id):
    try:
        cursor = conn.connection.cursor()
        sql = "SELECT id, name, description FROM categories WHERE id = '{0}'".format(id)
        cursor.execute(sql)
        data = cursor.fetchone()
        if data != None:
            category = {'id': data[0], 'name': data[1], 'description': data[2]}
            return category
        else:
            return None
    except Exception as ex:
        raise ex

# get category from ID
@app.route('/wawi/categories/<id>', methods=['GET'])
def read_category(id):
    try:
        category = list_category(id)
        if category != None:
            return jsonify({'category': category, 'message': "category found.", 'exit': True})
        else:
            return jsonify({'message': "category not found.", 'exit': False})
    except Exception as ex:
        return jsonify({'message': "Error", 'exit': False})

# post category 
@app.route('/wawi/categories', methods=['POST'])
def add_category():
    # print(request.json)
    if (request.json['name'] and request.json['description']):
        try:
            cursor = conn.connection.cursor()
            sql = """INSERT INTO categories (name, description) 
            VALUES ('{0}', '{1}')""".format(request.json['name'], request.json['description'])
            #return sql
            cursor.execute(sql)
            conn.connection.commit()
            return jsonify({'message': "category added", 'exit': True})
        except Exception as ex:
            return jsonify({'message': ex, 'exit': False})
    else:
        return jsonify({'message': "Invalid parameters", 'exit': False})

# delete category from id
@app.route('/wawi/categories/<id>', methods=['DELETE'])
def delete_category(id):
    try:
        category = list_category(id)
        if category != None:
            cursor = conn.connection.cursor()
            sql = "DELETE FROM categories WHERE id = '{0}'".format(id)
            cursor.execute(sql)
            conn.connection.commit()  # Confirma la acción de eliminación.
            return jsonify({'message': "category deleted", 'exit': True})
        else:
            return jsonify({'message': "category not found", 'exit': False})
    except Exception as ex:
        return jsonify({'message': "Error", 'exit': False})


# ------------------------------------------ PRODUCTS ------------------------------------------

# @cross_origin
# get all products
@app.route('/wawi/products', methods=['GET'])
def list_products():
    try:
        cursor = conn.connection.cursor()
        sql = "SELECT id, productIndex, currentlyAvailable, productName, shortDescription, description, quantityInStock, price, seasonalPrice, specialPrice, creationDate, dateOfLastChange, vegeterian, vegan, calories, sugar, categories_id, producers_id FROM products ORDER BY productName ASC"
        cursor.execute(sql)        
        data = cursor.fetchall()
        result = []
        for row in data:
            product = {'id': data[0], 'productIndex': data[1], 'currentlyAvailable': data[2], 'productName': data[3], 'shortDescription': data[4], 'description': data[5], 'quantityInStock': data[6], 'price': data[7], 'seasonalPrice': data[8], 'specialPrice': data[9], 'creationDate': data[10], 'dateOfLastChange': data[11], 'vegeterian': data[12], 'vegan': data[13], 'calories': data[14], 'sugar': data[15], 'categories_id': data[16], 'producers_id': data[17]}
            result.append(product)
            
        return jsonify({'result': result, 'message': "wawi result list.", 'exit': True})
    except Exception as ex:
        return jsonify({'message': ex, 'exit': False})


def list_product(id):
    try:
        cursor = conn.connection.cursor()
        sql = "SELECT id, productIndex, currentlyAvailable, productName, shortDescription, description, quantityInStock, price, seasonalPrice, specialPrice, creationDate, dateOfLastChange, vegeterian, vegan, calories, sugar, categories_id, producers_id FROM products WHERE id = '{0}'".format(id)
        cursor.execute(sql)
        data = cursor.fetchone()
        if data != None:
            product = {'id': data[0], 'productIndex': data[1], 'currentlyAvailable': data[2], 'productName': data[3], 'shortDescription': data[4], 'description': data[5], 'quantityInStock': data[6], 'price': data[7], 'seasonalPrice': data[8], 'specialPrice': data[9], 'creationDate': data[10], 'dateOfLastChange': data[11], 'vegeterian': data[12], 'vegan': data[13], 'calories': data[14], 'sugar': data[15], 'categories_id': data[16], 'producers_id': data[17]}
            return product
        else:
            return None
    except Exception as ex:
        raise ex

# get product from ID
@app.route('/wawi/products/<id>', methods=['GET'])
def read_product(id):
    try:
        producer = list_product(id)
        if producer != None:
            return jsonify({'products': product, 'message': "product found.", 'exit': True})
        else:
            return jsonify({'message': "products not found.", 'exit': False})
    except Exception as ex:
        return jsonify({'message': "Error", 'exit': False})


# delete product from ID
@app.route('/wawi/products/<id>', methods=['DELETE'])
def delete_product(id):
    try:
        product = list_product(id)
        if product != None:
            cursor = conn.connection.cursor()
            sql = "DELETE FROM products WHERE id = '{0}'".format(id)
            cursor.execute(sql)
            conn.connection.commit()
            return jsonify({'message': "product deleted", 'exit': True})
        else:
            return jsonify({'message': "product not found", 'exit': False})
    except Exception as ex:
        return jsonify({'message': "Error", 'exit': False})

        
# ------------------------------------------ PRODUCERS ------------------------------------------

# @cross_origin
# get all producers
@app.route('/wawi/producers', methods=['GET'])
def list_producers():
    try:
        cursor = conn.connection.cursor()
        sql = "SELECT id, name, number FROM producers ORDER BY name ASC"
        cursor.execute(sql)
        data = cursor.fetchall()
        result = []
        for row in data:
            producer = {'id': row[0], 'name': row[1], 'number': row[2]}
            result.append(producer)
        return jsonify({'result': result, 'message': "wawi result list.", 'exit': True})
    except Exception as ex:
        return jsonify({'message': "Error", 'exit': False})


def list_producer(id):
    try:
        cursor = conn.connection.cursor()
        sql = "SELECT id, name, number FROM producers WHERE id = '{0}'".format(id)
        cursor.execute(sql)
        data = cursor.fetchone()
        if data != None:
            producer = {'id': data[0], 'name': data[1], 'number': data[2]}
            return producer
        else:
            return None
    except Exception as ex:
        raise ex

# get producer from ID
@app.route('/wawi/producers/<id>', methods=['GET'])
def read_producer(id):
    try:
        producer = list_producer(id)
        if producer != None:
            return jsonify({'producer': producer, 'message': "producer found.", 'exit': True})
        else:
            return jsonify({'message': "producer not found.", 'exit': False})
    except Exception as ex:
        return jsonify({'message': "Error", 'exit': False})

# post producer
@app.route('/wawi/producers', methods=['POST'])
def add_producer():
    # print(request.json)
    if (request.json['name'] and request.json['number']):
        try:            
            cursor = conn.connection.cursor()
            sql = """INSERT INTO producers (name, number) 
            VALUES ('{1}', '{2}')""".format(request.json['name'], request.json['number'])
            cursor.execute(sql)
            conn.connection.commit()
            return jsonify({'message': "producer added", 'exit': True})
        except Exception as ex:
            return jsonify({'message': "Error", 'exit': False})
    else:
        return jsonify({'message': "Invalid parameters", 'exit': False})

# delete producer from ID
@app.route('/wawi/producers/<id>', methods=['DELETE'])
def delete_producer(id):
    try:
        producer = list_producer(id)
        if producer != None:
            cursor = conn.connection.cursor()
            sql = "DELETE FROM producers WHERE id = '{0}'".format(id)
            cursor.execute(sql)
            conn.connection.commit()
            return jsonify({'message': "producer deleted", 'exit': True})
        else:
            return jsonify({'message': "producer not found", 'exit': False})
    except Exception as ex:
        return jsonify({'message': "Error", 'exit': False})




def page_not_found(error):
    return "<h1>Page not found</h1>", 404


if __name__ == '__main__':
    app.config.from_object(config['development'])
    app.register_error_handler(404, page_not_found)
    app.run()
