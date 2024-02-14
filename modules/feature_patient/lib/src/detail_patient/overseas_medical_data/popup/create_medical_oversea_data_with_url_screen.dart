import 'dart:io';

import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'create_medical_oversea_data_with_file_screen.dart';

class CreateMedicalOverseaDataWithUrlScreen extends StatefulWidget {
  const CreateMedicalOverseaDataWithUrlScreen({super.key});

  @override
  State<CreateMedicalOverseaDataWithUrlScreen> createState() =>
      _CreateMedicalOverseaDataWithUrlScreenState();
}

class _CreateMedicalOverseaDataWithUrlScreenState
    extends State<CreateMedicalOverseaDataWithUrlScreen> {
  bool isSaveurl = false;

  Future<File?> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = InputFormatter();
    final formGroup = ReactiveForm.of(context) as FormGroup;

    return isSaveurl
        ? const CreateMedicalOverseaDataWithFileScreen()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '外部URLをペーストしてください。',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)),
                ],
              ),
              Text(
                '共有用URL',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              ReactiveTextField(
                formControlName: 'sharedUrl',
              ),
              Text(
                'パスワード',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              ReactiveTextField(
                formControlName: 'password',
              ),
              Text(
                '閲覧有効期限',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ReactiveDatePicker<DateTime>(
                      formControlName: 'expirationDate',
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                      builder: (BuildContext context,
                          ReactiveDatePickerDelegate<dynamic> picker,
                          Widget? child) {
                        return ReactiveTextField<DateTime>(
                          formControlName: 'expirationDate',
                          valueAccessor: DateTimeValueAccessor(
                            dateTimeFormat: DateFormat('yyyy/MM/dd'),
                          ),
                          decoration: InputDecoration(
                            label: Text(
                              context.l10n.labelEntryDateFrom,
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                CupertinoIcons.calendar,
                                color: Colors.grey,
                              ),
                              onPressed: picker.showPicker,
                            ),
                          ),
                          inputFormatters: [
                            formatter.dateFormatter,
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  Expanded(
                    child: ReactiveValueListenableBuilder<File>(
                        formControlName: 'qrCode',
                        builder: (context, control, _) {
                          logger.d('control.valid: ${control.valid}');
                          return InkWell(
                            onTap: () {
                              pickFile().then((value) {
                                if (value != null) {
                                  formGroup.control('qrCode').value = value;
                                  setState(() {});
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                context.appTheme.spacing.marginExtraLarge,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                  context.appTheme.spacing.borderRadiusMedium,
                                )),
                                border: Border.all(
                                  color: control.valid
                                      ? context.appTheme.primaryColor
                                      : Colors.red,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'QRコード画像を\nドラッグ&ドロップ',
                                    style:
                                        context.textTheme.titleLarge?.copyWith(
                                      color: context.appTheme.primaryColor,
                                    ),
                                  ),
                                  Icon(
                                    Icons.copy_all_rounded,
                                    size: 50,
                                    color: context.appTheme.primaryColor,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      pickFile().then((value) {
                                        if (value != null) {
                                          formGroup.control('qrCode').value =
                                              value;
                                          setState(() {});
                                        }
                                      });
                                    },
                                    child: const Text(
                                      'ファイルを選択',
                                      style: TextStyle(
                                        fontFamily: 'NotoSansJP',
                                        package: 'core_ui',
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
              SizedBox(
                height: context.appTheme.spacing.marginExtraLarge,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReactiveFormConsumer(builder: (context, form, _) {
                    return ElevatedButton(
                      onPressed: form.invalid
                          ? null
                          : () {
                              formGroup.control('hospitalName').setValidators([
                                Validators.required,
                              ]);
                              formGroup.control('documentName').setValidators([
                                Validators.required,
                              ]);
                              formGroup.control('issueDate').setValidators([
                                Validators.required,
                              ]);
                              setState(() {
                                isSaveurl = true;
                              });
                            },
                      child: Text('保存する'),
                    );
                  }),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('キャンセル'),
                  ),
                ],
              )
            ],
          );
  }
}
