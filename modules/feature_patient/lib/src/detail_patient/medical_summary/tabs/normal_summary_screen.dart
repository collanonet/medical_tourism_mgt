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

class NormalSummaryScreen extends StatefulWidget {
  const NormalSummaryScreen({super.key});

  @override
  State<NormalSummaryScreen> createState() => _NormalSummaryScreenState();
}

class _NormalSummaryScreenState extends State<NormalSummaryScreen> {
  final formatter = InputFormatter();

  MedicalRecordOverseaData? _findOverseasDataById(
    List<MedicalRecordOverseaData>? list,
    String id,
  ) {
    if (list == null) return null;
    for (final item in list) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  String _buildOverseasDataLabel(
    MedicalRecordOverseaData? data,
    String fallbackId,
  ) {
    if (data == null) {
      return '選択済みデータ ($fallbackId)';
    }
    final parts = <String>[
      if ((data.documentName ?? '').isNotEmpty) data.documentName!,
      if ((data.category ?? '').isNotEmpty) data.category!,
      if (data.issueDate != null) Dates.formShortDate(data.issueDate),
    ];
    if (parts.isEmpty && (data.hospitalName ?? '').isNotEmpty) {
      parts.add(data.hospitalName!);
    }
    return parts.isEmpty ? '識別子: ${data.id}' : parts.join(' / ');
  }

  Future<void> _openOverseasDataSelector(FormGroup formGroup) async {
    final model = context.read<NormalSummaryModel>();
    final control =
        formGroup.control('overseasDataIds') as FormControl<List<String>>;
    final initialSelection =
        List<String>.from(control.value ?? <String>[]);

    final confirmedSelection =
        await showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return _OverseasDataSelectorSheet(
          model: model,
          initialSelection: initialSelection,
          onPreview: _openOverseasDataViewer,
        );
      },
    );

