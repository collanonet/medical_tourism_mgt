// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'web_appointment_detail_model.dart';

class WebAppointmentDetailScreen extends StatefulWidget {
  const WebAppointmentDetailScreen({super.key});

  @override
  State<WebAppointmentDetailScreen> createState() =>
      _WebAppointmentDetailScreenState();
}

class _WebAppointmentDetailScreenState
    extends State<WebAppointmentDetailScreen> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: context.watch<WebAppointmentDetailModel>().webBooking,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Web予約',
                      style: context.textTheme.titleMedium,
                    )),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '患者',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'patientName',
                                  decoration: const InputDecoration(
                                    labelText: '患者名',
                                  ),
                                  readOnly: true,
                                ),
                              ),
                              SizedBox(width: context.appTheme.spacing.marginMedium),
                              ElevatedButton(
                                onPressed: () {
                                  // 簡易的な検索ダイアログを表示
                                   showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      final searchController = TextEditingController();
                                      return AlertDialog(
                                        title: const Text('患者検索'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: searchController,
                                              decoration: const InputDecoration(labelText: '名前で検索'),
                                            ),
                                            const SizedBox(height: 10),
                                            SizedBox(
                                              height: 200,
                                              width: double.maxFinite,
                                              child: ValueListenableBuilder(
                                                valueListenable: context.read<WebAppointmentDetailModel>().patients,
                                                builder: (context, patients, _) {
                                                  if (patients == null || patients.isEmpty) {
                                                    return const Center(child: Text('検索結果なし'));
                                                  }
                                                  return ListView.builder(
                                                    itemCount: patients.length,
                                                    itemBuilder: (context, index) {
                                                      final p = patients[index];
                                                      final name = '${p.firstNameRomanized ?? ''} ${p.middleNameRomanized ?? ''} ${p.familyNameRomanized ?? ''}'.trim();
                                                      return ListTile(
                                                        title: Text(name.isNotEmpty ? name : 'No Name'),
                                                        onTap: () {
                                                          context.read<WebAppointmentDetailModel>().selectPatient(p);
                                                          Navigator.pop(context);
                                                        },
                                                      );
                                                    },
                                                  );
                                                }
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              context.read<WebAppointmentDetailModel>().searchPatient(search: searchController.text);
                                            },
                                            child: const Text('検索実行'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(context),
                                            child: const Text('閉じる'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: const Text('検索'),
                              ),
                            ],
                          ),
                          SizedBox(
                             height: context.appTheme.spacing.marginMedium,
                          ),
                          const Divider(),
                          Text(
                            '医療機関',
                            style: context.textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ValueListenableListener(
                                  valueListenable: context
                                      .read<WebAppointmentDetailModel>()
                                      .hospitals,
                                  onListen: () {
                                    var data = context
                                        .read<WebAppointmentDetailModel>()
                                        .hospitals
                                        .value;

                                    if (data.hasError) {
                                      snackBarWidget(
                                          message: '病院が見つからない。',
                                          backgroundColor: Colors.red);
                                    }
                                  },
                                  child: ValueListenableBuilder(
                                      valueListenable: context
                                          .watch<WebAppointmentDetailModel>()
                                          .hospitals,
                                      builder: (context, hospitalsList, _) {
                                        return ReactiveDropdownField<
                                            BasicInformationHospitalResponse>(
                                          formControlName: 'hospitalSelect',
                                          decoration: const InputDecoration(
                                            labelText: '医療機関名',
                                          ),
                                          items: hospitalsList.data
                                                  ?.map((e) => DropdownMenuItem(
                                                        value: e,
                                                          child: Text((e
                                                                          .hospitalNameChinese
                                                                          ?.isNotEmpty ??
                                                                      false)
                                                                  ? e.hospitalNameChinese!
                                                                  : e.hospitalNameKatakana ??
                                                                      'NoName'),
                                                      ))
                                                  .toList() ??
                                              [],
                                        );
                                      }),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ValueListenableListener(
                                  valueListenable: context
                                      .read<WebAppointmentDetailModel>()
                                      .doctors,
                                  onListen: () {
                                    var data = context
                                        .read<WebAppointmentDetailModel>()
                                        .doctors
                                        .value;

                                    if (data.hasData &&
                                        data.requireData.isEmpty) {
                                      snackBarWidget(
                                          message: 'この病院には医者が登録されていません。医師名なしで保存できます。',
                                          backgroundColor: Colors.orange);
                                    }

                                    if (data.hasError) {
                                      snackBarWidget(
                                          message: '医者情報を取得できませんでした。',
                                          backgroundColor: Colors.orange);
                                    }
                                  },
                                  child: ValueListenableBuilder(
                                      valueListenable: context
                                          .watch<WebAppointmentDetailModel>()
                                          .doctors,
                                      builder: (context, value, _) {
                                        return Skeletonizer(
                                          enabled: value.loading,
                                          child: ReactiveDropdownField<
                                              DoctorProfileHospitalResponse>(
                                            formControlName: 'doctorName',
                                            decoration: const InputDecoration(
                                              labelText: '医者',
                                            ),
                                            items: value.data
                                                    ?.map((e) => DropdownMenuItem(
                                                          value: e,
                                                          child: Text(
                                                              e.nameKanji ??
                                                                  'NoName'),
                                                          onTap: () {
                                                            context
                                                                .read<WebAppointmentDetailModel>()
                                                                .selectDoctor(e);
                                                          },
                                                        ))
                                                    .toList() ??
                                                [
                                                  const DropdownMenuItem(
                                                    value: null,
                                                    child: Text('NoName'),
                                                  )
                                                ],
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Text(
                            '診療時間',
                            style: context.textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          // 診療時間テーブル
                          Container(
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginMedium),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    const IntrinsicWidth(
                                      stepWidth: 150,
                                      child: Text(
                                        '部門',
                                        style: TextStyle(
                                          fontFamily: 'NotoSansJP',
                                          package: 'core_ui',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.appTheme.spacing.marginMedium,
                                    ),
                                    const IntrinsicWidth(
                                      stepWidth: 200,
                                      child: Text(
                                        '診療時間',
                                        style: TextStyle(
                                          fontFamily: 'NotoSansJP',
                                          package: 'core_ui',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.appTheme.spacing.marginMedium,
                                    ),
                                    for (var day in ['月', '火', '水', '木', '金', '土', '日']) ...[
                                      IntrinsicWidth(
                                        stepWidth: 80,
                                        child: boxText(
                                          context,
                                          day,
                                          textColor: Colors.white,
                                          bg: context.appTheme.primaryColor,
                                        ),
                                      ),
                                      SizedBox(width: context.appTheme.spacing.marginMedium),
                                    ]
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  children: [
                                    IntrinsicWidth(
                                      stepWidth: 150,
                                      child: ReactiveTextField(
                                        formControlName: 'department1',
                                      ),
                                    ),
                                    SizedBox(width: context.appTheme.spacing.marginMedium),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'shift1',
                                            ),
                                          ),
                                          const Text(' ~ '),
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'shift1End',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: context.appTheme.spacing.marginMedium),
                                    for (var day in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']) ...[
                                       IntrinsicWidth(
                                        stepWidth: 80,
                                        child: ReactiveDropdownFormField(
                                          formControlName: 'shift1$day',
                                          items: [
                                            DropdownMenuItem(value: '×', child: Text('×')),
                                            DropdownMenuItem(value: '○', child: Text('○')),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: context.appTheme.spacing.marginMedium),
                                    ]
                                  ],
                                ),
                                SizedBox(height: context.appTheme.spacing.marginMedium),
                                Row(
                                  children: [
                                    IntrinsicWidth(
                                      stepWidth: 150,
                                      child: ReactiveTextField(
                                        formControlName: 'department2',
                                      ),
                                    ),
                                    SizedBox(width: context.appTheme.spacing.marginMedium),
                                    IntrinsicWidth(
                                      stepWidth: 200,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'shift2',
                                            ),
                                          ),
                                          const Text(' ~ '),
                                          Expanded(
                                            child: ReactiveTextField(
                                              formControlName: 'shift2End',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: context.appTheme.spacing.marginMedium),
                                    for (var day in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']) ...[
                                       IntrinsicWidth(
                                        stepWidth: 80,
                                        child: ReactiveDropdownFormField(
                                          formControlName: 'shift2$day',
                                          items: [
                                            DropdownMenuItem(value: '×', child: Text('×')),
                                            DropdownMenuItem(value: '○', child: Text('○')),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: context.appTheme.spacing.marginMedium),
                                    ]
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          const Text(
                            '希望日',
                             style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                           SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          ValueListenableListener(
                            valueListenable: context
                                .read<WebAppointmentDetailModel>()
                                .bookingByPatient,
                            onListen: () {
                              var data = context
                                  .read<WebAppointmentDetailModel>()
                                  .bookingByPatient
                                  .value;

                              if (!data.hasData && !data.loading) {
                                snackBarWidget(
                                    message: '予約が見つかりませんでした。',
                                    backgroundColor: Colors.red);
                              }
                            },
                            child: ValueListenableBuilder(
                                valueListenable: context
                                    .read<WebAppointmentDetailModel>()
                                    .bookingByPatient,
                                builder: (context, value, _) {
                                  return Skeletonizer(
                                    enabled: value.loading,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Expanded(
                                              child:
                                                  ReactiveDatePickerField(
                                                formControlName:
                                                    'preferredDate1',
                                                label: '第１希望',
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            const Expanded(
                                              child:
                                                  ReactiveDatePickerField(
                                                formControlName:
                                                    'preferredDate2',
                                                label: '第２希望',
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            const Expanded(
                                              child:
                                                  ReactiveDatePickerField(
                                                formControlName:
                                                    'preferredDate3',
                                                label: '第３希望',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ReactiveCheckboxListTile(
                                                contentPadding: EdgeInsets.zero,
                                                dense: true,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                formControlName:
                                                    'noDesiredDate',
                                                title: const Text('希望日なし'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ReactiveTextField(
                                                minLines: 3,
                                                maxLines: 5,
                                                formControlName: 'remarks',
                                                decoration:
                                                    const InputDecoration(
                                                  label: Text('備考'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          const Divider(),
                          Text(
                            '予約日',
                            style: context.textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginMedium),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFECE5),
                              borderRadius: BorderRadius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('候補日'),
                                    TextButton.icon(
                                      onPressed: () {
                                        final count = context
                                            .read<WebAppointmentDetailModel>()
                                            .generateCandidateDates();
                                        if (count == 0) {
                                          snackBarWidget(
                                            message: '候補日を生成できませんでした。\n医療機関のシフトと希望日を確認してください。',
                                            backgroundColor: Colors.orange,
                                          );
                                        }
                                      },
                                      icon: const Icon(Icons.refresh,
                                          color: Color(0xffF08C67)),
                                      label: const Text(
                                        '候補日を自動作成',
                                        style: TextStyle(
                                          color: Color(0xffF08C67),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ReactiveFormArray(
                                  formArrayName: 'candidateDate',
                                  builder: (context, formArray, child) {
                                    final rows = formArray.controls
                                        .map((control) => control as FormGroup)
                                        .map(
                                          (currentForm) => ReactiveForm(
                                            formGroup: currentForm,
                                            child: candidateBooking(context, formArray,
                                                currentForm),
                                          ),
                                        );

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ColumnSeparated(
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  SizedBox(
                                            height: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          children: rows.toList(),
                                        ),
                                        SizedBox(
                                          height: context
                                              .appTheme.spacing.marginMedium,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            formArray.add(
                                              FormGroup({
                                                '_id': FormControl<String>(),
                                                'preferredDate':
                                                    FormControl<DateTime>(
                                                  validators: [
                                                    Validators.required,
                                                    Validators.pattern(
                                                      ValidatorRegExp.date,
                                                    ),
                                                  ],
                                                ), // 第一希望
                                                'choice': FormControl<String>(
                                                    value: '午前'), // 午前, 午後, 終日
                                                'timePeriodFrom':
                                                    FormControl<String>(
                                                  validators: [
                                                    Validators.required,
                                                    Validators.pattern(
                                                      ValidatorRegExp.time,
                                                    )
                                                  ],
                                                ), // 時間帯（自）
                                                'timePeriodTo':
                                                    FormControl<String>(
                                                  validators: [
                                                    Validators.required,
                                                    Validators.pattern(
                                                      ValidatorRegExp.time,
                                                    )
                                                  ],
                                                ), // 時間帯（至）
                                              })
                                                ..markAllAsTouched(),
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.add_circle,
                                                color: Color(0xffF08C67),
                                              ),
                                              SizedBox(
                                                width: context.appTheme.spacing
                                                    .marginSmall,
                                              ),
                                              const Text(
                                                '候補日を追加',
                                                style: TextStyle(
                                                    color: Color(0xffF08C67)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                ValueListenableBuilder(
                                    valueListenable: context
                                        .read<WebAppointmentDetailModel>()
                                        .webBooking,
                                    builder: (context, value, _) {
                                      if (value.data?.messageFrom == null ||
                                          value.data!.messageFrom!.isEmpty) {
                                        return const SizedBox();
                                      }
                                      return ColumnSeparated(
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            height: context
                                                .appTheme.spacing.marginMedium,
                                          );
                                        },
                                        children: value.data?.messageFrom
                                                ?.map((e) => Row(
                                                      children: [
                                                        Expanded(
                                                          child: TextField(
                                                            minLines: 1,
                                                            maxLines: null,
                                                            enabled: false,
                                                            controller:
                                                                TextEditingController(
                                                                    text: e
                                                                        .message),
                                                            decoration:
                                                                InputDecoration(
                                                              label: Text(
                                                                e.from ==
                                                                        'Hospital'
                                                                    ? '病院よりメッセージ'
                                                                    : '医療渡航支援会社よりメッセージ',
                                                              ),
                                                              hintText:
                                                                  'メッセージ（希望日がない場合は、メッセージ欄にてその旨伝えてください）',
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ))
                                                .toList() ??
                                            [],
                                      );
                                    }),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        minLines: 3,
                                        maxLines: 5,
                                        formControlName: 'message',
                                        decoration: const InputDecoration(
                                          label: Text('メッセージ'),
                                          hintText:
                                              'メッセージ（希望日がない場合は、メッセージ欄にてその旨伝えてください）',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                Center(
                                  child: ReactiveFormConsumer(
                                      builder: (context, form, _) {
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffF08C67),
                                      ),
                                      onPressed: form.invalid
                                          ? null
                                          : () {
                                              context
                                                  .read<
                                                      WebAppointmentDetailModel>()
                                                  .submitData();
                                            },
                                      child: const Text('予約日を病院へ送信する'),
                                    );
                                  }),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Text(
                            'テストコール日',
                            style: context.textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginMedium),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const IntrinsicWidth(
                                  stepWidth: 250,
                                  child: ReactiveDatePickerField(
                                    formControlName: 'testCallDate',
                                    label: '年月日',
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                IntrinsicWidth(
                                  stepWidth: 100,
                                  child: ReactiveTextField(
                                    formControlName: 'testCallTime',
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      formatter.timeFormatter,
                                    ],
                                    decoration: const InputDecoration(
                                      label: Text('時間'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            const SizedBox(height: 32),
            ValueListenableBuilder(
              valueListenable: context.watch<WebAppointmentDetailModel>().webBookings,
              builder: (context, value, _) {
                 if (!value.hasData || value.requireData.isEmpty) {
                   return const SizedBox();
                 }
                 return DynamicTable(
                   enableScroll: false,
                   data: TableData(
                     columns: [
                       HeaderTableData(titleHeader: const Text('状況'), flex: 1),
                       HeaderTableData(titleHeader: const Text('医療機関'), flex: 2),
                       HeaderTableData(titleHeader: const Text('予約日'), flex: 2),
                       HeaderTableData(titleHeader: const Text('テストコール'), flex: 2),
                       HeaderTableData(titleHeader: const Text(''), flex: 1),
                     ],
                     rows: value.requireData.map((e) {
                         return RowTableData(
                            cell: [
                              Padding(padding: const EdgeInsets.all(4), child: Text(
                                e.reservationConfirmationDate != null ? '確定済' : (e.isClosed == true ? '完了' : '未確定')
                              )),
                             Padding(padding: const EdgeInsets.all(4), child: Text(e.hospital?.hospitalNameKatakana ?? e.hospital?.hospitalNameChinese ?? '-')),
                             Padding(padding: const EdgeInsets.all(4), child: Text(e.reservationConfirmationDate != null ? DateFormat('yyyy/MM/dd').format(e.reservationConfirmationDate!) : '-')),
                             Padding(padding: const EdgeInsets.all(4), child: Text('${e.testCallDate != null ? DateFormat('dd MMM yyyy').format(e.testCallDate!) : '-'} ${e.testCallTime ?? ''}')),
                             Padding(padding: const EdgeInsets.all(4), child: IconButton(
                                 icon: const Icon(Icons.delete, color: Colors.grey),
                                 onPressed: () async {
                                    final confirmed = await showDialog<bool>(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text('削除確認'),
                                          content: const Text('本当に削除しますか？'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, false),
                                              child: const Text('キャンセル'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, true),
                                              child: const Text('削除', style: TextStyle(color: Colors.red)),
                                            ),
                                          ],
                                        ),
                                      );
                                    if (confirmed == true) {
                                      if (!context.mounted) return;
                                      await context.read<WebAppointmentDetailModel>().deleteReservation(e.id);
                                    }
                                 },
                               )
                             ),
                           ]
                        );
                     }).toList(),
                   ),
                 );
              }
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableListener(
                  valueListenable:
                      context.read<WebAppointmentDetailModel>().submit,
                  onListen: () {
                    final data = context
                        .read<WebAppointmentDetailModel>()
                        .submit
                        .value;

                    if (data.hasData) {
                      logger.d('loading');
                      snackBarWidget(
                        message: '正常に保存されました',
                        prefixIcon: const Icon(Icons.check_circle,
                            color: Colors.white),
                      );
                    }

                    if (data.hasError) {
                      snackBarWidget(
                        message: '保存できませんでした。 もう一度試してください。',
                        backgroundColor: Colors.red,
                        prefixIcon:
                            const Icon(Icons.error, color: Colors.white),
                      );
                    }
                  },
                  child: ValueListenableBuilder(
                      valueListenable:
                          context.watch<WebAppointmentDetailModel>().submit,
                      builder: (context, value, child) {
                        return ReactiveFormConsumer(
                          builder: (context, form, _) {
                            return ElevatedButton(
                                onPressed: !value.loading && form.valid
                                    ? () => context
                                        .read<WebAppointmentDetailModel>()
                                        .submitData()
                                    : null,
                                child: WithLoadingButton(
                                  isLoading: value.loading,
                                  child: const Text('保存する'),
                                ));
                          },
                        );
                      }),
                ),
                const SizedBox(width: 16),
                ValueListenableBuilder(
                    valueListenable: context.watch<WebAppointmentDetailModel>().webBooking,
                    builder: (context, webBookingValue, _) {
                         // Only show delete if editing an existing reservation
                         if (!webBookingValue.hasData || webBookingValue.data?.id == null) {
                           return const SizedBox();
                         }
                         return ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                            onPressed: () async {
                              final confirmed = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('削除確認'),
                                  content: const Text('本当に削除しますか？'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, false),
                                      child: const Text('キャンセル'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, true),
                                      child: const Text('削除', style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              );

                              if (confirmed == true) {
                                 if (!context.mounted) return;
                                 final success = await context.read<WebAppointmentDetailModel>().deleteReservation(webBookingValue.requireData.id);
                                 if (!context.mounted) return;
                                 if (success) {
                                     // Navigate back or clear form? Usually pop or show success.
                                      snackBarWidget(message: '削除しました', prefixIcon: const Icon(Icons.check_circle, color: Colors.white));
                                      // Typically go back to list or clear form
                                      Navigator.of(context).pop(true); 
                                 }
                              }
                            },
                            child: const Text('削除する', style: TextStyle(color: Colors.white)),
                         );
                    }
                ),
              ],
            ),
            const SizedBox(height: 50),
              ],
            ),
          );
        },
    );
  }

  Row candidateBooking(BuildContext context, FormArray formArray,
      FormGroup currentForm) {
    return Row(
      key: ValueKey(currentForm),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ReactiveDatePickerField(
            formControlName: 'preferredDate',
            label: '第 ${formArray.controls.indexOf(currentForm) + 1} 希望',
          ),
        ),
        SizedBox(
          width: context.appTheme.spacing.marginMedium,
        ),
        ReactiveValueListenableBuilder(
            formControlName: 'choice',
            builder: (context, control, _) {
              return Row(
                children: [
                  boxText(
                    context,
                    '午前',
                    textColor:
                        control.value == '午前' ? Colors.white : Colors.black,
                    bg: control.value == '午前'
                        ? const Color(0xffF08C67)
                        : Colors.white,
                    borderC: const Color(0xffF08C67),
                    onTap: () {
                      control.value = '午前';
                    },
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  boxText(
                    context,
                    '午後',
                    textColor:
                        control.value == '午後' ? Colors.white : Colors.black,
                    bg: control.value == '午後'
                        ? const Color(0xffF08C67)
                        : Colors.white,
                    borderC: const Color(0xffF08C67),
                    onTap: () {
                      control.value = '午後';
                    },
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  ),
                  boxText(
                    context,
                    '終日',
                    textColor:
                        control.value == '終日' ? Colors.white : Colors.black,
                    bg: control.value == '終日'
                        ? const Color(0xffF08C67)
                        : Colors.white,
                    borderC: const Color(0xffF08C67),
                    onTap: () {
                      control.value = '終日';
                    },
                  ),
                ],
              );
            }),
        SizedBox(
          width: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: ReactiveValueListenableBuilder(
              formControlName: 'choice',
              builder: (context, choiceControl, _) {
                // choiceの値に基づいてシフト時間を判定
                String? shiftTime;
                final hospitalData = context.read<WebAppointmentDetailModel>().hospital.value.data;
                if (hospitalData != null) {
                   if (choiceControl.value == '午前') {
                     shiftTime = hospitalData.shift1;
                   } else if (choiceControl.value == '午後') {
                     shiftTime = hospitalData.shift2;
                   }
                }
                
                final timeOptions = _generateTimeOptions(shiftTime);

                return ReactiveDropdownField<String>(
                    formControlName: 'timePeriodFrom',
                    decoration: const InputDecoration(
                      label: Text('時間帯（自）'),
                    ),
                    items: timeOptions.map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    )).toList(),
                );
              }),
        ),
        SizedBox(
            width: context.appTheme.spacing.marginMedium,
        ),
        const Text('〜'),
        SizedBox(
             width: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: ReactiveValueListenableBuilder(
              formControlName: 'choice',
              builder: (context, choiceControl, _) {
                 String? shiftTime;
                final hospitalData = context.read<WebAppointmentDetailModel>().hospital.value.data;
                if (hospitalData != null) {
                   if (choiceControl.value == '午前') {
                     shiftTime = hospitalData.shift1;
                   } else if (choiceControl.value == '午後') {
                     shiftTime = hospitalData.shift2;
                   }
                }
                final timeOptions = _generateTimeOptions(shiftTime);

                return ReactiveDropdownField<String>(
                    formControlName: 'timePeriodTo',
                    decoration: const InputDecoration(
                      label: Text('時間帯（至）'),
                    ),
                    items: timeOptions.map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    )).toList(),
                );
              }),
        ),
        Expanded(
          child: Row(
            children: [
              if (formArray.controls.indexOf(currentForm) != 0) ...{
                IconButton(
                  icon: const Icon(Icons.delete_forever, color: Colors.red),
                  onPressed: () => formArray.removeAt(
                    formArray.controls.indexOf(currentForm),
                  ),
                ),
              }
            ],
          ),
        ),
      ],
    );
  }

  List<String> _generateTimeOptions(String? shiftTime) {
    if (shiftTime == null || shiftTime.isEmpty) {
      // デフォルト全時間
       return List.generate(48, (index) {
        final hour = index ~/ 2;
        final minute = (index % 2) * 30;
        return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
      });
    }

    // shiftTime "09:00〜12:00" -> パース
    // "09:00" -> 9 * 2 = 18
    // "12:00" -> 12 * 2 = 24
    
    // 区切り文字対応
    final split = shiftTime.split(RegExp(r'[〜\-]'));
    if (split.length < 2) return []; // format error fallback

    int timeToHalfHour(String timeStr) {
      final parts = timeStr.trim().split(':');
      if (parts.length < 2) return 0;
      final h = int.tryParse(parts[0]) ?? 0;
      final m = int.tryParse(parts[1]) ?? 0;
      return h * 2 + (m >= 30 ? 1 : 0);
    }
    
    final startIdx = timeToHalfHour(split[0]);
    final endIdx = timeToHalfHour(split[1]);
    
    if (startIdx >= endIdx) return [];

    return List.generate(endIdx - startIdx + 1, (index) {
      final totalHalfHours = startIdx + index;
       final hour = totalHalfHours ~/ 2;
        final minute = (totalHalfHours % 2) * 30;
        return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
    });
  }
}

boxText(BuildContext context, String text,
        {Color? bg, Color? borderC, Color? textColor, Function()? onTap}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
        decoration: BoxDecoration(
          color: bg,
          border: Border.all(
            color: borderC ?? bg ?? Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
              context.appTheme.spacing.borderRadiusMedium),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor ?? Colors.black),
          ),
        ),
      ),
    );
