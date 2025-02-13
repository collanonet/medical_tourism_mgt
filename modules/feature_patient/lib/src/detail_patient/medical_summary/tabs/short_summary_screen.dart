// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'fileForm/file_form.dart';
import 'fileForm/popup_file_form.dart';
import 'normal_summary_model.dart';

class ShortSummaryScreen extends StatefulWidget {
  const ShortSummaryScreen({super.key});

  @override
  State<ShortSummaryScreen> createState() => _ShortSummaryScreenState();
}

class _ShortSummaryScreenState extends State<ShortSummaryScreen> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;

    return ValueListenableBuilder(
        valueListenable:
            context.read<NormalSummaryModel>().medicalRecordSummary,
        builder: (context, value, _) => Skeletonizer(
              enabled: value.loading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          const IntrinsicWidth(
                            stepWidth: 200,
                            child: ReactiveDatePickerField(
                              formControlName: 'entryDate',
                              label: '記載日',

                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  context.appTheme.spacing.borderRadiusMedium,
                                ),
                              ),
                              color: const Color(0xffF0F3F5),
                            ),
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginMedium),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'namePassport',
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffF0F3F5),
                                          label: Text(
                                            '氏名（パスポート）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    const Expanded(
                                      child: ReactiveDatePickerField(
                                        formControlName: 'dateOfBirth',
                                        label: '生年月日',

                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                '年齢', // TODO: l10n 対応 (年齢) (age)
                                              ),
                                              SizedBox(
                                                height: context.appTheme.spacing
                                                    .marginSmall,
                                              ),
                                              ReactiveValueListenableBuilder<
                                                      int>(
                                                  formControlName: 'age',
                                                  builder:
                                                      (context, value, child) {
                                                    return Text(
                                                      '${int.tryParse(value.value.toString()) ?? 0}歳', // TODO: l10n 対応 (歳) (age)
                                                    );
                                                  }),
                                            ],
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                '性別', //
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      value: true,
                                                      formControlName: 'gender',
                                                      title: const Text('男性'),
                                                    ),
                                                  ),
                                                  IntrinsicWidth(
                                                    child:
                                                        ReactiveRadioListTile(
                                                      value: false,
                                                      formControlName: 'gender',
                                                      title: const Text('女性'),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName:
                                            'nameChineseKanjiVietnamese',
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffF0F3F5),
                                          label: Text(
                                            '氏名（中国語漢字/ベトナム語表記）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'nameKana',
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffF0F3F5),
                                          label: Text(
                                            '氏名（カナ）',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'currentAddress',
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '現住所',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'mobileNumberPatient',
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffF0F3F5),
                                          label: Text(
                                            '携帯番号（患者様）',
                                          ),
                                        ),
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'mobileNumberDomestic',
                                        decoration: const InputDecoration(
                                          label: Text(
                                            '携帯番号（国内可）',
                                          ),
                                        ),
                                        keyboardType: TextInputType.phone,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName:
                                      'diseaseCourseSndTestResultsEtc',
                                  minLines: 5,
                                  maxLines: 15,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '病状経過および検査結果など',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          ValueListenableBuilder(
                              valueListenable: context
                                  .read<NormalSummaryModel>()
                                  .fileSummaryListData,
                              builder: (context, value, _) {
                                return Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  alignment: WrapAlignment.start,
                                  spacing:
                                      context.appTheme.spacing.marginMedium,
                                  runSpacing:
                                      context.appTheme.spacing.marginMedium,
                                  children: [
                                    ...value.data?.map((e) => InkWell(
                                              onTap: () {
                                                showPreviewFile(
                                                  context,
                                                  fileSelect: FileSelect(
                                                    // file name from object model
                                                      url: e.pathFile ?? ''
                                                  ),
                                                );
                                              },
                                              child: Avatar.network(
                                                e.pathFile,
                                                placeholder: const AssetImage(
                                                  Images.logoMadical,
                                                  package: 'core_ui',
                                                ),
                                                shape: BoxShape.rectangle,
                                                customSize:
                                                    const Size(300, 250),
                                              ),
                                            )) ??
                                        [],
                                    InkWell(
                                      onTap: () {
                                        filePicker().then((value) {
                                          if (value != null) {
                                            showCreateWithFileDialog(
                                                context, value);
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 300,
                                        height: 250,
                                        padding: EdgeInsets.all(
                                          context.appTheme.spacing
                                              .marginExtraLarge,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(
                                            context.appTheme.spacing
                                                .borderRadiusMedium,
                                          )),
                                          border: Border.all(
                                            color:
                                                context.appTheme.primaryColor,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.copy_all_rounded,
                                              size: 50,
                                              color:
                                                  context.appTheme.primaryColor,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                filePicker().then((value) {
                                                  if (value != null) {
                                                    showCreateWithFileDialog(
                                                        context, value);
                                                  }
                                                });
                                              },
                                              child: const Text(
                                                '書類を選択する',
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
                                    )
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                  ValueListenableListener(
                    valueListenable:
                        context.read<NormalSummaryModel>().submitData,
                    onListen: () {
                      final value =
                          context.read<NormalSummaryModel>().submitData.value;

                      if (value.hasData) {
                        snackBarWidget(
                          message: '正常に保存されました',
                          prefixIcon: const Icon(Icons.check_circle,
                              color: Colors.white),
                        );
                      }

                      if (value.hasError) {
                        snackBarWidget(
                          message: '保存できませんでした。 もう一度試してください。',
                          backgroundColor: Colors.red,
                          prefixIcon:
                              const Icon(Icons.error, color: Colors.white),
                        );
                      }
                    },
                    child: ReactiveFormConsumer(builder: (context, form, _) {
                      return ElevatedButton(
                        onPressed: form.invalid
                            ? null
                            : () {
                                context
                                    .read<NormalSummaryModel>()
                                    .submitSummary(formGroup);
                              },
                        child: const Text('保存'),
                      );
                    }),
                  )
                ],
              ),
            ));
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<NormalSummaryModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () => summaryFileForm(file: file)..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const PopupFileForm();
              },
            ),
          ),
        ),
      ),
    );
  }
}
