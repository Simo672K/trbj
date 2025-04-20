import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trbj/src/features/client/domain/client_dao.dart';
import 'package:trbj/src/features/client/domain/client_model.dart';

class ClientsState {
  List<ClientModel> clients;
  int count;
  int page;
  int perPageCount;

  ClientsState({
    required this.clients,
    this.count = 0,
    this.page = 1,
    this.perPageCount = 5,
  });

  //* this is for @immutablility
  ClientsState copyWith({
    List<ClientModel>? clients,
    int? count,
    int? page,
    int? perPageCount,
  }) {
    return ClientsState(
      clients: clients ?? this.clients,
      count: count ?? this.count,
      page: page ?? this.page,
      perPageCount: perPageCount ?? this.perPageCount,
    );
  }
}

class ClientsNotifier extends StateNotifier<ClientsState> {
  ClientsNotifier() : super(ClientsState(clients: []));

  Future<void> loadClientsData() async {
    final clients = await ClientDao.fetchAllClients();
    state = state.copyWith(clients: clients, count: clients.length);
  }

  addClient(ClientModel client) async {
    int id = await ClientDao.addClient(client);

    client = client.shallowCopyWithId(id);
    state = state.copyWith(
      clients: [...state.clients, client],
      count: state.count + 1,
    );
  }

  // removeClient() {

  // }
}

final clientProvider = FutureProvider.family<ClientModel, int>(
  (ref, id) async => await ClientDao.fetchClientBy(id),
);

final clientsProvider = StateNotifierProvider<ClientsNotifier, ClientsState>((
  Ref ref,
) {
  final clientsNotifier = ClientsNotifier();
  clientsNotifier.loadClientsData();
  return clientsNotifier;
});