    if (confirmedSelection != null) {
      control.value = confirmedSelection;
      control.markAsDirty();
      setState(() {});
    }
  }

  void _openOverseasDataViewer(
    BuildContext context,
    MedicalRecordOverseaData data,
  ) {
    if (data.documentFile != null && data.documentFile!.isNotEmpty) {
      openUrlInBrowser(fileName: data.documentFile!);
      return;
    }
    if (data.sharedUrl != null && data.sharedUrl!.isNotEmpty) {
      openLinkInBrowser(url: data.sharedUrl!);
      return;
    }
    if (data.file != null &&
        data.file!.isNotEmpty &&
        data.file!.first.parentSeries.isNotEmpty) {
      final seriesId = data.file!.first.parentSeries;
      showDialog(
        context: context,
        builder: (_) => Dialog(
          child: SizedBox(
            width: 900,
            height: 600,
            child: DicomWebViewer(seriesId: seriesId),
          ),
        ),
      );
      return;
    }
    snackBarWidget(
      message: '表示できる画像リンクがありません',
      backgroundColor: Colors.red,
      prefixIcon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
    );
  }

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
                                  formControlName: 'diseaseName',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '病名',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'tissueType',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '組織型', // TODO: l10n 対応 (組織型) (tissueType)
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
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
                                          '特記事項',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'diseaseNotices',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'diseaseNotices',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
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
                                      'diagnosticMedicalInstitutionName',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '診断医療機関名', // TODO: l10n 対応 (診断医療機関名) (diagnosticMedicalInstitutionName)
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
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
                                  formControlName: 'pastIllnessFamilyHistory',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '既往症・家族歴',
                                    ),
                                  ),
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
                                      'referralMedicalInstitutionEtc',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '紹介元医療機関など',
                                    ),
                                  ),
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
                          ValueListenableBuilder<
                              AsyncData<List<MedicalRecordOverseaData>>>(
                            valueListenable: context
                                .watch<NormalSummaryModel>()
                                .overseasMedicalData,
                            builder: (context, overseasValue, _) {
                              final control =
                                  formGroup.control('overseasDataIds')
                                      as FormControl<List<String>>;
                              final selectedIds = List<String>.from(
                                  control.value ?? <String>[]);
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '海外診療データリンク',
                                        style: context.textTheme.titleMedium,
                                      ),
                                      TextButton.icon(
                                        onPressed: overseasValue.loading
                                            ? null
                                            : () => _openOverseasDataSelector(
                                                formGroup),
                                        icon: const Icon(Icons.link),
                                        label: const Text('追加'),
                                      ),
                                    ],
                                  ),
                                  if (overseasValue.loading)
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8),
                                      child: CircularProgressIndicator(),
                                    ),
                                  if (overseasValue.hasError)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      child: Text(
                                        '海外診療データの取得に失敗しました',
                                        style: context.textTheme.bodySmall
                                            ?.copyWith(color: Colors.red),
                                      ),
                                    ),
                                  if (!overseasValue.hasError &&
                                      !overseasValue.loading &&
                                      selectedIds.isEmpty)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4,
                                      ),
                                      child: Text(
                                        'リンクしたい海外診療データを追加してください。',
                                        style: context.textTheme.bodySmall,
                                      ),
                                    ),
                                  if (selectedIds.isNotEmpty)
                                    Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                      children: selectedIds.map((id) {
                                        final data = _findOverseasDataById(
                                          overseasValue.data,
                                          id,
                                        );
                                        final label =
                                            _buildOverseasDataLabel(data, id);
                                        return InputChip(
                                          label: Text(label),
                                          onPressed: data != null
                                              ? () => _openOverseasDataViewer(
                                                  context, data)
                                              : null,
                                          onDeleted: () {
                                            final updated = List<String>.from(
                                                control.value ?? <String>[]);
                                            updated.remove(id);
                                            control.value = updated;
                                            control.markAsDirty();
                                            setState(() {});
                                          },
                                        );
                                      }).toList(),
                                    ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'symptoms',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '症状', // TODO: l10n 対応 (症状) (symptom)
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
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
                                          '特記事項',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'notices',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'notices',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
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
                                          '転移',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'metastasis',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'metastasis',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
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
                                          '放射線治療有無',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'radiationTreatmentOrNot',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'radiationTreatmentOrNot',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
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
                                          '抗がん剤治療有無',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'presenceOfAnticancerDrugTreatment',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName:
                                                    'presenceOfAnticancerDrugTreatment',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
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
                                          '生検の有無',
                                        ),
                                        Row(
                                          children: <Widget>[
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'biopsy',
                                                value: true,
                                                title: const Text('あり'),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'biopsy',
                                                value: false,
                                                title: const Text('なし'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'patientsWishes',
                                  minLines: 1,
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '患者の希望事項',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Text(
                            '代理者（コーディネーターなど）',
                            style: context.textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'agentName',
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xffF0F3F5),
                                    label: Text(
                                      '名称',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
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
                                  formControlName: 'personInChargeName',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '担当者名',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'mobileNumber',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '電話番号',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
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
                                  formControlName: 'patientsAddressStay',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '患者滞在先',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
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
                                  formControlName: 'emergencyContact',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '緊急連絡先',
                                    ),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
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
                                  formControlName: 'remarks',
                                  decoration: const InputDecoration(
                                    label: Text(
                                      '備考',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          const Text('添付書類'),
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
                                                openUrlInBrowser(
                                                    fileName: e.pathFile ?? '');
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
                      return ValueListenableBuilder(
                          valueListenable:
                              context.read<NormalSummaryModel>().submitData,
                          builder: (context, value, _) {
                            return ElevatedButton(
                              onPressed: value.loading || form.invalid
                                  ? null
                                  : () {
                                      context
                                          .read<NormalSummaryModel>()
                                          .submitSummary(formGroup);
                                    },
                              child: WithLoadingButton(
                                isLoading: value.loading,
                                child: const Text('保存'),
                              ),
                            );
                          });
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

class _OverseasDataSelectorSheet extends StatefulWidget {
  const _OverseasDataSelectorSheet({
    required this.model,
    required this.initialSelection,
    required this.onPreview,
  });

  final NormalSummaryModel model;
  final List<String> initialSelection;
  final void Function(BuildContext, MedicalRecordOverseaData) onPreview;

  @override
  State<_OverseasDataSelectorSheet> createState() =>
      _OverseasDataSelectorSheetState();
}

class _OverseasDataSelectorSheetState
    extends State<_OverseasDataSelectorSheet> {
  late List<String> _tempSelectedIds = List<String>.from(
    widget.initialSelection,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: ValueListenableBuilder<
            AsyncData<List<MedicalRecordOverseaData>>>(
          valueListenable: widget.model.overseasMedicalData,
          builder: (context, value, _) {
            if (value.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (value.hasError) {
              return Column(
                children: [
                  _buildHeader(context, onClose: () => Navigator.pop(context)),
                  Expanded(
                    child: Center(
                      child: Text(
                        '海外診療データの取得に失敗しました',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }

            final dataList = value.data ?? [];
            return Column(
              children: [
                _buildHeader(
                  context,
                  onClose: () => Navigator.pop(context),
                ),
                if (dataList.isEmpty)
                  const Expanded(
                    child: Center(
                      child: Text('連携可能な海外診療データがありません'),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.separated(
                      itemCount: dataList.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final data = dataList[index];
                        final selected = _tempSelectedIds.contains(data.id);
                        return ListTile(
                          onTap: () {
                            setState(() {
                              if (selected) {
                                _tempSelectedIds.remove(data.id);
                              } else {
                                _tempSelectedIds.add(data.id);
                              }
                            });
                          },
                          leading: Checkbox(
                            value: selected,
                            onChanged: (checked) {
                              setState(() {
                                if (checked == true) {
                                  if (!_tempSelectedIds.contains(data.id)) {
                                    _tempSelectedIds.add(data.id);
                                  }
                                } else {
                                  _tempSelectedIds.remove(data.id);
                                }
                              });
                            },
                          ),
                          title: Text(
                            data.documentName ??
                                data.hospitalName ??
                                '名称未設定',
                          ),
                          subtitle: Text([
                            data.category,
                            if (data.issueDate != null)
                              Dates.formShortDate(data.issueDate),
                          ].whereType<String>().join(' / ')),
                          trailing: IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {
                              widget.onPreview(context, data);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context, List<String>.from(_tempSelectedIds));
                        },
                        icon: const Icon(Icons.add_link),
                        label: Text(
                          _tempSelectedIds.isEmpty
                              ? '追加する'
                              : '追加する (${_tempSelectedIds.length})',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, {required VoidCallback onClose}) {
    return ListTile(
      title: const Text('海外診療データを選択'),
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: onClose,
      ),
    );
  }
}
