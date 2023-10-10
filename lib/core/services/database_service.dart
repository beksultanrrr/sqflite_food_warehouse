import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/product_model.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;
  DatabaseService._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('products6.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    // const textType = 'TEXT NOT NULL';
    // const boolType = 'BOOLEAN NOT NULL';
    // const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE products ( 
  _id INTEGER PRIMARY KEY AUTOINCREMENT, 
  count INTEGER NOT NULL,
  title TEXT NOT NULL,
  description NOT NULL,
  price NOT NULL,
  imagepath NOT NULL
  )
''');
  }

  Future<ProductModel> create(ProductModel product) async {
    final db = await instance.database;
    final id = await db.insert(productTable, product.toJson());
    return product.copy(id: id);
  }

  Future<ProductModel> readProduct({required int id}) async {
    final db = await instance.database;

    final maps = await db.query(
      productTable,
      columns: ProductFields.values,
      where: '${ProductFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ProductModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<ProductModel>> readAllProduct() async {
    final db = await instance.database;

    final result = await db.query(productTable);
    return result.map((json) => ProductModel.fromJson(json)).toList();
  }

  Future<int> update({required ProductModel product}) async {
    final db = await instance.database;

    return db.update(
      productTable,
      product.toJson(),
      where: '${ProductFields.id} = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> delete({required int id}) async {
    final db = await instance.database;

    return await db.delete(
      productTable,
      where: '${ProductFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> getCount() async {
    final db = await instance.database;


  final result = await db.rawQuery('SELECT SUM(count) as total FROM products');

    if (result.isNotEmpty) {
      final count = result[0]['total'] as int;
      print("Total Count: $count");
      return count;
    } else {
      return 0; 
    }
  }
 Future<double> getPrice() async {
    final db = await instance.database;

    final result = await db.rawQuery('SELECT SUM(price*count) as total FROM products');
    if (result.isNotEmpty) {
      final total = result[0]['total'] as double;
      print("Total Price: $total");
      return total;
    } else {
      return 0.0; 
    }
  }
  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
