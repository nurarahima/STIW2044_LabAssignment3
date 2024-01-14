import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartDatabase {
  late Database _database;

  Future<void> initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'cart_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cart_items(id INTEGER PRIMARY KEY, bookTitle TEXT, quantity INTEGER, price REAL)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertCartItem(String bookTitle, int quantity, double price) async {
    await _database.insert(
      'cart_items',
      {'bookTitle': bookTitle, 'quantity': quantity, 'price': price},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getCartItems() async {
    return await _database.query('cart_items');
  }

  Future<void> deleteCartItem(int id) async {
    await _database.delete(
      'cart_items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
