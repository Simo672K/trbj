import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trbj/src/features/client/domain/client_provider.dart';
import 'package:trbj/src/features/client/presentation/widgets/data_table_fallback_msg.dart';

class ClientsDataTable extends ConsumerWidget {
  const ClientsDataTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(clientsProvider);

    return data.count == 0
        ? DataTableFallbackMsg(
          msg: 'msgNo se encontró ningún cliente, comience a agregar uno nuevo',
        )
        : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _clientDataWidget(context, ref),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(Icons.arrow_back_rounded, size: 14),
                    ),
                    Text(
                      'Pagina: ${data.page}',
                      style: TextStyle(fontSize: 12),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_forward_rounded, size: 14),
                    ),

                    // TODO: control the number of elements in a page ButtonDropdown.
                  ],
                ),
              ),
            ],
          ),
        );
  }

  Widget _clientDataWidget(BuildContext context, WidgetRef ref) {
    final data = ref.watch(clientsProvider);

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
      ),
      child: DataTable(
        columns: [
          DataColumn(label: Text('NOMBRE')),
          DataColumn(label: Text('FECHA DE ALTA')),
          DataColumn(label: Text('ACCIONES')),
        ],
        rows:
            data.clients.map((client) {
              return DataRow(
                cells: [
                  DataCell(Text(client.name)),
                  DataCell(Text(client.createdAt)),
                  DataCell(
                    // TODO: crud features for clients records.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.push('/client/details/${client.id}');
                          },
                          icon: Icon(
                            Icons.remove_red_eye_rounded,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.indigo,
                            size: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
      ),
    );
  }
}
