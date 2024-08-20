import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ValueListenableBuilder(
              valueListenable: context
                  .read<DetailPatientWebReservationModel>()
                  .medicalRecord,
              builder: (context, value, _) => Skeletonizer(
                    enabled: value.loading,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '希望日',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveDatePicker<DateTime>(
                                  formControlName: 'preferredDate1',
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextField<DateTime>(
                                      formControlName: 'preferredDate1',
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('yyyy/MM/dd'),
                                      ),
                                      decoration: InputDecoration(
                                        label: Text(
                                          '第１希望',
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
                                child: ReactiveDatePicker<DateTime>(
                                  formControlName: 'preferredDate2',
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextField<DateTime>(
                                      formControlName: 'preferredDate2',
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('yyyy/MM/dd'),
                                      ),
                                      decoration: InputDecoration(
                                        label: Text(
                                          '第２希望',
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
                                child: ReactiveDatePicker<DateTime>(
                                  formControlName: 'preferredDate3',
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                  builder: (BuildContext context,
                                      ReactiveDatePickerDelegate<dynamic>
                                          picker,
                                      Widget? child) {
                                    return ReactiveTextField<DateTime>(
                                      formControlName: 'preferredDate3',
                                      valueAccessor: DateTimeValueAccessor(
                                        dateTimeFormat:
                                            DateFormat('yyyy/MM/dd'),
                                      ),
                                      decoration: InputDecoration(
                                        label: Text(
                                          '第３希望',
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
                            ],
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ReactiveCheckboxListTile(
                                  contentPadding: EdgeInsets.zero,
                                  dense: true,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  formControlName: 'noDesiredDate',
                                  title: Text('希望日なし'),
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
                                  minLines: 3,
                                  maxLines: 5,
                                  formControlName: 'remarks',
                                  decoration: InputDecoration(
                                    label: Text('備考'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
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
                                child: ReactiveTextField(
                                  formControlName: 'medicalInstitutionName',
                                  decoration: InputDecoration(
                                    label: Text('医療機関名'),
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'doctorName',
                                  decoration: InputDecoration(
                                    label: Text('医師名'),
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                  ),
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
                                RowSeparated(
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    );
                                  },
                                  children: [
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    boxText(
                                      context,
                                      '月',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                    boxText(
                                      context,
                                      '火',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                    boxText(
                                      context,
                                      '水',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                    boxText(
                                      context,
                                      '木',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                    boxText(
                                      context,
                                      '金',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                    boxText(
                                      context,
                                      '土',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                    boxText(
                                      context,
                                      '日',
                                      textColor: Colors.white,
                                      bg: context.appTheme.primaryColor,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                RowSeparated(
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    );
                                  },
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'department1',
                                      ),
                                    ),
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'shift1',
                                      ),
                                    ),
                                    boxText(
                                      context,
                                      '×',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '○',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '×',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '×',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '○',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '○',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '×',
                                      bg: Colors.white,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.appTheme.spacing.marginMedium,
                                ),
                                RowSeparated(
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width:
                                          context.appTheme.spacing.marginMedium,
                                    );
                                  },
                                  children: [
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'department2',
                                      ),
                                    ),
                                    Expanded(
                                      child: ReactiveTextField(
                                        formControlName: 'shift2',
                                      ),
                                    ),
                                    boxText(
                                      context,
                                      '○',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '○',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '○',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '×',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '○',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '×',
                                      bg: Colors.white,
                                    ),
                                    boxText(
                                      context,
                                      '○',
                                      bg: Colors.white,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Text(
                            '予約日',
                            style: context.textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          ValueListenableListener(
                            valueListenable: context
                                .read<DetailPatientWebReservationModel>()
                                .createWebBookingMedicalRecord,
                            onListen: () {
                              final value = context
                                  .read<DetailPatientWebReservationModel>()
                                  .createWebBookingMedicalRecord
                                  .value;

                              if (value.hasData) {
                                logger.d('loading');
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
                                  prefixIcon: const Icon(Icons.error,
                                      color: Colors.white),
                                );
                              }
                            },
                            child: ValueListenableBuilder(
                                valueListenable: context
                                    .read<DetailPatientWebReservationModel>()
                                    .createWebBookingMedicalRecord,
                                builder: (context, value, _) {
                                  return Skeletonizer(
                                    enabled: value.loading,
                                    child: Container(
                                      padding: EdgeInsets.all(context
                                          .appTheme.spacing.marginMedium),
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFECE5),
                                        borderRadius: BorderRadius.circular(
                                          context.appTheme.spacing
                                              .borderRadiusMedium,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('候補日'),
                                          ReactiveFormArray(
                                            formArrayName: 'candidateDate',
                                            builder:
                                                (context, formArray, child) {
                                              final rows =
                                                  formArray.controls
                                                      .map((control) =>
                                                          control as FormGroup)
                                                      .map(
                                                        (currentForm) =>
                                                            ReactiveForm(
                                                          formGroup:
                                                              currentForm,
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    ReactiveDatePicker<
                                                                        DateTime>(
                                                                  formControlName:
                                                                      'preferredDate',
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2100),
                                                                  builder: (BuildContext context,
                                                                      ReactiveDatePickerDelegate<
                                                                              dynamic>
                                                                          picker,
                                                                      Widget?
                                                                          child) {
                                                                    return ReactiveTextField<
                                                                        DateTime>(
                                                                      formControlName:
                                                                          'preferredDate',
                                                                      valueAccessor:
                                                                          DateTimeValueAccessor(
                                                                        dateTimeFormat:
                                                                            DateFormat('yyyy/MM/dd'),
                                                                      ),
                                                                      onChanged:
                                                                          (value) {
                                                                        logger.d(
                                                                            value);
                                                                      },
                                                                      onSubmitted:
                                                                          (value) {
                                                                        logger.d(
                                                                            value);
                                                                      },
                                                                      decoration:
                                                                          InputDecoration(
                                                                        label: Text(
                                                                            '第一希望'),
                                                                        suffixIcon:
                                                                            IconButton(
                                                                          icon:
                                                                              const Icon(
                                                                            CupertinoIcons.calendar,
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                          onPressed:
                                                                              picker.showPicker,
                                                                        ),
                                                                      ),
                                                                      inputFormatters: [
                                                                        formatter
                                                                            .dateFormatter,
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: context
                                                                    .appTheme
                                                                    .spacing
                                                                    .marginMedium,
                                                              ),
                                                              ReactiveValueListenableBuilder(
                                                                  formControlName:
                                                                      'choice',
                                                                  builder:
                                                                      (context,
                                                                          control,
                                                                          _) {
                                                                    return Row(
                                                                      children: [
                                                                        boxText(
                                                                          context,
                                                                          '午前',
                                                                          textColor: control.value == '午前'
                                                                              ? Colors.white
                                                                              : Colors.black,
                                                                          bg: control.value == '午前'
                                                                              ? Color(0xffF08C67)
                                                                              : Colors.white,
                                                                          borderC:
                                                                              Color(0xffF08C67),
                                                                          onTap:
                                                                              () {
                                                                            control.value =
                                                                                '午前';
                                                                          },
                                                                        ),
                                                                        SizedBox(
                                                                          width: context
                                                                              .appTheme
                                                                              .spacing
                                                                              .marginMedium,
                                                                        ),
                                                                        boxText(
                                                                          context,
                                                                          '午後',
                                                                          textColor: control.value == '午後'
                                                                              ? Colors.white
                                                                              : Colors.black,
                                                                          bg: control.value == '午後'
                                                                              ? Color(0xffF08C67)
                                                                              : Colors.white,
                                                                          borderC:
                                                                              Color(0xffF08C67),
                                                                          onTap:
                                                                              () {
                                                                            control.value =
                                                                                '午後';
                                                                          },
                                                                        ),
                                                                        SizedBox(
                                                                          width: context
                                                                              .appTheme
                                                                              .spacing
                                                                              .marginMedium,
                                                                        ),
                                                                        boxText(
                                                                          context,
                                                                          '終日',
                                                                          textColor: control.value == '終日'
                                                                              ? Colors.white
                                                                              : Colors.black,
                                                                          bg: control.value == '終日'
                                                                              ? Color(0xffF08C67)
                                                                              : Colors.white,
                                                                          borderC:
                                                                              Color(0xffF08C67),
                                                                          onTap:
                                                                              () {
                                                                            control.value =
                                                                                '終日';
                                                                          },
                                                                        ),
                                                                      ],
                                                                    );
                                                                  }),
                                                              SizedBox(
                                                                width: context
                                                                    .appTheme
                                                                    .spacing
                                                                    .marginMedium,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    ReactiveTextField(
                                                                  formControlName:
                                                                      'timePeriodFrom',
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  inputFormatters: [
                                                                    formatter
                                                                        .timeFormatter,
                                                                  ],
                                                                  decoration:
                                                                      InputDecoration(
                                                                    label: Text(
                                                                      '時間帯（自）',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: context
                                                                    .appTheme
                                                                    .spacing
                                                                    .marginMedium,
                                                              ),
                                                              Text('〜'),
                                                              SizedBox(
                                                                width: context
                                                                    .appTheme
                                                                    .spacing
                                                                    .marginMedium,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    ReactiveTextField(
                                                                  formControlName:
                                                                      'timePeriodTo',
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  inputFormatters: [
                                                                    formatter
                                                                        .timeFormatter,
                                                                  ],
                                                                  decoration:
                                                                      InputDecoration(
                                                                    label: Text(
                                                                      '時間帯（至）',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Row(
                                                                  children: [
                                                                    if (formArray
                                                                            .controls
                                                                            .indexOf(currentForm) !=
                                                                        0) ...{
                                                                      IconButton(
                                                                        icon: Icon(
                                                                            Icons
                                                                                .delete_forever,
                                                                            color:
                                                                                Colors.red),
                                                                        onPressed:
                                                                            () =>
                                                                                formArray.removeAt(
                                                                          formArray
                                                                              .controls
                                                                              .indexOf(currentForm),
                                                                        ),
                                                                      ),
                                                                    }
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
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
                                                      height: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    children: rows.toList(),
                                                  ),
                                                  SizedBox(
                                                    height: context.appTheme
                                                        .spacing.marginMedium,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      formArray.add(
                                                        FormGroup({
                                                          'id': FormControl<
                                                              String>(),
                                                          'preferredDate':
                                                              FormControl<
                                                                  DateTime>(
                                                            validators: [
                                                              Validators
                                                                  .required
                                                            ],
                                                          ), // 第一希望
                                                          'choice': FormControl<
                                                                  String>(
                                                              value:
                                                                  '午前'), // 午前, 午後, 終日
                                                          'timePeriodFrom':
                                                              FormControl<
                                                                  String>(
                                                            validators: [
                                                              Validators
                                                                  .required
                                                            ],
                                                          ), // 時間帯（自）
                                                          'timePeriodTo':
                                                              FormControl<
                                                                  String>(
                                                            validators: [
                                                              Validators
                                                                  .required
                                                            ],
                                                          ), // 時間帯（至）
                                                          'medicalRecord':
                                                              FormControl<
                                                                  String>(),
                                                        })
                                                          ..markAllAsTouched(),
                                                      );
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.add_circle,
                                                          color:
                                                              Color(0xffF08C67),
                                                        ),
                                                        SizedBox(
                                                          width: context
                                                              .appTheme
                                                              .spacing
                                                              .marginSmall,
                                                        ),
                                                        Text(
                                                          '候補日を追加',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xffF08C67)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
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
                                                  formControlName: 'message',
                                                  decoration: InputDecoration(
                                                    label: Text(
                                                        'メッセージ（希望日がない場合は、メッセージ欄にてその旨伝えてください）'),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: context
                                                .appTheme.spacing.marginMedium,
                                          ),
                                          Center(
                                            child: ReactiveFormConsumer(
                                                builder: (context, form, _) {
                                              return ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffF08C67),
                                                ),
                                                onPressed: () {
                                                  if (form.valid) {
                                                    context
                                                        .read<
                                                            DetailPatientWebReservationModel>()
                                                        .postBookingMedicalRecord(
                                                            form);
                                                  }
                                                },
                                                child: Text('予約日を病院へ送信する'),
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
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
                              children: [
                                Expanded(
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
                                          label: Text('年月日'),
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
                                  child: ReactiveTimePicker(
                                    formControlName: 'testCallTime',
                                    builder: (BuildContext context,
                                        ReactiveTimePickerDelegate picker,
                                        Widget? child) {
                                      return ReactiveTextField<TimeOfDay>(
                                        formControlName: 'testCallTime',
                                        valueAccessor: TimeOfDayValueAccessor(),
                                        onChanged: (value) {
                                          logger.d(value);
                                        },
                                        onSubmitted: (value) {
                                          logger.d(value);
                                        },
                                        decoration: InputDecoration(
                                          label: Text('時間'),
                                          suffixIcon: IconButton(
                                            icon: const Icon(
                                              CupertinoIcons.time,
                                              color: Colors.grey,
                                            ),
                                            onPressed: picker.showPicker,
                                          ),
                                        ),
                                        inputFormatters: [
                                          formatter.timeFormatter,
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Text(
                            '予約履歴',
                            style: context.textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          ValueListenableBuilder(
                              valueListenable: context
                                  .read<DetailPatientWebReservationModel>()
                                  .webBookingMedicalRecordData,
                              builder: (context, value, _) {
                                return Skeletonizer(
                                  enabled: value.loading,
                                  child: Container(
                                    height: 400,
                                    width: double.infinity,
                                    child: DynamicTable(
                                      rowsPerPage: value.data?.length ?? 0,
                                      data: TableData(
                                        columns: [
                                          HeaderTableData(
                                            titleHeader: Text('状況'),
                                          ),
                                          HeaderTableData(
                                            titleHeader: Text('医療機関'),
                                          ),
                                          HeaderTableData(
                                            titleHeader: Text('予約日'),
                                          ),
                                          HeaderTableData(
                                            titleHeader: Text('テストコール'),
                                          ),
                                        ],
                                        rows: List<RowTableData>.generate(
                                          value.data?.length ?? 0,
                                          (index) {
                                            final data = value.data![index];
                                            return RowTableData(
                                              onTap: () {},
                                              cell: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${index + 1}',
                                                      style: context
                                                          .textTheme.titleLarge
                                                          ?.copyWith(
                                                              color: context
                                                                  .appTheme
                                                                  .primaryColor),
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                    SizedBox(
                                                      width: context.appTheme
                                                          .spacing.marginMedium,
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  data.hospital
                                                          ?.hospitalNameKatakana ??
                                                      '',
                                                  style: context
                                                      .textTheme.titleLarge
                                                      ?.copyWith(
                                                          color: context
                                                              .appTheme
                                                              .primaryColor),
                                                ),
                                                Text(
                                                  data.proposedDates
                                                          ?.map((e) => Dates
                                                              .formShortDate(e
                                                                  .proposedDate))
                                                          .join(' - ') ??
                                                      '',
                                                ),
                                                Text(
                                                  Dates.formatFullDateTime(data.createdAt),
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
                  )),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ValueListenableListener(
              valueListenable: context
                  .read<DetailPatientWebReservationModel>()
                  .createWebBookingMedicalRecord,
              onListen: () {
                final value = context
                    .read<DetailPatientWebReservationModel>()
                    .createWebBookingMedicalRecord
                    .value;
                if (value.hasData) {
                  logger.d('loading');
                  snackBarWidget(
                    message: '正常に保存されました',
                    prefixIcon:
                        const Icon(Icons.check_circle, color: Colors.white),
                  );
                }

                if (value.hasError) {
                  snackBarWidget(
                    message: '保存できませんでした。 もう一度試してください。',
                    backgroundColor: Colors.red,
                    prefixIcon: const Icon(Icons.error, color: Colors.white),
                  );
                }
              },
              child: ValueListenableBuilder(
                  valueListenable: context
                      .read<DetailPatientWebReservationModel>()
                      .createWebBookingMedicalRecord,
                  builder: (context, value, child) {
                    return ReactiveFormConsumer(
                      builder: (context, form, _) {
                        return ElevatedButton(
                            onPressed: !value.loading && form.valid
                                ? () => context
                                    .read<DetailPatientWebReservationModel>()
                                    .postBookingMedicalRecord(form)
                                : null,
                            child: WithLoadingButton(
                              isLoading: value.loading,
                              child: Text('保存する'),
                            ));
                      },
                    );
                  }),
            )
          ],
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
