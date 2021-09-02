import 'package:flutter/material.dart';
import 'package:mjeetrn33/models/productmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLHelper {
  final String nameDatabase = 'trn33.db';
  final String tableDatabase = 'productTable';
  final int version = 1;
  final String sqlCreate =
      'CREATE TABLE productTable (productID TEXT PRIMARY KEY, productDS TEXT, productPR INT)';
  SQLHelper() {
    initDB();
  }

  Future<Null> initDB() async {
    await openDatabase(
      join(await getDatabasesPath(), nameDatabase),
      onCreate: (db, version) => db.execute(sqlCreate),
      version: version,
    );
  }

  Future<Database> conectDB() async {
    return openDatabase(join(await getDatabasesPath(), nameDatabase));
  }

  Future<Null> insertDB(ProductModel productModel) async {
    Database database = await conectDB();
    try {
      database.insert(tableDatabase, productModel.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print('e Insert DB => ${e.toString()}');
    }
  }

  Future<Null> deleteDB(String id) async {
    Database database = await conectDB();
    try {
      database.delete(
        tableDatabase,
        where: 'productID=?',
        whereArgs: [id],
      );
    } catch (e) {
      print('e Delete DB => ${e.toString()}');
    }
  }

  Future<Null> updateDB(ProductModel productModel) async {
    Database database = await conectDB();
    try {
      database.update(tableDatabase, productModel.toJson(),
          where: 'productID = ?', whereArgs: [productModel.productID]);
    } catch (e) {}
  }

  Future<List<ProductModel>> readDB() async {
    Database database = await conectDB();
    List<ProductModel> productModels = [];
    List<Map<String, dynamic>> maps = await database.query(tableDatabase);
    // for (var map in maps) {
    //   ProductModel productModel = ProductModel.fromJson(map);
    //   productModels.add(productModel);
    // }
    maps.forEach((map) {
      productModels.add(ProductModel.fromJson(map));
    });
    return productModels;
  }

  Future<Null> closeDB() async {
    Database database = await conectDB();
    try {
      database.close();
    } catch (e) {
      print('e Close DB => ${e.toString()}');
    }
  }
}
