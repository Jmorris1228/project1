import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "FinancialApp.db";
  static const _databaseVersion = 1;

  static const userTable = 'users';
  static const userId = '_id';
  static const userEmail = 'email';
  static const userPassword = 'password';

  late Database _db;

  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $userTable (
        $userId INTEGER PRIMARY KEY,
        $userEmail TEXT NOT NULL UNIQUE,
        $userPassword TEXT NOT NULL
      )
    ''');
  }

  // Method to insert a new user (for registration)
  Future<int> insertUser(String email, String password) async {
    Map<String, dynamic> user = {
      userEmail: email,
      userPassword: password,
    };
    return await _db.insert(userTable, user);
  }

  // Method to check if a user exists (for login)
  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final List<Map<String, dynamic>> result = await _db.query(
      userTable,
      where: '$userEmail = ? AND $userPassword = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty ? result.first : null;
  }
}
