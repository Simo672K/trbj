import "package:path/path.dart";
import "package:sqflite/sqflite.dart";

class DbService {
  static final DbService dbInstance = DbService._constructor();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  DbService._constructor();

  Future<Database> _initDatabase() async {
    final dbsPath = await getDatabasesPath();
    final myDbPath = join(dbsPath, "trbj_master_db.db");
    final Database db = await openDatabase(
      myDbPath,
      version: 1,
      onCreate: _createDb,
      onConfigure: _onConfigure,
      singleInstance: true,
    );

    return db;
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute(
      "CREATE TABLE client (id INTEGER PRIMARY KEY autoincrement, name TEXT, phone_number TEXT, email TEXT, created_at TEXT DEFAULT (date('now')))",
    );

    await db.execute(
      "CREATE TABLE document (id INTEGER PRIMARY KEY autoincrement, name TEXT, path TEXT, created_at TEXT DEFAULT (date('now')))",
    );

    await db.execute(
      "CREATE TABLE employee (id INTEGER PRIMARY KEY autoincrement, name TEXT, phone_number TEXT, email TEXT, ss_id INTEGER, nie_id INTEGER, curso_id INTEGER, created_at TEXT DEFAULT (date('now')), FOREIGN KEY (ss_id) REFERENCES document(id), FOREIGN KEY (nie_id) REFERENCES document(id), FOREIGN KEY (curso_id) REFERENCES document(id))",
    );

    await db.execute(
      "CREATE TABLE contract (id INTEGER PRIMARY KEY autoincrement, is_valid INTEGER DEFAULT (0),hour_pay REAL, day_pay REAL, meter_pay REAL, contract_doc_id INTEGER, created_at TEXT DEFAULT (date('now')), FOREIGN KEY (contract_doc_id) REFERENCES document(id))",
    );

    await db.execute(
      "CREATE TABLE assigned_to (id INTEGER PRIMARY KEY autoincrement, client_id INTEGER NOT NULL, employee_id INTEGER NOT NULL, start_date TEXT, end_date TEXT, created_at TEXT DEFAULT (date('now')), FOREIGN KEY (client_id) REFERENCES client(id), FOREIGN KEY (employee_id) REFERENCES employee(id))",
    );

    await db.execute(
      "CREATE TABLE monthly_payroll (id INTEGER PRIMARY KEY autoincrement, from_date TEXT, to_date TEXT, contract_id INTEGER NOT NULL, created_at TEXT DEFAULT (date('now')), FOREIGN KEY (contract_id) REFERENCES contract(id))",
    );

    await db.execute(
      "CREATE TABLE pay_transaction (id INTEGER PRIMARY KEY autoincrement, is_paid INTEGER DEFAULT (0), created_at TEXT DEFAULT (date('now')), payroll_id INTEGER NOT NULL, FOREIGN KEY (payroll_id) REFERENCES monthly_payroll(id))",
    );

    await db.execute(
      "CREATE TABLE daily_record (id INTEGER PRIMARY KEY autoincrement, number_hours INTEGER, full_day INTEGER, half_day INTEGER, payroll_id INTEGER NOT NULL, attended INTEGER DEFAULT(1),created_at TEXT DEFAULT (date('now')), FOREIGN KEY (payroll_id) REFERENCES monthly_payroll(id))",
    );
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }
}
