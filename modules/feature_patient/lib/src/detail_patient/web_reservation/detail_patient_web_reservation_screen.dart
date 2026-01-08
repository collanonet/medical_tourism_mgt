// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:feature_web_appointment/feature_web_appointment.gm.dart';
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

// Project imports:
import 'detail_patient_web_reservation_model.dart';

class DetailPatientWebReservationScreen extends StatefulWidget {
  const DetailPatientWebReservationScreen({super.key});

  @override
  State<DetailPatientWebReservationScreen> createState() =>
      _DetailPatientWebReservationScreenState();
}

class _DetailPatientWebReservationScreenState
    extends State<DetailPatientWebReservationScreen> {
  final formatter = InputFormatter();

  List<String> get timeOptions {
    List<String> options = [];
    for (int i = 0; i < 24; i++) {
      String hour = i.toString().padLeft(2, '0');
      options.add('$hour:00');
      options.add('$hour:30');
    }
    return options;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            context.watch<DetailPatientWebReservationModel>().webBooking,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

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
                                    .read<DetailPatientWebReservationModel>()
                                    .hospitals,
                                onListen: () {
                                  var data = context
                                      .read<DetailPatientWebReservationModel>()
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
                                        .watch<
                                            DetailPatientWebReservationModel>()
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
                                    .read<DetailPatientWebReservationModel>()
                                    .doctors,
                                onListen: () {
                                  var data = context
                                      .read<DetailPatientWebReservationModel>()
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
                                        .watch<
                                            DetailPatientWebReservationModel>()
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
                                                              .read<
                                                                  DetailPatientWebReservationModel>()
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
                                    width:
                                        context.appTheme.spacing.marginMedium,
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
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 80,
                                    child: boxText(
                                      context,
                                      '月',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 80,
                                    child: boxText(
                                      context,
                                      '火',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 80,
                                    child: boxText(
                                      context,
                                      '水',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 80,
                                    child: boxText(
                                      context,
                                      '木',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 80,
                                    child: boxText(
                                      context,
                                      '金',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 80,
                                    child: boxText(
                                      context,
                                      '土',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  IntrinsicWidth(
                                    stepWidth: 80,
                                    child: boxText(
                                      context,
                                      '日',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                  ),
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
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
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
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift1Mon',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift1Tue',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift1Wed',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift1Thu',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift1Fri',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift1Sat',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift1Sun',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
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
                                  IntrinsicWidth(
                                    stepWidth: 150,
                                    child: ReactiveTextField(
                                      formControlName: 'department2',
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
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
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift2Mon',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift2Tue',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift2Wed',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift2Thu',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift2Fri',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift2Sat',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  const IntrinsicWidth(
                                    stepWidth: 80,
                                    child: ReactiveDropdownFormField(
                                      formControlName: 'shift2Sun',
                                      items: [
                                        DropdownMenuItem(
                                          value: '×',
                                          child: Text('×'),
                                        ),
                                        DropdownMenuItem(
                                          value: '○',
                                          child: Text('○'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        const Text(
                          '患者',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(
                        //   height: context.appTheme.spacing.marginMedium,
                        // ),
                        // Row(
                        //   children: [
                        //     ValueListenableListener(
                        //       valueListenable: context
                        //           .read<DetailPatientWebReservationModel>()
                        //           .patient,
                        //       onListen: () {
                        //         var data = context
                        //             .read<DetailPatientWebReservationModel>()
                        //             .patient
                        //             .value;
                        //
                        //         if (data.hasError) {
                        //           snackBarWidget(
                        //               message: '患者が見つからない。',
                        //               backgroundColor: Colors.red);
                        //         }
                        //       },
                        //       child: ValueListenableBuilder(
                        //           valueListenable: context
                        //               .watch<
                        //                   DetailPatientWebReservationModel>()
                        //               .patient,
                        //           builder: (context, value, _) {
                        //             return Expanded(
                        //               child: ReactiveTextField<String>(
                        //                 formControlName: 'patientName',
                        //                 onSubmitted: (value) {
                        //                   logger.d(value);
                        //                   if (value.value != null &&
                        //                       value.value!.isNotEmpty) {
                        //                     context
                        //                         .read<
                        //                             DetailPatientWebReservationModel>()
                        //                         .searchPatient(
                        //                             search: value.value);
                        //                   }
                        //                 },
                        //                 decoration: InputDecoration(
                        //                   label: Text('患者名'),
                        //                   suffixIcon: value.loading
                        //                       ? SizedBox(
                        //                           height: 30,
                        //                           width: 30,
                        //                           child:
                        //                               const CircularProgressIndicator())
                        //                       : Icon(
                        //                           Icons.search,
                        //                           color: Colors.grey,
                        //                         ),
                        //                 ),
                        //               ),
                        //             );
                        //           }),
                        //     ),
                        //     SizedBox(
                        //       width: context.appTheme.spacing.marginMedium,
                        //     ),
                        //     Expanded(
                        //       child: SizedBox(),
                        //     ),
                        //     SizedBox(
                        //       width: context.appTheme.spacing.marginMedium,
                        //     ),
                        //     Expanded(
                        //       child: SizedBox(),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        ValueListenableListener(
                          valueListenable: context
                              .read<DetailPatientWebReservationModel>()
                              .bookingByPatient,
                          onListen: () {
                            var data = context
                                .read<DetailPatientWebReservationModel>()
                                .bookingByPatient
                                .value;

                            // エラーがある場合のみエラーメッセージを表示
                            // データがない場合は正常（患者に既存の予約情報がない場合）
                            if (data.hasError) {
                              snackBarWidget(
                                  message: '予約情報の取得に失敗しました。',
                                  backgroundColor: Colors.red);
                            }
                          },
                          child: ValueListenableBuilder(
                              valueListenable: context
                                  .read<DetailPatientWebReservationModel>()
                                  .bookingByPatient,
                              builder: (context, value, _) {
                                return Skeletonizer(
                                  enabled: value.loading,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Expanded(
                                            child: ReactiveDatePickerField(
                                              formControlName: 'preferredDate1',
                                              label: '第１希望',
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          const Expanded(
                                            child: ReactiveDatePickerField(
                                              formControlName: 'preferredDate2',
                                              label: '第２希望',
                                            ),
                                          ),
                                          SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          const Expanded(
                                            child: ReactiveDatePickerField(
                                              formControlName: 'preferredDate3',
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
                                              formControlName: 'noDesiredDate',
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
                                              decoration: const InputDecoration(
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
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffF08C67),
                            ),
                            onPressed: () {
                              final count = context
                                  .read<DetailPatientWebReservationModel>()
                                  .generateCandidateDates();

                              if (count == 0) {
                                snackBarWidget(
                                  message: '指定された希望日では、医療機関の診療予定がありません。',
                                  backgroundColor: Colors.orange,
                                );
                              }
                            },
                            child: const Text('候補日を自動作成'),
                          ),
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
                              const Text('候補日'),
                              ReactiveFormArray(
                                formArrayName: 'candidateDate',
                                builder: (context, formArray, child) {
                                  final rows = formArray.controls
                                      .map((control) => control as FormGroup)
                                      .map(
                                        (currentForm) => ReactiveForm(
                                          formGroup: currentForm,
                                          child: candidateBooking(
                                              context, formArray, currentForm),
                                        ),
                                      );

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ColumnSeparated(
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
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
                                                ],
                                              ), // 時間帯（自）
                                              'timePeriodTo':
                                                  FormControl<String>(
                                                validators: [
                                                  Validators.required,
                                                  // validate time format
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
                                              width: context
                                                  .appTheme.spacing.marginSmall,
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
                                      .read<DetailPatientWebReservationModel>()
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
                                      backgroundColor: const Color(0xffF08C67),
                                    ),
                                    onPressed: form.invalid
                                        ? null
                                        : () {
                                            context
                                                .read<
                                                    DetailPatientWebReservationModel>()
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
                                child: ReactiveValueListenableBuilder<String>(
                                    formControlName: 'testCallTime',
                                    builder: (context, control, _) {
                                      return ReactiveDropdownField<String>(
                                        formControlName: 'testCallTime',
                                        items: timeOptions
                                            .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e),
                                                ))
                                            .toList(),
                                        decoration: const InputDecoration(
                                          label: Text('時間'),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        // Debug Validation
                        ReactiveFormConsumer(
                          builder: (context, form, child) {
                             if (form.invalid) {
                               logger.d('Form Errors: ${form.errors}');
                               form.controls.forEach((key, value) {
                                 if (value.invalid) {
                                   logger.d('Invalid Control: $key, Errors: ${value.errors}');
                                 }
                               });
                               
                               // Check FormArray
                               final candidateDate = form.control('candidateDate') as FormArray;
                               for (var i = 0; i < candidateDate.controls.length; i++) {
                                  var group = candidateDate.controls[i] as FormGroup;
                                  if (group.invalid) {
                                     logger.d('Invalid Candidate Row $i: ${group.errors}');
                                     group.controls.forEach((k, v) {
                                        if (v.invalid) logger.d('Row $i Invalid Control: $k, Errors: ${v.errors}');
                                     });
                                  }
                               }
                             }
                             return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ValueListenableListener(
                        valueListenable: context
                            .read<DetailPatientWebReservationModel>()
                            .submit,
                        onListen: () {
                          final data = context
                              .read<DetailPatientWebReservationModel>()
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
                            valueListenable: context
                                .watch<DetailPatientWebReservationModel>()
                                .submit,
                            builder: (context, value, child) {
                              return ReactiveFormConsumer(
                                builder: (context, form, _) {
                                  return ElevatedButton(
                                      onPressed: !value.loading && form.valid
                                          ? () => context
                                              .read<
                                                  DetailPatientWebReservationModel>()
                                              .submitData()
                                          : null,
                                      child: WithLoadingButton(
                                        isLoading: value.loading,
                                        child: const Text('保存する'),
                                      ));
                                },
                              );
                            }),
                      )
                    ],
                  ),
                  ValueListenableBuilder(
                      valueListenable: context
                          .watch<DetailPatientWebReservationModel>()
                          .webBookings,
                      builder: (context, value, _) {
                        return Skeletonizer(
                          enabled: value.loading,
                          child: SizedBox(
                            height: 400,
                            width: double.infinity,
                            child: DynamicTable(
                              rowsPerPage: value.data?.length ?? 0,
                              data: TableData(
                                columns: [
                                  HeaderTableData(
                                    titleHeader: const Text('状況'),
                                  ),
                                  HeaderTableData(
                                    flex: 2,
                                    titleHeader: const Text('医療機関'),
                                  ),
                                  HeaderTableData(
                                    flex: 2,
                                    titleHeader: const Text('予約日'),
                                  ),
                                  HeaderTableData(
                                    flex: 2,
                                    titleHeader: const Text('テストコール'),
                                  ),
                                ],
                                rows: List<RowTableData>.generate(
                                  value.data?.length ?? 0,
                                  (index) {
                                    final data = value.data![index];
                                    return RowTableData(
                                      onTap: () {
                                        context.router.push(
                                          WebAppointmentDetailRoute(
                                            id: data.id,
                                          ),
                                        );
                                      },
                                      cell: [
                                        Text(
                                          '${index + 1}',
                                          style: context
                                              .textTheme.titleSmall
                                              ?.copyWith(
                                                  color: context.appTheme
                                                      .primaryColor),
                                        ),
                                        Text(
                                          data.hospital?.hospitalNameChinese ?? ' - ',
                                          style: context.textTheme.titleSmall
                                              ?.copyWith(
                                                  color: context
                                                      .appTheme.primaryColor),
                                        ),
                                        Text(
                                          data.proposedDates
                                                  ?.map((e) =>
                                                      Dates.formShortDate(
                                                          e.proposedDate))
                                                  .join(' - ') ??
                                              '',
                                        ),
                                        Text(
                                          Dates.formatFullDateTime(
                                              data.createdAt),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          );
        });
  }

  List<String> _generateTimeOptions(String? shiftTime) {
    if (shiftTime == null || shiftTime.isEmpty) {
      // デフォルト: 09:00 - 18:00 (あるいは全時間)
      return timeOptions;
    }

    try {
      final split = shiftTime.split(RegExp(r'[〜\-]'));
      if (split.length < 2) return timeOptions;

      final startStr = split[0].trim();
      final endStr = split[1].trim();

      final startParts = startStr.split(':');
      final endParts = endStr.split(':');
      
      if (startParts.length < 2 || endParts.length < 2) return timeOptions;

      int startHour = int.parse(startParts[0]);
      int startMinute = int.parse(startParts[1]);
      
      int endHour = int.parse(endParts[0]);
      int endMinute = int.parse(endParts[1]);

      List<String> options = [];
      
      // Calculate start time in minutes
      int currentMinutes = startHour * 60 + startMinute;
      int endMinutes = endHour * 60 + endMinute;

      while (currentMinutes <= endMinutes) {
         int h = currentMinutes ~/ 60;
         int m = currentMinutes % 60;
         String timeStr = '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
         options.add(timeStr);
         currentMinutes += 30;
      }
      return options;

    } catch (e) {
      return timeOptions;
    }
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
        Expanded(
          child: ReactiveValueListenableBuilder<String>(
              formControlName: 'choice',
              builder: (context, control, _) {
                final choice = control.value;
                return SegmentedButton<String>(
                  segments: const [
                    ButtonSegment(
                      value: '午前',
                      label: Text('午前'),
                    ),
                    ButtonSegment(
                      value: '午後',
                      label: Text('午後'),
                    ),
                    ButtonSegment(
                      value: '終日',
                      label: Text('終日'),
                    ),
                  ],
                  selected: {choice ?? '午前'},
                  onSelectionChanged: (Set<String> newSelection) {
                    control.value = newSelection.first;
                  },
                  style: ButtonStyle(
                    visualDensity: VisualDensity.compact,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                );
              }),
        ),
        SizedBox(
          width: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: ReactiveValueListenableBuilder<String>(
              formControlName: 'choice', // choiceの変更で時刻リストを変えるため監視
              builder: (context, choiceControl, _) {
                
                final choice = choiceControl.value;
                final hospital = context.read<DetailPatientWebReservationModel>().hospital.value.data;
                String shiftTime = '';
                if (choice == '午前') {
                  final start = hospital?.shift1 ?? '';
                  final end = hospital?.shift1End ?? '';
                  shiftTime = start.isNotEmpty && end.isNotEmpty ? '$start〜$end' : '';
                } else if (choice == '午後') {
                  final start = hospital?.shift2 ?? '';
                  final end = hospital?.shift2End ?? '';
                  shiftTime = start.isNotEmpty && end.isNotEmpty ? '$start〜$end' : '';
                } else {
                   shiftTime = ''; 
                }
                
                final dynamicOptions = _generateTimeOptions(shiftTime);

                return ReactiveDropdownField<String>(
                  formControlName: 'timePeriodFrom',
                  items: dynamicOptions
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  decoration: const InputDecoration(
                    hintText: '00:00',
                    label: Text(
                      '時間帯（自）',
                    ),
                  ),
                );
              }),
        ),
        SizedBox(
          width: context.appTheme.spacing.marginMedium,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text('〜'),
        ),
        SizedBox(
          width: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: ReactiveValueListenableBuilder<String>(
              formControlName: 'choice',
              builder: (context, choiceControl, _) {
                 final choice = choiceControl.value;
                final hospital = context.read<DetailPatientWebReservationModel>().hospital.value.data;
                String shiftTime = '';
                if (choice == '午前') {
                  final start = hospital?.shift1 ?? '';
                  final end = hospital?.shift1End ?? '';
                  shiftTime = start.isNotEmpty && end.isNotEmpty ? '$start〜$end' : '';
                } else if (choice == '午後') {
                  final start = hospital?.shift2 ?? '';
                  final end = hospital?.shift2End ?? '';
                  shiftTime = start.isNotEmpty && end.isNotEmpty ? '$start〜$end' : '';
                }
                
                final dynamicOptions = _generateTimeOptions(shiftTime);

                return ReactiveDropdownField<String>(
                  formControlName: 'timePeriodTo',
                  items: dynamicOptions
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  decoration: const InputDecoration(
                    label: Text(
                      '時間帯（至）',
                    ),
                    hintText: '00:00',
                  ),
                );
              }),
        ),
        IconButton(
          onPressed: () {
            formArray.remove(currentForm);
          },
          icon: const Icon(
            Icons.delete_forever,
            color: Colors.red,
          ),
        )
      ],
    );
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
