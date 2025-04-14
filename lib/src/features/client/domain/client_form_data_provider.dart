import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trbj/src/features/client/domain/client_model.dart';

final List<ClientModel> clientsStore = [];

class ClientsNotifier extends StateNotifier<List<ClientModel>> {
  ClientsNotifier() : super([]);

  addClient(ClientModel client) {
    state = [...state, client];
  }

  // removeClient() {

  // }
}

final clientsProvider =
    StateNotifierProvider<ClientsNotifier, List<ClientModel>>(
      (Ref ref) => ClientsNotifier(),
    );
