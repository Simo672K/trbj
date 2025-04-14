import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trbj/src/features/client/domain/client_form_data_provider.dart';
import 'package:trbj/src/features/client/presentation/widgets/data_table_fallback_msg.dart';

class ClientsDataTable extends ConsumerWidget {
  const ClientsDataTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientsProvider);

    return clients.isEmpty
        ? DataTableFallbackMsg(
          msg: 'msgNo se encontró ningún cliente, comience a agregar uno nuevo',
        )
        : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var client in clients)
                Row(
                  children: [
                    Text(client.name),
                    SizedBox(width: 16),
                    Text('+34${client.phoneNumber}'),
                    SizedBox(width: 16),
                    Text(client.email == '' ? '-' : client.email),
                    SizedBox(width: 16),
                    Text(client.createdAt == '' ? '-' : client.createdAt),
                  ],
                ),
            ],
          ),
        );
  }
}
