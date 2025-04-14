import 'package:flutter/material.dart';
import 'package:trbj/src/features/client/domain/client_model.dart';
import 'package:trbj/src/features/client/presentation/widgets/input_field.dart';
import 'package:trbj/src/features/home/presentation/widgets/section_title.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';
import 'package:trbj/src/utils/validator.dart';

class CreateClientScreen extends StatelessWidget {
  CreateClientScreen({super.key});

  final _clientDataForm = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  _handelFormSubmit() {
    if (_clientDataForm.currentState!.validate()) {
      ClientModel clientModel = ClientModel(
        _nameController.text,
        _phoneNumberController.text,
        _emailController.text,
        '',
      );
      print(clientModel);
    }
  }

  _clearForm() {
    _clientDataForm.currentState?.reset();
    _nameController.clear();
    _phoneNumberController.clear();
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: StyledScreenTitle('Anadir neuvo cliente'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _clientDataForm,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(
                    icon: Icons.info_outline,
                    title: "introducir datos del cliente",
                  ),
                  SizedBox(height: 16),

                  StyledLabel('Nomber y appelido'),
                  SizedBox(height: 4),
                  InputField(
                    controller: _nameController,
                    placeholder: 'Nombre y appelido del cliente...',
                    validatorRules:
                        (value) =>
                            Validator(value)
                                .assertNotNull('Se requieren nombre y appelido')
                                .applyRules(),
                  ),

                  SizedBox(height: 16),

                  StyledLabel('telefono'),
                  SizedBox(height: 4),
                  InputField(
                    controller: _phoneNumberController,
                    placeholder: 'Numero de telefono...',
                    type: TextInputType.number,
                    validatorRules:
                        (value) =>
                            Validator(value)
                                .assertNotNull(
                                  'El número de teléfono es obligatorio.',
                                )
                                .isPhoneNumber(
                                  'El formato del número de teléfono no es válido.',
                                )
                                .applyRules(),
                  ),

                  SizedBox(height: 16),

                  StyledLabel('email'),
                  SizedBox(height: 4),
                  InputField(
                    controller: _emailController,
                    placeholder: 'Email del cliente...',
                    type: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 16),
                  Row(
                    children: [
                      Spacer(),
                      FilledButton.icon(
                        onPressed: _clearForm,
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        icon: Icon(Icons.close),
                        label: Text('Limpiar campos'),
                      ),
                      SizedBox(width: 4),
                      FilledButton.icon(
                        onPressed: _handelFormSubmit,
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        icon: Icon(Icons.check),
                        label: Text('Guardar'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
