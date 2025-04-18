import 'package:trbj/src/features/client/domain/client_model.dart';
import 'package:trbj/src/utils/database.dart';

class ClientDao {
  static Future<List<ClientModel>> fetchAllClients() async {
    final db = await DbService.dbInstance.database;
    final result = await db.query('client');

    return result.map((row) => ClientModel.fromMap(row)).toList();
  }

  static Future<int> addClient(ClientModel client) async {
    final db = await DbService.dbInstance.database;

    return await db.insert('client', client.toMap());
  }
}
