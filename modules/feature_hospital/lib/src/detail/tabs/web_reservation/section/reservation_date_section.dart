import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReservationDateSection extends StatefulWidget {
  const ReservationDateSection({super.key});

  @override
  State<ReservationDateSection> createState() => _ReservationDateSectionState();
}

class _ReservationDateSectionState extends State<ReservationDateSection> {
  String? selectedTime = '';
  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('reservationDateSection') as FormGroup;
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('reservationDateSection.candidateDate') as FormArray;
    return ReactiveForm(
      formGroup: formGroup,
      child: ColumnSeparated(
          crossAxisAlignment: CrossAxisAlignment.start,
          separatorBuilder: (context, index) => SizedBox(
                height: context.appTheme.spacing.formSpacing,
              ),
          children: [
            Text(
              '予約日',
              style: context.textTheme.bodyLarge,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: context.appTheme.secondaryColor),
              child: ColumnSeparated(
                crossAxisAlignment: CrossAxisAlignment.start,
                separatorBuilder: (context, index) => SizedBox(
                  height: context.appTheme.spacing.formSpacing,
                ),
                children: [
                  Text(
                    '候補日',
                    style: context.textTheme.bodyLarge,
                  ),
                  ReactiveFormArray(
                      formArrayName: 'candidateDate',
                      builder: ((context, formArray, child) {
                        final rows = formArray.controls.map((control) =>
                            ReactiveForm(
                                formGroup: control as FormGroup,
                                child: RowSeparated(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          width: context
                                              .appTheme.spacing.formSpacing,
                                        ),
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: ColumnSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                                      height: context
                                                          .appTheme
                                                          .spacing
                                                          .marginExtraSmall,
                                                    ),
                                            children: [
                                              Text(
                                                '${1}',
                                                style: context
                                                    .textTheme.bodyMedium,
                                              ),
                                              ReactiveDatePicker<DateTime>(
                                                formControlName: 'firstHope',
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
                                                        'firstHope',
                                                    decoration: InputDecoration(
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
                                                  );
                                                },
                                              ),
                                            ]),
                                      ),
                                      SizedBox(
                                        width: 350,
                                        child: RowSeparated(
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                            width: context.appTheme.spacing
                                                .marginExtraSmall,
                                          ),
                                          children: ['午前', '午後', '終日']
                                              .map((item) => GestureDetector(
                                                    onTap: () {
                                                      selectedTime = item;
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 35,
                                                          vertical: 15),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                              color: context
                                                                  .appTheme
                                                                  .segmentedTheme
                                                                  .selectedBackgroundColor),
                                                          color: selectedTime == item
                                                              ? context
                                                                  .appTheme
                                                                  .segmentedTheme
                                                                  .selectedBackgroundColor
                                                              : context
                                                                  .appTheme
                                                                  .segmentedTheme
                                                                  .unselectedBackgroundColor),
                                                      child: Text(
                                                        item,
                                                        style: context.textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                color: selectedTime == item
                                                                    ? context
                                                                        .appTheme
                                                                        .segmentedTheme
                                                                        .selectedTextColor
                                                                    : context
                                                                        .appTheme
                                                                        .secondaryBackgroundColor),
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                      Expanded(
                                        child: ColumnSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                                      height: context
                                                          .appTheme
                                                          .spacing
                                                          .marginExtraSmall,
                                                    ),
                                            children: [
                                              Text(
                                                '時間帯（自）',
                                                style: context
                                                    .textTheme.bodyMedium,
                                              ),
                                              ReactiveTimePicker(
                                                formControlName: 'fromTime',
                                                builder: (BuildContext context,
                                                    ReactiveTimePickerDelegate
                                                        picker,
                                                    Widget? child) {
                                                  return ReactiveTextField<
                                                      TimeOfDay>(
                                                    formControlName: 'fromTime',
                                                    decoration: InputDecoration(
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
                                                  );
                                                },
                                              ),
                                            ]),
                                      ),
                                      const Text(
                                        '~',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      Expanded(
                                        child: ColumnSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                                      height: context
                                                          .appTheme
                                                          .spacing
                                                          .marginExtraSmall,
                                                    ),
                                            children: [
                                              Text(
                                                '時間帯（至）',
                                                style: context
                                                    .textTheme.bodyMedium,
                                              ),
                                              ReactiveTimePicker(
                                                formControlName: 'endTime',
                                                builder: (BuildContext context,
                                                    ReactiveTimePickerDelegate
                                                        picker,
                                                    Widget? child) {
                                                  return ReactiveTextField<
                                                      TimeOfDay>(
                                                    formControlName: 'endTime',
                                                    decoration: InputDecoration(
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
                                                  );
                                                },
                                              ),
                                            ]),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            if (formArray.controls
                                                    .indexOf(control) !=
                                                0) ...{
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.delete_forever,
                                                    color: Colors.red),
                                                onPressed: () =>
                                                    formArray.removeAt(
                                                  formArray.controls
                                                      .indexOf(control),
                                                ),
                                              ),
                                            }
                                          ],
                                        ),
                                      ),
                                    ])));
                        return ColumnSeparated(
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          children: rows.toList(),
                        );
                      })),
                  InkWell(
                    onTap: () {
                      formArray.add(
                        FormGroup({
                          'firstHope': FormControl<DateTime>(),
                          'morning': FormControl<bool>(value: false),
                          'fromTime': FormControl<TimeOfDay>(),
                          'endTime': FormControl<TimeOfDay>(),
                        })
                          ..markAllAsTouched(),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_circle,
                          color: Color(0xffF08C67),
                        ),
                        SizedBox(
                          width: context.appTheme.spacing.marginSmall,
                        ),
                        const Text(
                          '候補日を追加',
                          style: TextStyle(color: Color(0xffF08C67)),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'メッセージ（希望日がない場合は、メッセージ欄にてその旨伝えてください）',
                    style: context.textTheme.bodyMedium,
                  ),
                  ReactiveTextField<String>(
                    formControlName: 'message',
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'メッセージを入力してください',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF08C67)),
                      onPressed: () {},
                      child: const Text(
                        '予約日を病院へ送信する',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
