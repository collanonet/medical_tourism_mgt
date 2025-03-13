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
import 'package:path/path.dart' as p;

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
                        ReactiveFormArray(
                          formArrayName: 'chatToolLink',
                          builder: (context, formArray, child) {
                            final rows = formArray.controls
                                .map((control) => control as FormGroup)
                                .map(
                                  (currentForm) => ReactiveForm(
                                    formGroup: currentForm,
                                    child: RowSeparated(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        );
                                      },
                                      children: [
                                        Expanded(
                                          child: ReactiveTextField(
                                            formControlName: 'chatToolLink',
                                            keyboardType: TextInputType.url,
                                            decoration: const InputDecoration(
                                              label: Text(
                                                'チャットツールリンク',
                                              ),
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.deny(
                                                  RegExp(r'\s')),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );

                            return ColumnSeparated(
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              ),
                              children: rows.toList(),
                            );
                          },
                        ),
                        InkWell(
                          onTap: () {
                            (formGroup.control('chatToolLink') as FormArray)
                                .add(
                              FormGroup({
                                'chatToolLink': FormControl<String>(),
                              }),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: context.appTheme.primaryColor,
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginSmall,
                              ),
                              Text(
                                'チャットツールリンクを追加',
                                style: TextStyle(
                                    fontFamily: 'NotoSansJP',
                                    package: 'core_ui',
                                    color: context.appTheme.primaryColor),
                              )
                            ],
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
                            Container(
                              width: 250,
                              height: 250,
                              padding: EdgeInsets.all(
                                  context.appTheme.spacing.marginMedium),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: context.appTheme.primaryColor),
                                borderRadius: BorderRadius.circular(context
                                    .appTheme.spacing.borderRadiusMedium),
                              ),
                              child: Image.asset(
                                Images.sampleQr,
                                package: 'core_ui',
                              ),
                            ),
                            qRChatCompanion(formGroup, context),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  Widget qRChatCompanion(FormGroup currentForm, BuildContext context) {
    // Attempt to read a FileSelect from the form control
    final file = currentForm.control('chatQrImage').value as FileSelect?;

    // Safely derive the path from whichever field is non-null.
    // (Might be local filename, remote url, etc.)
    final path = file?.url?.isNotEmpty == true
        ? file!.url!
        : (file?.filename?.isNotEmpty == true ? file!.filename! : null);

    // Helper methods to check file type by extension
    bool isImageFile(String pathOrUrl) {
      final extension = p.extension(pathOrUrl).toLowerCase();
      const imageExtensions = [
        '.png',
        '.jpg',
        '.jpeg',
        '.gif',
        '.webp',
        '.bmp'
      ];
      return imageExtensions.contains(extension);
    }

    bool isPdfFile(String pathOrUrl) {
      return p.extension(pathOrUrl).toLowerCase() == '.pdf';
    }

    // Builds a file preview widget based on the file type (PDF, image, or unknown).
    Widget filePreview(String path) {
      if (isPdfFile(path)) {
        // PDF => show an icon preview
        return Container(
          width: 250,
          height: 250,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(
                context.appTheme.spacing.borderRadiusMedium),
            border: Border.all(color: context.appTheme.primaryColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.picture_as_pdf, size: 60, color: Colors.red),
              Text(
                p.basename(path),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      } else if (isImageFile(path)) {
        // Image => show image
        return Avatar.network(
          path,
          placeholder: const AssetImage(
            Images.logoMadical, // Adjust to your asset reference
            package: 'core_ui',
          ),
          shape: BoxShape.rectangle,
          customSize: const Size(250, 250),
        );
      } else {
        // Unknown file type => show a generic file icon
        return Container(
          width: 250,
          height: 250,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(
                context.appTheme.spacing.borderRadiusMedium),
            border: Border.all(color: context.appTheme.primaryColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.insert_drive_file, size: 60, color: Colors.grey),
              Text(
                p.basename(path),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      }
    }

    Widget _buildNoFilePlaceholder(BuildContext context, FormGroup form) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.copy_all_rounded),
          const SizedBox(height: 10),
          const Text('QRコードをここにドラッグ＆ドロップ'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              // Using your filePicker() method
              final value = await filePicker();
              form.control('chatQrImage').value = value;
            },
            child: const Text('またはファイルを選択する'),
          ),
        ],
      );
    }

    // The InkWell that holds the preview and allows preview on tap
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () async {
            if (path != null && path.isNotEmpty) {
              // If we have a file/path, show the preview.
              showPreviewFile(context, fileSelect: FileSelect(url: path));
            } else {
              // No file => pick a file
              final value = await imagePicker();
              // Assuming your FileSelect is the correct type:
              currentForm.control('chatQrImage').value = value;
            }
          },
          child: Container(
            width: 250,
            height: 250,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: (path != null && path.isNotEmpty)
                ? filePreview(path)
                : _buildNoFilePlaceholder(context, currentForm),
          ),
        ),

        // Delete icon if file is present
        if (path != null && path.isNotEmpty)
          IconButton(
            onPressed: () {
              currentForm.control('chatQrImage').value = null;
            },
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
      ],
    );
  }

  // Widget qRChatCompanion(FormGroup currentForm, BuildContext context) {
  //   final file = currentForm.control('chatQrImage').value as FileSelect?;

  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.end,
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: [
  //       InkWell(
  //         onTap: () {
  //           filePicker().then((value) {
  //             currentForm.control('chatQrImage').value = value;
  //           });
  //         },
  //         child: Container(
  //           width: 250,
  //           height: 250,
  //           padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
  //           decoration: BoxDecoration(
  //             border: Border.all(color: context.appTheme.primaryColor),
  //             borderRadius: BorderRadius.circular(
  //                 context.appTheme.spacing.borderRadiusMedium),
  //           ),
  //           child: file != null && file.file != null
  //               ? Image.memory(
  //                   file.file!,
  //                   fit: BoxFit.fill,
  //                 )
  //               : file != null && file.url != null
  //                   ? Avatar.network(
  //                       file.url,
  //                       placeholder: const AssetImage(
  //                         Images.logoMadical,
  //                         package: 'core_ui',
  //                       ),
  //                       shape: BoxShape.rectangle,
  //                       customSize: const Size(200, 200),
  //                     )
  //                   : ColumnSeparated(
  //                       crossAxisAlignment: CrossAxisAlignment.center,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       separatorBuilder: (BuildContext context, int index) {
  //                         return SizedBox(
  //                           height: context.appTheme.spacing.marginMedium,
  //                         );
  //                       },
  //                       children: [
  //                         const Icon(Icons.copy_all_rounded),
  //                         const Text('QRコードをここにドラッグ＆ドロップ'),
  //                         ElevatedButton(
  //                             onPressed: () {
  //                               filePicker().then((value) {
  //                                 currentForm.control('chatQrImage').value =
  //                                     value;
  //                               });
  //                             },
  //                             child: const Text('またはファイルを選択する'))
  //                       ],
  //                     ),
  //         ),
  //       ),
  //       if (file != null)
  //         IconButton(
  //           onPressed: () {
  //             currentForm.control('chatQrImage').value = null;
  //           },
  //           icon: const Icon(
  //             Icons.delete,
  //             color: Colors.red,
  //           ),
  //         )
  //     ],
  //   );
  // }
}
