import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DetailPatientWebReservationScreen extends StatefulWidget {
  const DetailPatientWebReservationScreen({super.key});

  @override
  State<DetailPatientWebReservationScreen> createState() =>
      _DetailPatientWebReservationScreenState();
}

class _DetailPatientWebReservationScreenState
    extends State<DetailPatientWebReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  formControlName: '1st_choice',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                  builder: (BuildContext context,
                      ReactiveDatePickerDelegate<dynamic> picker,
                      Widget? child) {
                    return ReactiveTextField<DateTime>(
                      formControlName: '1st_choice',
                      readOnly: true,
                      onTap: (value) => picker.showPicker(),
                      valueAccessor: DateTimeValueAccessor(
                        dateTimeFormat: DateFormat('yyyy/MM/dd'),
                      ),
                      decoration: const InputDecoration(
                        label: Text(
                          '第１希望',
                        ),
                        suffixIcon: Icon(
                          CupertinoIcons.calendar,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: ReactiveDatePicker<DateTime>(
                  formControlName: '2nd_choice',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                  builder: (BuildContext context,
                      ReactiveDatePickerDelegate<dynamic> picker,
                      Widget? child) {
                    return ReactiveTextField<DateTime>(
                      formControlName: '2nd_choice',
                      readOnly: true,
                      onTap: (value) => picker.showPicker(),
                      valueAccessor: DateTimeValueAccessor(
                        dateTimeFormat: DateFormat('yyyy/MM/dd'),
                      ),
                      decoration: const InputDecoration(
                        label: Text(
                          '第２希望',
                        ),
                        suffixIcon: Icon(
                          CupertinoIcons.calendar,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: ReactiveDatePicker<DateTime>(
                  formControlName: '3rd_choice',
                  firstDate: DateTime(2000),
                  lastDate: DateTime(3000),
                  builder: (BuildContext context,
                      ReactiveDatePickerDelegate<dynamic> picker,
                      Widget? child) {
                    return ReactiveTextField<DateTime>(
                      formControlName: '3rd_choice',
                      readOnly: true,
                      onTap: (value) => picker.showPicker(),
                      valueAccessor: DateTimeValueAccessor(
                        dateTimeFormat: DateFormat('yyyy/MM/dd'),
                      ),
                      decoration: const InputDecoration(
                        label: Text(
                          '第３希望',
                        ),
                        suffixIcon: Icon(
                          CupertinoIcons.calendar,
                          color: Colors.grey,
                        ),
                      ),
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
              Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  value: true,
                  onChanged: (value) {}),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Text(
                '希望日なし',
                style: context.textTheme.titleMedium,
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
            children: [
              Expanded(
                child: ReactiveTextField(
                  formControlName: 'Medical_institution_name',
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
                  formControlName: 'Doctor_name',
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
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '月',
                      textColor: Colors.white,
                      bg: context.appTheme.primaryColor,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '火',
                      textColor: Colors.white,
                      bg: context.appTheme.primaryColor,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '水',
                      textColor: Colors.white,
                      bg: context.appTheme.primaryColor,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '木',
                      textColor: Colors.white,
                      bg: context.appTheme.primaryColor,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '金',
                      textColor: Colors.white,
                      bg: context.appTheme.primaryColor,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '土',
                      textColor: Colors.white,
                      bg: context.appTheme.primaryColor,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
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
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'shift_1',
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '×',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '○',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '×',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '×',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '○',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '○',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
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
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        formControlName: 'shift_2',
                      ),
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '○',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '○',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '○',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '×',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '○',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                    boxText(
                      context,
                      '×',
                      bg: Colors.white,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginMedium,
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
          Container(
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
            decoration: BoxDecoration(
              color: Color(0xffFFECE5),
              borderRadius: BorderRadius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('候補日'),
                ReactiveFormArray(
                  formArrayName: 'Candidate_Date',
                  builder: (context, formArray, child) {
                    final rows = formArray.controls
                        .map((control) => control as FormGroup)
                        .map(
                          (currentForm) => ReactiveForm(
                            formGroup: currentForm,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName: 'First_choice',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName: 'First_choice',
                                        readOnly: true,
                                        onTap: (value) => picker.showPicker(),
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
                                        decoration: const InputDecoration(
                                          label: Text('第一希望'),
                                          suffixIcon: Icon(
                                            CupertinoIcons.calendar,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                boxText(
                                  context,
                                  '午前',
                                  textColor:
                                      currentForm.control('choice').value ==
                                              '午前'
                                          ? Colors.white
                                          : Colors.black,
                                  bg: currentForm.control('choice').value ==
                                          '午前'
                                      ? Color(0xffF08C67)
                                      : Colors.white,
                                  borderC: Color(0xffF08C67),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                boxText(
                                  context,
                                  '午後',
                                  textColor:
                                      currentForm.control('choice').value ==
                                              '午後'
                                          ? Colors.white
                                          : Colors.black,
                                  bg: currentForm.control('choice').value ==
                                          '午後'
                                      ? Color(0xffF08C67)
                                      : Colors.white,
                                  borderC: Color(0xffF08C67),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                boxText(
                                  context,
                                  '終日',
                                  textColor:
                                      currentForm.control('choice').value ==
                                              '終日'
                                          ? Colors.white
                                          : Colors.black,
                                  bg: currentForm.control('choice').value ==
                                          '終日'
                                      ? Color(0xffF08C67)
                                      : Colors.white,
                                  borderC: Color(0xffF08C67),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'Time_period_from',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '時間帯（自）',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Text('〜'),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: ReactiveTextField(
                                    formControlName: 'Time_period_to',
                                    decoration: InputDecoration(
                                      label: Text(
                                        '時間帯（至）',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ColumnSeparated(
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          children: rows.toList(),
                        ),
                        SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_circle,
                                color: Color(0xffF08C67),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginSmall,
                              ),
                              Text(
                                '候補日を追加',
                                style: TextStyle(color: Color(0xffF08C67)),
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
                Row(
                  children: [
                    Expanded(
                      child: ReactiveTextField(
                        minLines: 3,
                        maxLines: 5,
                        formControlName: 'message',
                        decoration: InputDecoration(
                          label: Text('メッセージ（希望日がない場合は、メッセージ欄にてその旨伝えてください）'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF08C67),
                    ),
                    onPressed: () {},
                    child: Text('予約日を病院へ送信する'),
                  ),
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
            padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
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
                    formControlName: 'date',
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (BuildContext context,
                        ReactiveDatePickerDelegate<dynamic> picker,
                        Widget? child) {
                      return ReactiveTextField<DateTime>(
                        formControlName: 'date',
                        readOnly: true,
                        onTap: (value) => picker.showPicker(),
                        valueAccessor: DateTimeValueAccessor(
                          dateTimeFormat: DateFormat('yyyy/MM/dd'),
                        ),
                        onChanged: (value) {
                          logger.d(value);
                        },
                        onSubmitted: (value) {
                          logger.d(value);
                        },
                        decoration: const InputDecoration(
                          label: Text('年月日'),
                          suffixIcon: Icon(
                            CupertinoIcons.calendar,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                  child: ReactiveTimePicker(
                    formControlName: 'time',
                    builder: (BuildContext context,
                        ReactiveTimePickerDelegate picker, Widget? child) {
                      return ReactiveTextField<TimeOfDay>(
                        formControlName: 'time',
                        readOnly: true,
                        onTap: (value) => picker.showPicker(),
                        valueAccessor: TimeOfDayValueAccessor(),
                        onChanged: (value) {
                          logger.d(value);
                        },
                        onSubmitted: (value) {
                          logger.d(value);
                        },
                        decoration: const InputDecoration(
                          label: Text('時間'),
                          suffixIcon: Icon(
                            CupertinoIcons.time,
                            color: Colors.grey,
                          ),
                        ),
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
          Container(
            height: 400,
            width: double.infinity,
            child: DynamicTable(
              rowsPerPage: 8,
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
                  8,
                  (index) {
                    return RowTableData(
                      onTap: () {},
                      cell: [
                        Row(
                          children: [
                            Text(
                              '${index + 1}',
                              style: context.textTheme.titleLarge?.copyWith(
                                  color: context.appTheme.primaryColor),
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: Color(0xff98A6B5),
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Text(
                                'CXL',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'りんくうメディカルクリニック',
                          style: context.textTheme.titleLarge
                              ?.copyWith(color: context.appTheme.primaryColor),
                        ),
                        Text(
                          '2023/08/22−2023/09/10',
                        ),
                        Text(
                          '2023/07/05 14:30',
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

boxText(BuildContext context, String text,
        {Color? bg, Color? borderC, Color? textColor}) =>
    Container(
      padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
      decoration: BoxDecoration(
        color: bg,
        border: Border.all(
          color: borderC ?? bg ?? Colors.grey,
        ),
        borderRadius:
            BorderRadius.circular(context.appTheme.spacing.borderRadiusMedium),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.black),
        ),
      ),
    );
