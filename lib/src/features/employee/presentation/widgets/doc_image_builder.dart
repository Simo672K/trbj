import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trbj/src/features/employee/presentation/create_employee_screen/create_employee_screen.dart';
import 'package:trbj/src/theme/app_theme.dart';

class DocImageBuilder extends StatelessWidget {
  const DocImageBuilder({super.key, required this.docType});
  final EmployeeDocImage docType;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: imageNotifier,
      builder: (context, images, child) {
        if (images.getDocType(docType) != null) {
          final file = File(images.getDocType(docType)!);
          if (file.existsSync()) {
            return Column(
              children: [
                SizedBox(height: 16),
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppThemeColors.primaryColorAccent,
                          width: 3,
                        ),
                      ),
                      child: Image.file(file),
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppThemeColors.primaryColorAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: IconButton(
                          color: AppThemeColors.primaryColorAccent,
                          onPressed: () {
                            imageNotifier.value = imageNotifier.value.copyWith(
                              dni: docType == EmployeeDocImage.dni ? '' : null,
                              curso:
                                  docType == EmployeeDocImage.curso ? '' : null,
                              seguro:
                                  docType == EmployeeDocImage.seguro
                                      ? ''
                                      : null,
                            );
                          },
                          icon: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        }
        return Container();
      },
    );
  }
}
