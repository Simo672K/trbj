import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  ClientsNotifier()
    : super(
        ClientsState(
          clients: [
            ClientModel('jhon doe', '635241789', 'jhon@email.com', ''),
            ClientModel('jhon smith', '635241789', 'jhon@email.com', ''),
            ClientModel('hamid sqali', '635241789', 'jhon@email.com', ''),
            ClientModel('jhon doe', '635241789', 'jhon@email.com', ''),
          ],
          count: 4,
        ),
      );

  addClient(ClientModel client) {
    state = state.copyWith(
      clients: [...state.clients, client],
      count: state.count + 1,
    );
  }

  // removeClient() {

  // }
}

final clientsProvider = StateNotifierProvider<ClientsNotifier, ClientsState>(
  (Ref ref) => ClientsNotifier(),
);
