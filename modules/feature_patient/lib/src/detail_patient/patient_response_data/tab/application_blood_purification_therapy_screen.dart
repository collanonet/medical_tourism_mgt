import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'application_blood_purification_therapy_model.dart';

class ApplicationBloodPurificationTherapyScreen extends StatefulWidget {
  const ApplicationBloodPurificationTherapyScreen({super.key});

  @override
  State<ApplicationBloodPurificationTherapyScreen> createState() =>
      _ApplicationBloodPurificationTherapyScreenState();
}

//I17【患者】申込_血液浄化療法(アフェレーシス)・透析
class _ApplicationBloodPurificationTherapyScreenState
    extends State<ApplicationBloodPurificationTherapyScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('drugName') as FormArray;
    return Consumer(
      builder: (context, model, _) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Text(
                          "委託目的",
                          style: context.textTheme.titleMedium,
                        ),
                        const SizedBox(width: 10),
                        boxRequired(
                          enabled: true,
                          label: "必須",
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ReactiveCheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            formControlName: 'purposeOfCommission1',
                            title: const Text("透析治療"),
                          ),
                        ),
                        Expanded(
                          child: ReactiveCheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            formControlName: 'purposeOfCommission2',
                            title: const Text("旅行透析"),
                          ),
                        )
                      ],
                    ),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'purposeOfCommission3',
                      title: const Text("疾患治療"),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ReactiveCheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            formControlName: 'purposeOfCommission4',
                            title: const Text("疾病予防"),
                          ),
                        ),
                        Expanded(
                          child: ReactiveCheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            formControlName: 'purposeOfCommission5',
                            title: const Text("再発予防"),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "希望日",
                          style: context.textTheme.titleMedium,
                        ),
                        const SizedBox(width: 10),
                        boxRequired(
                          enabled: true,
                          label: "必須",
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "第 1 希望",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveDatePicker<DateTime>(
                      formControlName: 'date1',
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      builder: (BuildContext context,
                          ReactiveDatePickerDelegate<dynamic> picker,
                          Widget? child) {
                        return Stack(
                          children: [
                            ReactiveTextField<DateTime>(
                              formControlName: 'date1',
                              readOnly: true,
                              onTap: (value) => picker.showPicker(),
                              valueAccessor: DateTimeValueAccessor(
                                dateTimeFormat: DateFormat('yyyy/MM/dd'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () => picker.showPicker(),
                                  icon: Icon(
                                    Icons.calendar_month,
                                    color: context.appTheme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "第 2 希望",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveDatePicker<DateTime>(
                      formControlName: 'date2',
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      builder: (BuildContext context,
                          ReactiveDatePickerDelegate<dynamic> picker,
                          Widget? child) {
                        return Stack(
                          children: [
                            ReactiveTextField<DateTime>(
                              formControlName: 'date2',
                              readOnly: true,
                              onTap: (value) => picker.showPicker(),
                              valueAccessor: DateTimeValueAccessor(
                                dateTimeFormat: DateFormat('yyyy/MM/dd'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () => picker.showPicker(),
                                  icon: Icon(
                                    Icons.calendar_month,
                                    color: context.appTheme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "第 3 希望",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveDatePicker<DateTime>(
                      formControlName: 'date3',
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      builder: (BuildContext context,
                          ReactiveDatePickerDelegate<dynamic> picker,
                          Widget? child) {
                        return Stack(
                          children: [
                            ReactiveTextField<DateTime>(
                              formControlName: 'date3',
                              readOnly: true,
                              onTap: (value) => picker.showPicker(),
                              valueAccessor: DateTimeValueAccessor(
                                dateTimeFormat: DateFormat('yyyy/MM/dd'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  onPressed: () => picker.showPicker(),
                                  icon: Icon(
                                    Icons.calendar_month,
                                    color: context.appTheme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: "noDate",
                      title: const Text("希望日なし"),
                    ),
                    const SizedBox(height: 8),
                    Text("備考"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "remarks",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      "その他の希望者",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "希望人数",
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 10),
                        boxRequired(
                          enabled: true,
                          label: "必須",
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            formGroup.control("people").value++;
                          },
                          icon: Icon(
                            Icons.add_box_rounded,
                            color: context.appTheme.primaryColor,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: ReactiveTextField<int>(
                            formControlName: "people",
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (formGroup.control("people").value > 0) {
                              formGroup.control("people").value--;
                            }
                          },
                          icon: Icon(
                            Icons.indeterminate_check_box_rounded,
                            color: context.appTheme.primaryColor,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text("年齢"),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          child: ReactiveTextField(
                            formControlName: "age",
                          ),
                        ),
                        SizedBox(width: 15),
                        Text("歳"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text("性別"),
                        const SizedBox(width: 10),
                        boxRequired(
                          enabled: true,
                          label: "必須",
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: "sex",
                        builder: (context, value, _) {
                          return Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: value.value == true
                                            ? Colors.white
                                            : context.appTheme.primaryColor,
                                        backgroundColor: value.value == true
                                            ? context.appTheme.primaryColor
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color:
                                                context.appTheme.primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        formGroup.control("sex").value = true;
                                      },
                                      child: Text("男性"))),
                              SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == false
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == false
                                        ? context.appTheme.primaryColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: context.appTheme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    formGroup.control("sex").value = false;
                                  },
                                  child: Text("女性"),
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 8),
                    Text("本人との関係"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "relationship",
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      "希望医療機関",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "希望する医療機関はありますか",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: "attend",
                        builder: (context, value, _) {
                          return Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: value.value == true
                                            ? Colors.white
                                            : context.appTheme.primaryColor,
                                        backgroundColor: value.value == true
                                            ? context.appTheme.primaryColor
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color:
                                                context.appTheme.primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        formGroup.control("attend").value =
                                            true;
                                      },
                                      child: Text("あり"))),
                              SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == false
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == false
                                        ? context.appTheme.primaryColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: context.appTheme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    formGroup.control("attend").value = false;
                                  },
                                  child: Text("なし"),
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 8),
                    Text("希望するエリア・医療機関名"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "desiredArea",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    Text("理由"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "reason",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      "希望するメニュー",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: "menu1",
                      title: const Text("DFPP"),
                    ),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: "menu2",
                      title: const Text("LDL"),
                    ),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: "menu3",
                      title: const Text("オゾン療法"),
                    ),
                    const SizedBox(height: 8),
                    Text("その他"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "others",
                    ),
                    const SizedBox(height: 8),
                    Text("現在気になっていること"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "concern",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      "質問",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "これまでに血液浄化療法(アフェレーシス)または透析を受けたことがありますか？",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: "question",
                        builder: (context, value, _) {
                          return Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: value.value == true
                                            ? Colors.white
                                            : context.appTheme.primaryColor,
                                        backgroundColor: value.value == true
                                            ? context.appTheme.primaryColor
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color:
                                                context.appTheme.primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        formGroup.control("question").value =
                                            true;
                                      },
                                      child: Text("あり"))),
                              SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == false
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == false
                                        ? context.appTheme.primaryColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: context.appTheme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    formGroup.control("question").value = false;
                                  },
                                  child: Text("なし"),
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 8),
                    Text(
                      "あると答えた方は、受けたことのあるメニューをすべて選んでください。",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: "item1",
                      title: const Text("DFPP"),
                    ),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: "item2",
                      title: const Text("LDL"),
                    ),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: "item3",
                      title: const Text("オゾン療法"),
                    ),
                    const SizedBox(height: 8),
                    Text("その他"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "others1",
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "どこで受けましたか？",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: "pleaceReceive1",
                      title: const Text("母国"),
                    ),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: "pleaceReceive2",
                      title: const Text("日本"),
                    ),
                    const SizedBox(height: 8),
                    Text("母国以外の外国"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "otherCountry",
                    ),
                    const SizedBox(height: 8),
                    Text("仲介会社・紹介者"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "introducer",
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      "がんについて",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "がんの既往歴",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: "historyCancer",
                        builder: (context, value, _) {
                          return Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: value.value == true
                                            ? Colors.white
                                            : context.appTheme.primaryColor,
                                        backgroundColor: value.value == true
                                            ? context.appTheme.primaryColor
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color:
                                                context.appTheme.primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        formGroup
                                            .control("historyCancer")
                                            .value = true;
                                      },
                                      child: Text("あり"))),
                              SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == false
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == false
                                        ? context.appTheme.primaryColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: context.appTheme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    formGroup.control("historyCancer").value =
                                        false;
                                  },
                                  child: Text("なし"),
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 8),
                    Text("がんの部位"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "cancerSite",
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      "女性の方のみご入力ください",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "妊娠について",
                          style: context.textTheme.bodyMedium,
                        ),
                        SizedBox(width: 10),
                        boxRequired(
                          enabled: true,
                          label: "必須",
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ReactiveRadioListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      value: "notPregnant",
                      formControlName: "ifwoman",
                      title: Text("妊娠していない"),
                    ),
                    ReactiveRadioListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      value: "bePregnant",
                      formControlName: "ifwoman",
                      title: Text("妊娠している可能性がある"),
                    ),
                    ReactiveRadioListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      value: "pregnant",
                      formControlName: "ifwoman",
                      title: Text("妊娠している"),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "既往歴",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "今までの健康状態、病気及び治療内容",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: "treatmentDetail",
                        builder: (context, value, _) {
                          return Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: value.value == true
                                            ? Colors.white
                                            : context.appTheme.primaryColor,
                                        backgroundColor: value.value == true
                                            ? context.appTheme.primaryColor
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color:
                                                context.appTheme.primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        formGroup
                                            .control("treatmentDetail")
                                            .value = true;
                                      },
                                      child: Text("あり"))),
                              SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == false
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == false
                                        ? context.appTheme.primaryColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: context.appTheme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    formGroup.control("treatmentDetail").value =
                                        false;
                                  },
                                  child: Text("なし"),
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 8),
                    Text("詳細"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "detail",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      "薬物アレルギー",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "今までの健康状態、病気及び治療内容",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: "treatmentDetail1",
                        builder: (context, value, _) {
                          return Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: value.value == true
                                            ? Colors.white
                                            : context.appTheme.primaryColor,
                                        backgroundColor: value.value == true
                                            ? context.appTheme.primaryColor
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color:
                                                context.appTheme.primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        formGroup
                                            .control("treatmentDetail1")
                                            .value = true;
                                      },
                                      child: Text("あり"))),
                              SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == false
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == false
                                        ? context.appTheme.primaryColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: context.appTheme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    formGroup
                                        .control("treatmentDetail1")
                                        .value = false;
                                  },
                                  child: Text("なし"),
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 8),
                    Text("詳細"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "detail1",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                          width: 45,
                          child: boxRequired(enabled: true, label: "必須"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "服薬中の薬名、有効成分含有量、\n 服用方法、服用量など",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveFormArray(
                      formArrayName: "drugName",
                      builder: (context, formArray, _) {
                        final row = formArray.controls
                            .map((control) => (control as FormGroup))
                            .map(
                              (currenForm) => Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "薬名",
                                    style: context.textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 8),
                                  ReactiveForm(
                                      formGroup: currenForm,
                                      child: ReactiveTextField(
                                        formControlName: "drug",
                                      )),
                                ],
                              ),
                            )
                            .toList();

                        return ColumnSeparated(
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 16,
                            );
                          },
                          children: row,
                        );
                      },
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        surfaceTintColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () {
                        formArray.add(
                          FormGroup({
                            'drug': FormControl<String>(),
                          }),
                        );
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.add_box_rounded,
                        color: context.appTheme.primaryColor,
                      ),
                      label: Text(
                        "薬名を追加",
                        style: TextStyle(color: context.appTheme.primaryColor),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      "提供可能なDICOM画像データ",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: "dicom",
                        builder: (context, value, _) {
                          return Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: value.value == true
                                            ? Colors.white
                                            : context.appTheme.primaryColor,
                                        backgroundColor: value.value == true
                                            ? context.appTheme.primaryColor
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color:
                                                context.appTheme.primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        formGroup.control("dicom").value = true;
                                      },
                                      child: Text("あり"))),
                              SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == false
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == false
                                        ? context.appTheme.primaryColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: context.appTheme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    formGroup.control("dicom").value = false;
                                  },
                                  child: Text("なし"),
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 8),
                    Text(
                      "その他検査データ（血液検査等）",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: "otherTestData",
                        builder: (context, value, _) {
                          return Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: value.value == true
                                            ? Colors.white
                                            : context.appTheme.primaryColor,
                                        backgroundColor: value.value == true
                                            ? context.appTheme.primaryColor
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: BorderSide(
                                            color:
                                                context.appTheme.primaryColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        formGroup
                                            .control("otherTestData")
                                            .value = true;
                                      },
                                      child: Text("あり"))),
                              SizedBox(width: 16),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == false
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == false
                                        ? context.appTheme.primaryColor
                                        : Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: context.appTheme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    formGroup.control("otherTestData").value =
                                        false;
                                  },
                                  child: Text("なし"),
                                ),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 8),
                    Text("詳細"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "detail2",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "DICOMデータは、発症時と最新のデータが\nそれぞれ必要です。",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: "privetcy",
                      title: Text(
                        "個人情報の取り扱いについて、\nプライバシーポリシーに同意します。",
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ValueListenableListener(
                        valueListenable: context
                            .read<ApplicationBloodPurificationTherapyModel>()
                            .submitApplicationBloodPurificationTherapyResponse,
                        onListen: () {
                          final value = context
                              .read<ApplicationBloodPurificationTherapyModel>()
                              .submitApplicationBloodPurificationTherapyResponse
                              .value;

                          if (value.hasError) {
                            snackBarWidget(
                              message: value.error,
                              prefixIcon: Icon(
                                Icons.error,
                                color: context.appTheme.errorColor,
                              ),
                            );
                          }

                          if (value.hasData) {
                            snackBarWidget(
                              message: '正常に保存されました',
                              prefixIcon: const Icon(Icons.check_circle,
                                  color: Colors.white),
                            );
                          }
                        },
                        child: ValueListenableBuilder(
                            valueListenable: context
                                .read<
                                    ApplicationBloodPurificationTherapyModel>()
                                .submitApplicationBloodPurificationTherapyResponse,
                            builder: (context, value, _) {
                              return ReactiveFormConsumer(
                                  builder: (context, form, _) {
                                return ElevatedButton(
                                  onPressed: !value.loading && form.valid
                                      ? () {
                                          // call function submit data for I4
                                          context
                                              .read<
                                                  ApplicationBloodPurificationTherapyModel>()
                                              .postApplicationBloodPurificationTherapy(
                                                  form);
                                        }
                                      : null,
                                  child: WithLoadingButton(
                                    isLoading: value.loading,
                                    child: Text("次へ"),
                                  ),
                                );
                              });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
