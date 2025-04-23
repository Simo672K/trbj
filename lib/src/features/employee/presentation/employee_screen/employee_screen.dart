import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trbj/src/features/client/domain/client_provider.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';
import 'package:trbj/src/features/search/presentation/widgets/search_field.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 16),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              SearchField(
                prefixIcon: Icons.search,
                hintText: 'buscar obrero...',
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Icon(
                    Icons.business_rounded,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  SizedBox(width: 4),
                  Consumer(
                    builder: (context, ref, child) {
                      final data = ref.watch(clientsProvider);
                      return StyledTitle(
                        "Lista del Obreros(${data.clients.length.toString()}).",
                      );
                    },
                  ),
                  Spacer(),
                  FilledButton.icon(
                    onPressed: () {
                      context.push('/employee/new');
                    },
                    style: FilledButton.styleFrom(
                      textStyle: TextStyle(fontSize: 14),
                    ),
                    icon: Icon(Icons.add),
                    label: Text("Anadir"),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.grey[300]!,
                  ),
                ),
                // child: ClientsDataTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
