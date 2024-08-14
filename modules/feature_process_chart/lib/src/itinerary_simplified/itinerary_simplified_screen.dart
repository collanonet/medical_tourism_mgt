import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'itinerary_simplified_model.dart';

class ItinerarySimpleVersionScreen extends StatefulWidget {
  const ItinerarySimpleVersionScreen({super.key});

  @override
  State<ItinerarySimpleVersionScreen> createState() =>
      _ItinerarySimpleVersionScreenState();
}

class _ItinerarySimpleVersionScreenState
    extends State<ItinerarySimpleVersionScreen> {
  @override
  Widget build(BuildContext context) {
    final form = ReactiveForm.of(context) as FormGroup;
    return ValueListenableBuilder(
      valueListenable: context.watch<ItinerarySimpleVersionModel>().submit,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffF0F3F5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'タイトル',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 20),
                            ReactiveFormArray(
                              formArrayName: 'title',
                              builder: (context, formArray, child) {
                                final rows = formArray.controls
                                    .map((control) => control as FormGroup)
                                    .map(
                                  (currentForm) {
                                    return ReactiveForm(
                                      formGroup: currentForm,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              IntrinsicWidth(
                                                stepWidth: 200,
                                                child: ReactiveTextField(
                                                  formControlName: 'patienName',
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 1),
                                                    ),
                                                    label: Text('患者名'),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 30),
                                              IntrinsicWidth(
                                                stepWidth: 400,
                                                child: ReactiveTextField(
                                                  formControlName:
                                                      'Name_of_medical_institution',
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey,
                                                          width: 1),
                                                    ),
                                                    label: Text('医療機関名'),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              IntrinsicWidth(
                                                stepWidth: 200,
                                                child: ReactiveDatePicker<
                                                    DateTime>(
                                                  formControlName:
                                                      'dateAndTimeConsultaion',
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime.now(),
                                                  builder: (BuildContext
                                                          context,
                                                      ReactiveDatePickerDelegate<
                                                              dynamic>
                                                          picker,
                                                      Widget? child) {
                                                    return ReactiveTextField<
                                                        DateTime>(
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1),
                                                      )),
                                                      formControlName:
                                                          'dateAndTimeConsultaion',
                                                      readOnly: true,
                                                      onTap: (value) =>
                                                          picker.showPicker(),
                                                      valueAccessor:
                                                          DateTimeValueAccessor(),
                                                    );
                                                  },
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              IntrinsicWidth(
                                                stepWidth: 150,
                                                child: ReactiveTextField(
                                                  formControlName: 'startTime',
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width: 1),
                                                    ),
                                                    label: Text('開始時間'),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              IntrinsicWidth(
                                                stepWidth: 150,
                                                child: ReactiveTextField(
                                                  formControlName: 'endTime',
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width: 1),
                                                    ),
                                                    label: Text('終了時間（予定）'),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          ReactiveTextField(
                                            formControlName:
                                                'Health_Check_Package',
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey,
                                                    width: 1),
                                              ),
                                              label: Text('健康診断パッケージ'),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              IntrinsicWidth(
                                                stepWidth: 250,
                                                child: ReactiveTextField(
                                                  formControlName: 'optionName',
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width: 1),
                                                    ),
                                                    label: Text('オプション名'),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('健診日'),
                                                  Row(
                                                    children: [
                                                      IntrinsicWidth(
                                                        child:
                                                            ReactiveRadioListTile(
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .leading,
                                                          formControlName:
                                                              'checkupDate',
                                                          value: true,
                                                          title: Text('同日'),
                                                        ),
                                                      ),
                                                      IntrinsicWidth(
                                                        child:
                                                            ReactiveRadioListTile(
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                          controlAffinity:
                                                              ListTileControlAffinity
                                                                  .leading,
                                                          formControlName:
                                                              'checkupDate',
                                                          value: false,
                                                          title: Text('別日'),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 20),
                                              IntrinsicWidth(
                                                stepWidth: 200,
                                                child: ReactiveDatePicker<
                                                    DateTime>(
                                                  formControlName: 'date',
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime.now(),
                                                  builder: (BuildContext
                                                          context,
                                                      ReactiveDatePickerDelegate<
                                                              dynamic>
                                                          picker,
                                                      Widget? child) {
                                                    return ReactiveTextField<
                                                        DateTime>(
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1),
                                                      )),
                                                      formControlName: 'date',
                                                      readOnly: true,
                                                      onTap: (value) =>
                                                          picker.showPicker(),
                                                      valueAccessor:
                                                          DateTimeValueAccessor(),
                                                    );
                                                  },
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              IntrinsicWidth(
                                                stepWidth: 150,
                                                child: ReactiveTextField(
                                                  formControlName: 'time',
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.grey,
                                                              width: 1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(),
                                        ],
                                      ),
                                    );
                                  },
                                );
                                return Column(children: [
                                  Column(
                                    children: rows.toList(),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      formArray.add(FormGroup({
                                        'patienName': FormControl<String>(),
                                        'Name_of_medical_institution':
                                            FormControl<String>(),
                                        'dateAndTimeConsultaion':
                                            FormControl<DateTime>(),
                                        'startTime': FormControl<String>(),
                                        'endTime': FormControl<String>(),
                                        'Health_Check_Package':
                                            FormControl<String>(),
                                        'optionName': FormControl<String>(),
                                        'checkupDate': FormControl<bool>(),
                                        'date': FormControl<DateTime>(),
                                        'time': FormControl<String>(),
                                      }));
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_box_rounded,
                                            color:
                                                context.appTheme.primaryColor,
                                          ),
                                          Text(
                                            'オプションを追加',
                                            style: TextStyle(
                                                color: context
                                                    .appTheme.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ]);
                              },
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '事前説明',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ReactiveForm(
                        formGroup:
                            form.control('prior_explanation') as FormGroup,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: ValueListenableBuilder(
                                      valueListenable: context
                                          .read<ItinerarySimpleVersionModel>()
                                          .dataVarious,
                                      builder: (context, value, _) {
                                        return ReactiveDropdownFormField(
                                          formControlName:
                                              'Explanation_of_various_tests',
                                          items: value
                                              .map((e) => DropdownMenuItem(
                                                    value: e.various,
                                                    child: Text(
                                                      e.various,
                                                    ),
                                                  ))
                                              .toList(),
                                        );
                                      }),
                                ),
                                const SizedBox(width: 20),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('定型文を挿入'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            IntrinsicWidth(
                              stepWidth: MediaQuery.of(context).size.width,
                              child: ReactiveTextField(
                                maxLines: 3,
                                formControlName:
                                    'Meals_before_and_on_the_day_of_the_examination',
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  label: Text('検査前・当日の食事について'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            IntrinsicWidth(
                              stepWidth: MediaQuery.of(context).size.width,
                              child: ReactiveTextField(
                                maxLines: 3,
                                formControlName: 'about_taking_medicine',
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  label: Text('薬の服用について'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            IntrinsicWidth(
                              stepWidth: MediaQuery.of(context).size.width,
                              child: ReactiveTextField(
                                maxLines: 3,
                                formControlName:
                                    'bring_on_the_day_of_your_health_check',
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  label: Text('健康診断当日の持ち物'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            IntrinsicWidth(
                              stepWidth: MediaQuery.of(context).size.width,
                              child: ReactiveTextField(
                                maxLines: 3,
                                formControlName: 'other_considerations',
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  label: Text('その他の考慮事項'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '通訳者またはガイド',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ReactiveForm(
                        formGroup:
                            form.control('Interpreter_or_guide') as FormGroup,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('通訳者またはガイド'),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              contentPadding: EdgeInsets.zero,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              formControlName:
                                                  'interpreter_or_guide',
                                              value: true,
                                              title: Text('あり'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              contentPadding: EdgeInsets.zero,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              formControlName:
                                                  'interpreter_or_guide',
                                              value: false,
                                              title: Text('なし'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName: 'date',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return Stack(
                                        children: [
                                          ReactiveTextField<DateTime>(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 1),
                                            )),
                                            formControlName: 'date',
                                            readOnly: true,
                                            onTap: (value) =>
                                                picker.showPicker(),
                                            valueAccessor:
                                                DateTimeValueAccessor(),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                onPressed: () =>
                                                    picker.showPicker(),
                                                icon: const Icon(
                                                    Icons.calendar_month,
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: ReactiveTextField(
                                    formControlName: 'time',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IntrinsicWidth(
                                  stepWidth: 300,
                                  child: ReactiveTextField(
                                    formControlName: 'meeting_point',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      label: Text('合流場所'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '送迎',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ReactiveForm(
                        formGroup:
                            form.control('pick_up_and_drop_off') as FormGroup,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('送迎'),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              contentPadding: EdgeInsets.zero,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              formControlName:
                                                  'pick_up_and_drop_off_check',
                                              value: true,
                                              title: Text('あり'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              contentPadding: EdgeInsets.zero,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              formControlName:
                                                  'pick_up_and_drop_off_check',
                                              value: false,
                                              title: Text('なし'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: ReactiveDatePicker<DateTime>(
                                    formControlName: 'Pick_up_date_and_time',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return Stack(
                                        children: [
                                          ReactiveTextField<DateTime>(
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 1),
                                            )),
                                            formControlName:
                                                'Pick_up_date_and_time',
                                            readOnly: true,
                                            onTap: (value) =>
                                                picker.showPicker(),
                                            valueAccessor:
                                                DateTimeValueAccessor(),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                onPressed: () =>
                                                    picker.showPicker(),
                                                icon: const Icon(
                                                    Icons.calendar_month,
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: ReactiveTextField(
                                    formControlName: 'time',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IntrinsicWidth(
                                  stepWidth: 300,
                                  child: ReactiveTextField(
                                    formControlName: 'place',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      label: Text('場所'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('種別'),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              contentPadding: EdgeInsets.zero,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              formControlName: 'type',
                                              value: true,
                                              title: Text('専用車'),
                                            ),
                                          ),
                                          Expanded(
                                            child: ReactiveRadioListTile(
                                              contentPadding: EdgeInsets.zero,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              formControlName: 'type',
                                              value: false,
                                              title: Text('タクシー利用'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IntrinsicWidth(
                                  stepWidth: 300,
                                  child: ReactiveTextField(
                                    formControlName: 'arranger',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      label: Text('手配者'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                IntrinsicWidth(
                                  stepWidth: 100,
                                  child: ReactiveTextField(
                                    formControlName: 'carNumber',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      label: Text('車番'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: ReactiveTextField(
                                    formControlName: 'driverNameKanli',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      label: Text('ドライバー名（漢字）'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: ReactiveTextField(
                                    formControlName: 'driverNameKana',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      label: Text('ドライバー名（カナ）'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IntrinsicWidth(
                                  stepWidth: 200,
                                  child: ReactiveTextField(
                                    formControlName: 'phone',
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.grey, width: 1),
                                      ),
                                      label: Text('電話番号'),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableListener(
                    valueListenable:
                        context.read<ItinerarySimpleVersionModel>().submit,
                    onListen: () {
                      final value = context
                          .read<ItinerarySimpleVersionModel>()
                          .submit
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
                          prefixIcon:
                              const Icon(Icons.error, color: Colors.white),
                        );
                      }
                    },
                    child: ValueListenableBuilder(
                        valueListenable:
                            context.watch<ItinerarySimpleVersionModel>().submit,
                        builder: (context, value, child) {
                          return ReactiveFormConsumer(
                            builder: (context, form, _) {
                              return ElevatedButton(
                                  onPressed: !value.loading && form.valid
                                      ? () => context
                                          .read<ItinerarySimpleVersionModel>()
                                          .submitData(form)
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
          ),
        );
      },
    );
  }
}
