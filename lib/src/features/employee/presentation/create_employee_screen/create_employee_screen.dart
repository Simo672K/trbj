import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trbj/src/features/client/presentation/widgets/input_field.dart';
import 'package:trbj/src/features/employee/presentation/widgets/choose_image_file.dart';
import 'package:trbj/src/features/employee/presentation/widgets/doc_image_builder.dart';
import 'package:trbj/src/features/home/presentation/widgets/section_title.dart';
import 'package:trbj/src/features/home/presentation/widgets/text_widget.dart';
import 'package:trbj/src/utils/validator.dart';

enum EmployeeDocImage { dni, seguro, curso }

class FormImages {
  String? dniImage;
  String? seguroImage;
  String? cursoImage;

  FormImages({this.dniImage, this.seguroImage, this.cursoImage});

  String? getDocType(EmployeeDocImage docType) {
    switch (docType) {
      case EmployeeDocImage.curso:
        return cursoImage;
      case EmployeeDocImage.dni:
        return dniImage;
      case EmployeeDocImage.seguro:
        return seguroImage;
    }
  }

  FormImages copyWith({String? dni, String? curso, String? seguro}) {
    return FormImages(
      dniImage: dni ?? dniImage,
      seguroImage: seguro ?? seguroImage,
      cursoImage: curso ?? cursoImage,
    );
  }
}

final imageNotifier = ValueNotifier<FormImages>(FormImages());

class CreateEmployeeScreen extends StatelessWidget {
  CreateEmployeeScreen({super.key});

  final _employeeFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  _getImagePath(EmployeeDocImage docType) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageNotifier.value = imageNotifier.value.copyWith(
      dni: docType == EmployeeDocImage.dni ? image!.path : null,
      curso: docType == EmployeeDocImage.curso ? image!.path : null,
      seguro: docType == EmployeeDocImage.seguro ? image!.path : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: StyledScreenTitle('Anadir neuvo obrero'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Form(
              key: _employeeFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(
                    icon: Icons.info_outline,
                    title: "introducir datos del obrero",
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

                  StyledLabel('Seguro Social'),
                  SizedBox(height: 4),

                  // TODO: Seguro Social - Handle upload
                  ChooseImageFile(
                    callback: () async {
                      await _getImagePath(EmployeeDocImage.seguro);
                    },
                  ),
                  DocImageBuilder(docType: EmployeeDocImage.seguro),

                  SizedBox(height: 16),

                  StyledLabel('DNI/NIE'),
                  SizedBox(height: 4),

                  // TODO: DNI/NIE - Handle upload
                  ChooseImageFile(
                    callback: () async {
                      await _getImagePath(EmployeeDocImage.dni);
                    },
                  ),
                  DocImageBuilder(docType: EmployeeDocImage.dni),
                  SizedBox(height: 16),

                  StyledLabel('Curso'),
                  SizedBox(height: 4),

                  // TODO: Curso - handle upload
                  ChooseImageFile(
                    callback: () async {
                      await _getImagePath(EmployeeDocImage.curso);
                    },
                  ),
                  DocImageBuilder(docType: EmployeeDocImage.curso),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Spacer(),
                      FilledButton.icon(
                        onPressed: null, //_clearForm,
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        icon: Icon(Icons.close),
                        label: Text('Anular'),
                      ),
                      SizedBox(width: 4),
                      FilledButton.icon(
                        onPressed: null, //_handelFormSubmit(context, ref),
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
