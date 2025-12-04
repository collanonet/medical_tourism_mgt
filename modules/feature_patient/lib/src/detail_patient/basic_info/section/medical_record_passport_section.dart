// Dart imports:
import 'dart:html' as html;

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../basic_info_model.dart';

class MedicalRecordPassportSection extends StatefulWidget {
  const MedicalRecordPassportSection({super.key});

  @override
  State<MedicalRecordPassportSection> createState() =>
      _MedicalRecordPassportSectionState();
}

class _MedicalRecordPassportSectionState
    extends State<MedicalRecordPassportSection> {
  final formatter = InputFormatter();
  List visaType = ['medicalGuarantee', 'other'];

  String selectVisaType = 'medicalGuarantee';

  Row addRadioButton(int btnValue, String title, FormGroup formGroup) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: visaType[btnValue],
          groupValue: selectVisaType,
          onChanged: (value) {
            setState(() {
              formGroup.control('visaType').value = value;
              selectVisaType = value;
            });
          },
        ),
        Text(title == 'medicalGuarantee' ? '医療ビザ（身元保証書依頼）' : 'その他')
      ],
    );
  }

  List underConfirmation = [true, false];

  bool selectUnderConfirmation = false;

  Row addRadioUnderConfirmationButton(int btnValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        selectUnderConfirmation
            ? Icon(
                Icons.radio_button_checked_rounded,
                color: context.appTheme.primaryColor,
              )
            : const Icon(Icons.radio_button_off_rounded),
        const Text(
          '確認中', // TODO: l10n 対応 (確認中) (underConfirmation)
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('PATIENT_PASSPORTS') as FormGroup;

    return ValueListenableBuilder(
        valueListenable: context.read<BasicInformationModel>().patientPassport,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: ReactiveForm(
              formGroup: formGroup,
              child: ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  const Text(
                    'パスポート',
                    style: TextStyle(
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                      fontWeight: FontWeight.bold,
                    ),
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
                          formControlName: 'passportNumber',
                          decoration: const InputDecoration(
                            label: Text(
                              '旅券番号', //   TODO: l10n 対応 (旅券番号) (passportNumber)
                            ),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z0-9]'),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: ReactiveDatePickerField(
                          formControlName: 'issueDate',
                          label: '発行日',
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
                    children: const [
                      Expanded(
                        child: ReactiveDatePickerField(
                          formControlName: 'expirationDate',
                          label: '有効期限',
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Expanded(child: SizedBox()),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ビザ', //  TODO: l10n 対応 (ビザ) (visa)
                            ),
                            Row(
                              children: <Widget>[
                                IntrinsicWidth(
                                  stepWidth: 50,
                                  child: ReactiveRadioListTile<String?>(
                                    value: 'medicalGuarantee',
                                    contentPadding: EdgeInsets.zero,
                                    formControlName: 'visaType',
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: const Text('医療ビザ（身元保証書依頼）'),
                                  ),
                                ),
                                IntrinsicWidth(
                                  stepWidth: 50,
                                  child: ReactiveRadioListTile<String?>(
                                    value: 'other',
                                    contentPadding: EdgeInsets.zero,
                                    formControlName: 'visaType',
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: const Text('その他'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: context.appTheme.spacing.marginSmall),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('ビザ種類'),
                                    ConstrainedBox(
                                      constraints:
                                          const BoxConstraints(maxWidth: 320),
                                      child: ReactiveTextField(
                                        formControlName: 'visaCategory',
                                        decoration: const InputDecoration(
                                          hintText: 'ビザ種類',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginLarge,
                                ),
                                IntrinsicWidth(
                                  stepWidth: 50,
                                  child: ReactiveRadioListTile<bool?>(
                                    value: false,
                                    contentPadding: EdgeInsets.zero,
                                    formControlName: 'underConfirmation',
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: const Text('確認中'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildPassportImageField(formGroup),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildPassportImageField(FormGroup formGroup) {
    if (!formGroup.contains('passportImage')) {
      return const SizedBox.shrink();
    }

    final control = formGroup.control('passportImage');
    final file = control.value as FileSelect?;

    return ColumnSeparated(
      crossAxisAlignment: CrossAxisAlignment.start,
      separatorBuilder: (context, index) =>
          SizedBox(height: context.appTheme.spacing.marginSmall),
      children: [
        const Text(
          'パスポート画像',
          style: TextStyle(
            fontFamily: 'NotoSansJP',
            package: 'core_ui',
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DragTarget<List<html.File>>(
              onWillAccept: (data) => true,
              onAccept: (files) async {
                try {
                  final fileSelect = await handleFileDrop(files);
                  if (fileSelect != null) {
                    control.value = fileSelect;
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('エラー: $e')),
                  );
                }
              },
              builder: (context, candidateData, rejectedData) {
                final isHovering = candidateData.isNotEmpty;
                return InkWell(
                  onTap: () async {
                    final result = await filePicker();
                    if (result != null) {
                      control.value = result;
                    }
                  },
                  child: Container(
                    width: 250,
                    height: 250,
                    padding:
                        EdgeInsets.all(context.appTheme.spacing.marginMedium),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isHovering
                            ? Colors.green
                            : context.appTheme.primaryColor,
                        width: isHovering ? 3 : 1,
                      ),
                      borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium),
                      color: isHovering
                          ? Colors.green.withOpacity(0.1)
                          : Colors.transparent,
                    ),
                    child: file != null && file.file != null
                        ? Image.memory(
                            file.file!,
                            fit: BoxFit.cover,
                          )
                        : file != null && file.url != null
                            ? Avatar.network(
                                file.url,
                                placeholder: const AssetImage(
                                  Images.logoMadical,
                                  package: 'core_ui',
                                ),
                                shape: BoxShape.rectangle,
                                customSize: const Size(250, 250),
                              )
                            : ColumnSeparated(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                separatorBuilder: (context, index) => SizedBox(
                                  height:
                                      context.appTheme.spacing.marginMedium,
                                ),
                                children: [
                                  Icon(
                                    isHovering
                                        ? Icons.cloud_upload
                                        : Icons.copy_all_rounded,
                                    color: isHovering ? Colors.green : null,
                                  ),
                                  Text(
                                    isHovering
                                        ? 'ここにドロップしてください'
                                        : 'パスポートをアップロード',
                                    style: TextStyle(
                                      color:
                                          isHovering ? Colors.green : null,
                                      fontSize: 13,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      final result = await filePicker();
                                      if (result != null) {
                                        control.value = result;
                                      }
                                    },
                                    child: const Text('ファイルを選択する'),
                                  ),
                                ],
                              ),
                  ),
                );
              },
            ),
            if (file != null) ...[
              SizedBox(width: context.appTheme.spacing.marginSmall),
              Column(
                children: [
                  IconButton(
                    tooltip: 'ダウンロード',
                    onPressed: () => _downloadPassportFile(file),
                    icon: const Icon(Icons.download),
                  ),
                  SizedBox(height: context.appTheme.spacing.marginSmall),
                  IconButton(
                    tooltip: '削除',
                    onPressed: () {
                      control.value = null;
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ],
    );
  }

  Future<void> _downloadPassportFile(FileSelect file) async {
    final downloadName = file.filename ?? 'passport_image';
    try {
      if (file.path != null && file.path!.isNotEmpty) {
        await downloadFile(
          fileName: file.path!,
          downloadName: downloadName,
        );
        return;
      }

      if (file.url != null && file.url!.isNotEmpty) {
        final anchor = html.AnchorElement(href: file.url)
          ..download = downloadName
          ..target = '_blank';
        html.document.body?.append(anchor);
        anchor.click();
        anchor.remove();
        return;
      }

      if (file.file != null && file.file!.isNotEmpty) {
        final blob = html.Blob([file.file!]);
        final objectUrl = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: objectUrl)
          ..download = downloadName;
        html.document.body?.append(anchor);
        anchor.click();
        anchor.remove();
        html.Url.revokeObjectUrl(objectUrl);
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ダウンロードできるファイルが見つかりませんでした')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ダウンロードに失敗しました: $e')),
      );
    }
  }
}
