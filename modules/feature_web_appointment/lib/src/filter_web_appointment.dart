import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'filter_web_appointment_form.dart';
import 'web_appointment_model.dart';

class WebAppointmentFilter extends StatefulWidget {
  const WebAppointmentFilter({super.key});

  @override
  State<WebAppointmentFilter> createState() => _WebAppointmentFilterState();
}

class _WebAppointmentFilterState extends State<WebAppointmentFilter> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    return Consumer<WebAppointmentModel>(
      builder: (context, model, child) {
        return ReactiveFormConfig(
          validationMessages: validationMessages,
          child: ReactiveFormBuilder(
            form: () => formFilterWebAppointment(),
            builder: (context, formGroup, child) {
              return ValueListenableBuilder(
                  valueListenable:
                      context.read<WebAppointmentModel>().webBookingAdmin,
                  builder: (context, value, _) {
                    return Skeletonizer(
                      enabled: value.loading,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '病院・クリニック　Web診療予約履歴　検索',
                              style: context.textTheme.titleMedium,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'hospitalName',
                                    decoration: InputDecoration(
                                      label: Text('病院名'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'doctor_name',
                                    decoration: InputDecoration(
                                      label: Text('医師名'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    final periodFrom = formGroup
                                        .control('reservation_date_from');
                                    final periodTo = formGroup
                                        .control('reservation_date_to');
                                    final valueDate =
                                        periodFrom.value ?? DateTime.now();
                                    periodFrom.value = DateTime(
                                        valueDate.year, valueDate.month - 1, 1);
                                    periodTo.value = DateTime(
                                        valueDate.year, valueDate.month, 0);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginSmall),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            context.appTheme.spacing
                                                .borderRadiusMedium),
                                        border: Border.all(color: Colors.grey)),
                                    child: Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: context.appTheme.primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        context.appTheme.spacing.marginSmall),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName:
                                            'reservation_date_from',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return ReactiveTextField<DateTime>(
                                            formControlName:
                                                'reservation_date_from',
                                            valueAccessor:
                                                DateTimeValueAccessor(
                                              dateTimeFormat:
                                                  DateFormat('yyyy/MM/dd'),
                                            ),
                                            decoration: InputDecoration(
                                              label: Text('予約日（自）'),
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
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Text(
                                        '〜',
                                        style: TextStyle(
                                          fontFamily: 'NotoSansJP',
                                          package: 'core_ui',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: ReactiveDatePicker<DateTime>(
                                        formControlName: 'reservation_date_to',
                                        firstDate: DateTime(1900),
                                        lastDate: DateTime(2100),
                                        builder: (BuildContext context,
                                            ReactiveDatePickerDelegate<dynamic>
                                                picker,
                                            Widget? child) {
                                          return ReactiveTextField<DateTime>(
                                            formControlName:
                                                'reservation_date_to',
                                            valueAccessor:
                                                DateTimeValueAccessor(
                                              dateTimeFormat:
                                                  DateFormat('yyyy/MM/dd'),
                                            ),
                                            decoration: InputDecoration(
                                              label: Text('予約日（至）'),
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
                                )),
                                SizedBox(
                                    width:
                                        context.appTheme.spacing.marginSmall),
                                InkWell(
                                  onTap: () {
                                    final periodFrom = formGroup
                                        .control('reservation_date_from');
                                    final periodTo = formGroup
                                        .control('reservation_date_to');
                                    final valueDate =
                                        periodTo.value ?? DateTime.now();
                                    periodFrom.value = DateTime(
                                        valueDate.year, valueDate.month + 1, 1);
                                    periodTo.value = DateTime(
                                        valueDate.year, valueDate.month + 2, 0);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        context.appTheme.spacing.marginSmall),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            context.appTheme.spacing
                                                .borderRadiusMedium),
                                        border: Border.all(color: Colors.grey)),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: context.appTheme.primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '予約状態',
                                      style: context.textTheme.bodySmall,
                                    ),
                                    Row(
                                      children: [
                                        IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                            contentPadding: EdgeInsets.zero,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            formControlName:
                                                'inquiryInProgress',
                                            title: Text(
                                              '問合せ中',
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            width: context
                                                .appTheme.spacing.marginMedium),
                                        IntrinsicWidth(
                                          child: ReactiveCheckboxListTile(
                                            contentPadding: EdgeInsets.zero,
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            formControlName:
                                                'reservationConfirmed',
                                            title: Text('予約確定'),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium),
                                OutlinedButton(
                                  onPressed: () {
                                    formGroup.reset();
                                    context
                                        .read<WebAppointmentModel>()
                                        .getWebBookingAdmin();
                                  },
                                  child: Text(
                                    'クリア',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium),
                                ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<WebAppointmentModel>()
                                        .getWebBookingAdmin(
                                          hospitalName: formGroup
                                              .control('hospitalName')
                                              .value,
                                          doctor_name: formGroup
                                              .control('doctor_name')
                                              .value,
                                          reservation_date_from: formGroup
                                              .control('reservation_date_from')
                                              .value,
                                          reservation_date_to: formGroup
                                              .control('reservation_date_to')
                                              .value,
                                          inquiryInProgress: formGroup
                                              .control('inquiryInProgress')
                                              .value,
                                          reservationConfirmed: formGroup
                                              .control('reservationConfirmed')
                                              .value,
                                        );
                                  },
                                  child: Text(
                                    '検索',
                                    style: TextStyle(
                                      fontFamily: 'NotoSansJP',
                                      package: 'core_ui',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        );
      },
    );
  }
}
