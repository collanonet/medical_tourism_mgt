import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ItinerarySimpleVersionScreen extends StatefulWidget {
  const ItinerarySimpleVersionScreen({super.key});

  @override
  State<ItinerarySimpleVersionScreen> createState() => _ItinerarySimpleVersionScreenState();
}

class _ItinerarySimpleVersionScreenState extends State<ItinerarySimpleVersionScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.grey, width: 1),
                              color: Colors.grey),
                          child: Center(
                            child: Icon(
                              Icons.notifications_active,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '李明様向け　行程表',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              Text('2023/11/11〜2023/11/15')
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(0, 152, 209, 248),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1),
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
                                            stepWidth: 300,
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
                                            child:
                                                ReactiveDatePicker<DateTime>(
                                              formControlName:
                                                  'dateAndTimeConsultaion',
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime.now(),
                                              builder: (BuildContext context,
                                                  ReactiveDatePickerDelegate<
                                                          dynamic>
                                                      picker,
                                                  Widget? child) {
                                                return Stack(
                                                  children: [
                                                    ReactiveTextField<
                                                        DateTime>(
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .grey,
                                                                width: 1),
                                                      )),
                                                      formControlName:
                                                          'dateAndTimeConsultaion',
                                                      readOnly: true,
                                                      onTap: (value) =>
                                                          picker.showPicker(),
                                                      valueAccessor:
                                                          DateTimeValueAccessor(),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets
                                                              .only(top: 6),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: IconButton(
                                                          onPressed: () =>
                                                              picker
                                                                  .showPicker(),
                                                          icon: const Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              color: Colors
                                                                  .blue),
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
                                            stepWidth: 180,
                                            child: ReactiveTextField(
                                              formControlName: 'startTime',
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                  borderSide:
                                                      const BorderSide(
                                                          color: Colors.grey,
                                                          width: 1),
                                                ),
                                                label: Text('開始時間'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          IntrinsicWidth(
                                            stepWidth: 180,
                                            child: ReactiveTextField(
                                              formControlName: 'endTime',
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                  borderSide:
                                                      const BorderSide(
                                                          color: Colors.grey,
                                                          width: 1),
                                                ),
                                                label: Text('終了時間（予定）'),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          IntrinsicWidth(
                                            stepWidth: 700,
                                            child: ReactiveTextField(
                                              formControlName:
                                                  'Health_Check_Package',
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                  borderSide:
                                                      const BorderSide(
                                                          color: Colors.grey,
                                                          width: 1),
                                                ),
                                                label: Text('健康診断パッケージ'),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IntrinsicWidth(
                                            stepWidth: 200,
                                            child: ReactiveTextField(
                                              formControlName: 'optionName',
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                  borderSide:
                                                      const BorderSide(
                                                          color: Colors.grey,
                                                          width: 1),
                                                ),
                                                label: Text('オプション名'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          IntrinsicWidth(
                                            stepWidth: 300,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text('健診日'),
                                                Row(
                                                  children: [
                                                    Expanded(
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
                                                    Expanded(
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
                                          ),
                                          const SizedBox(width: 20),
                                          IntrinsicWidth(
                                            stepWidth: 200,
                                            child:
                                                ReactiveDatePicker<DateTime>(
                                              formControlName: 'date',
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime.now(),
                                              builder: (BuildContext context,
                                                  ReactiveDatePickerDelegate<
                                                          dynamic>
                                                      picker,
                                                  Widget? child) {
                                                return Stack(
                                                  children: [
                                                    ReactiveTextField<
                                                        DateTime>(
                                                      decoration:
                                                          InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:
                                                            BorderSide(
                                                                color: Colors
                                                                    .grey,
                                                                width: 1),
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
                                                          const EdgeInsets
                                                              .only(top: 6),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: IconButton(
                                                          onPressed: () =>
                                                              picker
                                                                  .showPicker(),
                                                          icon: const Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              color: Colors
                                                                  .blue),
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                  borderSide:
                                                      const BorderSide(
                                                          color: Colors.grey,
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
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Row(
                                    children: [
                                      Icon(Icons.add_box_rounded),
                                      Text('オプションを追加'),
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
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ReactiveTextField(
                          formControlName: 'Explanation_of_various_tests',
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
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
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
                      formControlName:
                          'Meals_before_and_on_the_day_of_the_examination',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
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
                          'Meals_before_and_on_the_day_of_the_examination',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
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
                      formControlName:
                          'Meals_before_and_on_the_day_of_the_examination',
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1),
                        ),
                        label: Text('その他の考慮事項'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '通訳者またはガイド',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IntrinsicWidth(
                        stepWidth: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('通訳者またはガイド'),
                            Row(
                              children: [
                                Expanded(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'Interpreter_or_guide',
                                    value: true,
                                    title: Text('同日'),
                                  ),
                                ),
                                Expanded(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'Interpreter_or_guide',
                                    value: false,
                                    title: Text('別日'),
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
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return Stack(
                              children: [
                                ReactiveTextField<DateTime>(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                  )),
                                  formControlName: 'date',
                                  readOnly: true,
                                  onTap: (value) => picker.showPicker(),
                                  valueAccessor: DateTimeValueAccessor(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      onPressed: () => picker.showPicker(),
                                      icon: const Icon(Icons.calendar_month,
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
                          formControlName: 'time',
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
                  const SizedBox(height: 20),
                  const Text(
                    '送迎',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      IntrinsicWidth(
                        stepWidth: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('送迎'),
                            Row(
                              children: [
                                Expanded(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'Interpreter_or_guide',
                                    value: true,
                                    title: Text('同日'),
                                  ),
                                ),
                                Expanded(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'Interpreter_or_guide',
                                    value: false,
                                    title: Text('別日'),
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
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return Stack(
                              children: [
                                ReactiveTextField<DateTime>(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1),
                                  )),
                                  formControlName: 'date',
                                  readOnly: true,
                                  onTap: (value) => picker.showPicker(),
                                  valueAccessor: DateTimeValueAccessor(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      onPressed: () => picker.showPicker(),
                                      icon: const Icon(Icons.calendar_month,
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
                        stepWidth: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('種別'),
                            Row(
                              children: [
                                Expanded(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'Interpreter_or_guide',
                                    value: true,
                                    title: Text('専用車'),
                                  ),
                                ),
                                Expanded(
                                  child: ReactiveRadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    formControlName: 'Interpreter_or_guide',
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
                          formControlName: 'time',
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
                          formControlName: 'CarNumber',
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
            ),
          ),
        );
  }
}
