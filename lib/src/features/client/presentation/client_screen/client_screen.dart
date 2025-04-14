import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trbj/src/features/client/presentation/widgets/clients_data_table.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';
import 'package:trbj/src/features/search/presentation/widgets/search_field.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            SearchField(
              prefixIcon: Icons.search,
              hintText: 'buscar clients...',
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Icon(Icons.business_rounded, size: 16, color: Colors.grey[600]),
                SizedBox(width: 4),
                StyledTitle("Lista de clientes."),
                Spacer(),
                FilledButton.icon(
                  onPressed: () {
                    context.push('/create_client');
                  },
                  style: FilledButton.styleFrom(
                    textStyle: TextStyle(fontSize: 14),
                  ),
                  icon: Icon(Icons.add),
                  label: Text("Anadir"),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.only(top: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.grey[300]!,
                  ),
                ),
                child: ClientsDataTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
