import 'package:flutter/material.dart';
import 'package:trbj/src/features/client/presentation/widgets/data_table_fallback_msg.dart';

class ClientsDataTable extends StatelessWidget {
  const ClientsDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DataTableFallbackMsg(
      msg: 'msgNo se encontró ningún cliente, comience a agregar uno nuevo',
    );
  }
}
