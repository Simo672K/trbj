import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trbj/src/features/client/domain/client_model.dart';
import 'package:trbj/src/features/client/domain/client_provider.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';

class ClientDetailsScreen extends ConsumerWidget {
  const ClientDetailsScreen({super.key, required this.clientId});

  final int clientId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(clientProvider(clientId));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          // TODO: url launcher for whatsapp messaging and and calls prefill feature.
          IconButton(onPressed: null, icon: Icon(Icons.message_outlined)),
          IconButton(onPressed: null, icon: Icon(Icons.call_outlined)),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          width: double.infinity,
          child: client.when(
            data:
                (client) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledHeading('Datos del client.'),
                      SizedBox(height: 16),

                      // TODO: initiate new contract with this client feature.
                      Row(
                        children: [
                          Spacer(),
                          FilledButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.add_rounded),
                            label: Text('Nuevo contrato'),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      _clientDetailsTable(context, client),
                    ],
                  ),
                ),
            error:
                (err, stack) => StyledTitle(
                  err.toString(),
                  style: TextStyle(color: Colors.red),
                ),
            loading: () => CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  _copyToClipBoard(String data) {
    return () => Clipboard.setData(ClipboardData(text: data));
  }

  TableRow _tableVerticalSpace(double verticalSpace) {
    return TableRow(
      children: [
        TableCell(child: SizedBox(height: verticalSpace)),
        TableCell(child: SizedBox(height: verticalSpace)),
        TableCell(child: SizedBox(height: verticalSpace)),
      ],
    );
  }

  Widget _clientDetailsTable(BuildContext ctx, ClientModel client) {
    const double verticalSpace = 10;
    return Table(
      columnWidths: {2: FixedColumnWidth(30)},
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            TableCell(child: StyledTitle('Nombre')),
            TableCell(child: Text(client.name)),
            TableCell(child: SizedBox()),
          ],
        ),
        _tableVerticalSpace(verticalSpace),
        TableRow(
          children: [
            TableCell(child: StyledTitle('Telefono')),
            TableCell(child: Text(client.phoneNumber, maxLines: 1)),
            TableCell(
              child: IconButton(
                onPressed: _copyToClipBoard(client.phoneNumber),
                icon: Icon(Icons.copy, size: 14),
              ),
            ),
          ],
        ),
        _tableVerticalSpace(verticalSpace),
        TableRow(
          children: [
            TableCell(child: StyledTitle('Email')),
            TableCell(child: Text(client.email)),
            TableCell(
              child: IconButton(
                onPressed: _copyToClipBoard(client.email),
                icon: Icon(Icons.copy, size: 14),
              ),
            ),
          ],
        ),
        _tableVerticalSpace(verticalSpace),
        TableRow(
          children: [
            TableCell(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: StyledTitle('Fetcha de alta'),
              ),
            ),
            TableCell(child: Text(client.createdAt)),
            TableCell(child: SizedBox()),
          ],
        ),
      ],
    );
  }
}
