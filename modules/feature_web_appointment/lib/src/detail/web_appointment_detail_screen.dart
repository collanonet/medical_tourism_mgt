// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                            children: [
                              ValueListenableListener(
                                valueListenable: context
                                    .read<WebAppointmentDetailModel>()
                                    .patient,
                                onListen: () {
                                  var data = context
                                      .read<WebAppointmentDetailModel>()
                                      .patient
                                      .value;

                                  if (data.hasError) {
                                    snackBarWidget(
                                        message: '患者が見つからない。',
                                        backgroundColor: Colors.red);
                                  }
                                },
                                child: ValueListenableBuilder(
                                    valueListenable: context
                                        .watch<WebAppointmentDetailModel>()
                                        .patient,
                                    builder: (context, value, _) {
                                      return Expanded(
                                        child: ReactiveTextField<String>(
                                          formControlName: 'patientName',
                                          onSubmitted: (value) {
                                            logger.d(value);
                                            if (value.value != null &&
                                                value.value!.isNotEmpty) {
                                              context
                                                  .read<
                                                      WebAppointmentDetailModel>()
                                                  .searchPatient(
                                                      search: value.value);
                                            }
                                          },
                                          decoration: InputDecoration(
                                            label: const Text('患者名'),
                                            suffixIcon: value.loading
                                                ? const SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child:
                                                        CircularProgressIndicator())
                                                : ReactiveValueListenableBuilder<
                                                        String>(
                                                    formControlName:
                                                        'patientName',
                                                    builder:
                                                        (context, control, _) {
                                                      return IconButton(
                                                        onPressed: () {
                                                          if (control.value !=
                                                                  null &&
                                                              control.value!
                                                                  .isNotEmpty) {
                                                            context
                                                                .read<
                                                                    WebAppointmentDetailModel>()
                                                                .searchPatient(
                                                                    search: control
                                                                        .value);
                                                          }
                                                        },
                                                        icon: const Icon(
                                                          Icons.search,
                                                          color: Colors.grey,
                                                        ),
                                                      );
                                                    }),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                            ],
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
                                            Expanded(
                                              child:
                                                  ReactiveDatePicker<DateTime>(
                                                formControlName:
                                                    'preferredDate1',
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100),
                                                builder: (BuildContext context,
                                                    ReactiveDatePickerDelegate<
                                                            dynamic>
                                                        picker,
                                                    Widget? child) {
                                                  return ReactiveTextField<
                                                      DateTime>(
                                                    formControlName:
                                                        'preferredDate1',
                                                    valueAccessor:
                                                        DateTimeValueAccessor(
                                                      dateTimeFormat:
                                                          DateFormat(
                                                              'yyyy/MM/dd'),
                                                    ),
                                                    decoration: InputDecoration(
                                                      label: const Text(
                                                        '第１希望',
                                                      ),
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                          CupertinoIcons
                                                              .calendar,
                                                          color: Colors.grey,
                                                        ),
                                                        onPressed:
                                                            picker.showPicker,
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
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            Expanded(
                                              child:
                                                  ReactiveDatePicker<DateTime>(
                                                formControlName:
                                                    'preferredDate2',
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100),
                                                builder: (BuildContext context,
                                                    ReactiveDatePickerDelegate<
                                                            dynamic>
                                                        picker,
                                                    Widget? child) {
                                                  return ReactiveTextField<
                                                      DateTime>(
                                                    formControlName:
                                                        'preferredDate2',
                                                    valueAccessor:
                                                        DateTimeValueAccessor(
                                                      dateTimeFormat:
                                                          DateFormat(
                                                              'yyyy/MM/dd'),
                                                    ),
                                                    decoration: InputDecoration(
                                                      label: const Text(
                                                        '第２希望',
                                                      ),
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                          CupertinoIcons
                                                              .calendar,
                                                          color: Colors.grey,
                                                        ),
                                                        onPressed:
                                                            picker.showPicker,
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
                                              width: context.appTheme.spacing
                                                  .marginMedium,
                                            ),
                                            Expanded(
                                              child:
                                                  ReactiveDatePicker<DateTime>(
                                                formControlName:
                                                    'preferredDate3',
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100),
                                                builder: (BuildContext context,
                                                    ReactiveDatePickerDelegate<
                                                            dynamic>
                                                        picker,
                                                    Widget? child) {
                                                  return ReactiveTextField<
                                                      DateTime>(
                                                    formControlName:
                                                        'preferredDate3',
                                                    valueAccessor:
                                                        DateTimeValueAccessor(
                                                      dateTimeFormat:
                                                          DateFormat(
                                                              'yyyy/MM/dd'),
                                                    ),
                                                    decoration: InputDecoration(
                                                      label: const Text(
                                                        '第３希望',
                                                      ),
                                                      suffixIcon: IconButton(
                                                        icon: const Icon(
                                                          CupertinoIcons
                                                              .calendar,
                                                          color: Colors.grey,
                                                        ),
                                                        onPressed:
                                                            picker.showPicker,
                                                      ),
                                                    ),
                                                    inputFormatters: [
                                                      formatter.dateFormatter,
                                                    ],
                                                  );
                                                },
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
                                      .hospital,
                                  onListen: () {
                                    var data = context
                                        .read<WebAppointmentDetailModel>()
                                        .hospital
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
                                          .hospital,
                                      builder: (context, value, _) {
                                        return ReactiveTextField<String>(
                                          formControlName:
                                              'medicalInstitutionName',
                                          onSubmitted: (value) {
                                            logger.d(value);
                                            if (value.isNotNullOrEmpty) {
                                              context
                                                  .read<
                                                      WebAppointmentDetailModel>()
                                                  .searchHospital(
                                                      search: value.value);
                                            }
                                          },
                                          decoration: InputDecoration(
                                            label: const Text('医療機関名'),
                                            suffixIcon: value.loading
                                                ? const SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child:
                                                        CircularProgressIndicator())
                                                : ReactiveValueListenableBuilder<
                                                        String>(
                                                    formControlName:
                                                        'medicalInstitutionName',
                                                    builder:
                                                        (context, control, _) {
                                                      return IconButton(
                                                        onPressed: () {
                                                          if (control.value !=
                                                                  null &&
                                                              control.value!
                                                                  .isNotEmpty) {
                                                            context
                                                                .read<
                                                                    WebAppointmentDetailModel>()
                                                                .searchHospital(
                                                                    search: control
                                                                        .value);
                                                          }
                                                        },
                                                        icon: const Icon(
                                                          Icons.search,
                                                          color: Colors.grey,
                                                        ),
                                                      );
                                                    }),
                                          ),
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
                                          message: 'この病院には医者がいない。',
                                          backgroundColor: Colors.red);
                                    }

                                    if (data.hasError) {
                                      snackBarWidget(
                                          message: 'この病院には医者がいない。',
                                          backgroundColor: Colors.red);
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
                                                    ?.map(
                                                        (e) => DropdownMenuItem(
                                                              value: e,
                                                              child: Text(
                                                                  e.nameKanji ??
                                                                      'NoName'),
                                                              onTap: () {
                                                                context
                                                                    .read<
                                                                        WebAppointmentDetailModel>()
                                                                    .selectDoctor(
                                                                        e);
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
                                      stepWidth: 150,
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
                                      stepWidth: 150,
                                      child: ReactiveTextField(
                                        formControlName: 'shift1',
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
                                      stepWidth: 150,
                                      child: ReactiveTextField(
                                        formControlName: 'shift2',
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
                                            child: candidateBooking(formArray,
                                                currentForm, context),
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
                                                'id': FormControl<String>(),
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
                                IntrinsicWidth(
                                  stepWidth: 250,
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName: 'testCallDate',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName: 'testCallDate',
                                        valueAccessor: DateTimeValueAccessor(
                                          dateTimeFormat:
                                              DateFormat('yyyy/MM/dd'),
                                        ),
                                        onChanged: (value) {
                                          logger.d(value);
                                        },
                                        onSubmitted: (value) {
                                          logger.d(value);
                                        },
                                        decoration: InputDecoration(
                                          label: const Text('年月日'),
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
                const SizedBox(height: 16),
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
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  Row candidateBooking(FormArray<Object?> formArray, FormGroup currentForm,
      BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ReactiveDatePicker<DateTime>(
            formControlName: 'preferredDate',
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            builder: (BuildContext context,
                ReactiveDatePickerDelegate<dynamic> picker, Widget? child) {
              return ReactiveTextField<DateTime>(
                formControlName: 'preferredDate',
                valueAccessor: DateTimeValueAccessor(
                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                ),
                onChanged: (value) {
                  logger.d(value);
                },
                onSubmitted: (value) {
                  logger.d(value);
                },
                decoration: InputDecoration(
                  label: Text(
                      '第 ${formArray.controls.indexOf(currentForm) + 1} 希望'),
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
          child: ReactiveValueListenableBuilder<String>(
              formControlName: 'timePeriodFrom',
              builder: (context, control, _) {
                return ReactiveTextField<String>(
                  formControlName: 'timePeriodFrom',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    formatter.timeFormatter,
                  ],
                  onChanged: (value) {
                    if (value.value != null) {
                      var time = processTimeInput(value.value!);
                      control.value = time;
                    }
                  },
                  decoration: const InputDecoration(
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
        const Text('〜'),
        SizedBox(
          width: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: ReactiveValueListenableBuilder<String>(
              formControlName: 'timePeriodTo',
              builder: (context, control, _) {
                return ReactiveTextField<String>(
                  formControlName: 'timePeriodTo',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    formatter.timeFormatter,
                  ],
                  onChanged: (value) {
                    if (value.value != null) {
                      var time = processTimeInput(value.value!);
                      control.value = time;
                    }
                  },
                  decoration: const InputDecoration(
                    label: Text(
                      '時間帯（至）',
                    ),
                  ),
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
