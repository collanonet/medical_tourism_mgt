// Dart imports:
import 'dart:html' as html;

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../basic_info_model.dart';

class MedicalRecordNationalitySection extends StatelessWidget {
  const MedicalRecordNationalitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('PATIENT_NATIONALITIES') as FormGroup;
    return ValueListenableBuilder(
        valueListenable:
            context.watch<BasicInformationModel>().patientNationalities,
        builder: (context, value, _) => Skeletonizer(
              enabled: value.loading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '国籍と連絡先',
                    style: TextStyle(
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  ReactiveForm(
                    formGroup: formGroup,
                    child: ColumnSeparated(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      children: [
                        RowSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            Expanded(
                              child: ReactiveTextField(
                                formControlName: 'nationality',
                                decoration: const InputDecoration(
                                  label: Text(
                                    '国籍', // Todo: l10n (国籍)
                                  ),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ReactiveTextField(
                                formControlName: 'nativeLanguage',
                                decoration: const InputDecoration(
                                  label: Text(
                                    '母国語', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox())
                          ],
                        ),
                        RowSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            Expanded(
                              child: ReactiveTextField(
                                formControlName: 'residentialArea',
                                decoration: const InputDecoration(
                                  label: Text(
                                    '居住地域', // Todo: l10n (国籍)
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ReactiveTextField(
                                formControlName: 'currentAddress',
                                decoration: const InputDecoration(
                                  label: Text(
                                    '住所（つづき）',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        RowSeparated(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            Expanded(
                              child: ReactiveTextField(
                                formControlName: 'mobileNumber',
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixText: '+ ',
                                  label: Text(
                                    '携帯番号',
                                  ),
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ReactiveTextField(
                                formControlName: 'email',
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  label: Text(
                                    'Email',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

}

class MedicalRecordQrSection extends StatelessWidget {
  const MedicalRecordQrSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          context.watch<BasicInformationModel>().patientNationalities,
      builder: (context, value, _) {
        final formGroup = (ReactiveForm.of(context) as FormGroup)
            .control('PATIENT_NATIONALITIES') as FormGroup;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '国籍と連絡先',
              style: TextStyle(
                fontFamily: 'NotoSansJP',
                package: 'core_ui',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            ReactiveForm(
              formGroup: formGroup,
              child: ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                children: [
                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      );
                    },
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'nationality',
                          decoration: const InputDecoration(
                            label: Text('国籍'),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'nativeLanguage',
                          decoration: const InputDecoration(
                            label: Text('母国語'),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      );
                    },
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'residentialArea',
                          decoration: const InputDecoration(
                            label: Text('居住地域'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ReactiveTextField(
                          formControlName: 'currentAddress',
                          decoration: const InputDecoration(
                            label: Text('住所（つづき）'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  RowSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      );
                    },
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'mobileNumber',
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            prefixText: '+ ',
                            label: Text('携帯番号'),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'email',
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            label: Text('Email'),
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            RowSeparated(
              crossAxisAlignment: CrossAxisAlignment.start,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                );
              },
              children: [
                Container(
                  width: 250,
                  height: 250,
                  padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
                  decoration: BoxDecoration(
                    border: Border.all(color: context.appTheme.primaryColor),
                    borderRadius: BorderRadius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    ),
                  ),
                  child: Image.asset(
                    Images.sampleQr,
                    package: 'core_ui',
                  ),
                ),
                _qrUploadArea(formGroup, context),
              ],
            ),
          ],
        );
      },
    );
  }
}

Widget _qrUploadArea(FormGroup currentForm, BuildContext context) {
  final file = currentForm.control('chatQrImage').value as FileSelect?;

  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      DragTarget<List<html.File>>(
        onWillAccept: (data) => true,
        onAccept: (files) async {
          try {
            final fileSelect = await handleFileDrop(files);
            if (fileSelect != null) {
              currentForm.control('chatQrImage').value = fileSelect;
            }
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('エラー: $e')),
            );
          }
        },
        builder: (context, candidateData, rejectedData) {
          return InkWell(
            onTap: () {
              imagePicker().then((value) {
                currentForm.control('chatQrImage').value = value;
              });
            },
            child: Container(
              width: 250,
              height: 250,
              padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
              decoration: BoxDecoration(
                border: Border.all(
                  color: candidateData.isNotEmpty
                      ? Colors.green
                      : context.appTheme.primaryColor,
                  width: candidateData.isNotEmpty ? 3 : 1,
                ),
                borderRadius: BorderRadius.circular(
                    context.appTheme.spacing.borderRadiusMedium),
                color: candidateData.isNotEmpty
                    ? Colors.green.withOpacity(0.1)
                    : Colors.transparent,
              ),
              child: file != null && file.file != null
                  ? Image.memory(
                      file.file!,
                      fit: BoxFit.fill,
                    )
                  : file != null && file.url != null
                      ? Avatar.network(
                          file.url,
                          placeholder: const AssetImage(
                            Images.logoMadical,
                            package: 'core_ui',
                          ),
                          shape: BoxShape.rectangle,
                          customSize: const Size(200, 200),
                        )
                      : ColumnSeparated(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            );
                          },
                          children: [
                            Icon(
                              candidateData.isNotEmpty
                                  ? Icons.cloud_upload
                                  : Icons.copy_all_rounded,
                              color:
                                  candidateData.isNotEmpty ? Colors.green : null,
                            ),
                            Text(
                              candidateData.isNotEmpty
                                  ? 'ここにドロップしてください'
                                  : 'QRコードをアップロード',
                              style: TextStyle(
                                color: candidateData.isNotEmpty
                                    ? Colors.green
                                    : null,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                imagePicker().then((value) {
                                  currentForm.control('chatQrImage').value =
                                      value;
                                });
                              },
                              child: const Text('ファイルを選択する'),
                            ),
                          ],
                        ),
            ),
          );
        },
      ),
      if (file != null)
        IconButton(
          onPressed: () {
            currentForm.control('chatQrImage').value = null;
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
    ],
  );
}
