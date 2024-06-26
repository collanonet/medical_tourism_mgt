import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'application_risk_test_model.dart';

class ApplicationRiskTestScreen extends StatefulWidget {
  const ApplicationRiskTestScreen({super.key});

  @override
  State<ApplicationRiskTestScreen> createState() =>
      _ApplicationRiskTestScreenState();
}

//I18【患者】申込_リスク検査
class _ApplicationRiskTestScreenState extends State<ApplicationRiskTestScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('drugName') as FormArray;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Scrollbar(
            trackVisibility: true,
            thumbVisibility: true,
            child: SingleChildScrollView(
              primary: true,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "希望日",
                          style: context.textTheme.titleMedium,
                        ),
                        const SizedBox(width: 10),
                        boxRequired(enabled: true, label: "必須"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "第１希望",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    IntrinsicWidth(
                      stepWidth: 250,
                      child: ReactiveDatePicker<DateTime>(
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
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "第 2 希望",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    IntrinsicWidth(
                      stepWidth: 250,
                      child: ReactiveDatePicker<DateTime>(
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
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "第 3 希望",
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    IntrinsicWidth(
                      stepWidth: 250,
                      child: ReactiveDatePicker<DateTime>(
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
                    ),
                    const SizedBox(height: 8),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "noDate",
                        title: const Text("希望日なし"),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("備考"),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: "remark",
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
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
                        boxRequired(enabled: true, label: "必須"),
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
                            size: 40,
                            color: context.appTheme.primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: ReactiveTextField<int>(
                            formControlName: "people",
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
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
                            size: 40,
                            color: context.appTheme.primaryColor,
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
                        Text("歳")
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text("性別"),
                        const SizedBox(width: 10),
                        boxRequired(enabled: true, label: "必須"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: "sex",
                        builder: (context, value, _) {
                          return Row(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == true
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == true
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
                                    formGroup.control("sex").value = true;
                                  },
                                  child: Text("男性")),
                              SizedBox(width: 16),
                              ElevatedButton(
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
                      "希望するメニュー",
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu1",
                        title: const Text("CTC（血中循環がん細胞）検査"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu2",
                        title: const Text("遺伝子検査"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu3",
                        title: const Text(
                            "アミノインデックス（がんリスクスクリーニング(AICS)・生活習慣病リスクスクリーニング(AILS)）"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu4",
                        title: const Text("サリバチェッカー"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu5",
                        title: const Text("マイクロアレイ血液検査"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu6",
                        title: const Text("テロメアテスト"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu7",
                        title: const Text("LOX index(ロックス インデックス)"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu8",
                        title: const Text("Cologic（大腸がんリスク検査）"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu9",
                        title: const Text("ピロリ菌検査"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu10",
                        title: const Text("認知症検査"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu11",
                        title: const Text("有害金属・必須ミネラル検査"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu12",
                        title: const Text("睡眠時無呼吸症候群検査・治療"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "menu13",
                        title: const Text("メタトロン検査"),
                      ),
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
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == true
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == true
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
                                        true;
                                  },
                                  child: Text("あり")),
                              SizedBox(width: 16),
                              ElevatedButton(
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
                        const SizedBox(width: 10),
                        boxRequired(enabled: true, label: "必須"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    IntrinsicWidth(
                      child: ReactiveRadioListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        value: "notPregnant",
                        formControlName: "ifwoman",
                        title: const Text("妊娠していない"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveRadioListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        value: "bePregnant",
                        formControlName: "ifwoman",
                        title: const Text("妊娠している可能性がある"),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveRadioListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        value: "pregnant",
                        formControlName: "ifwoman",
                        title: const Text("妊娠している"),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
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
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == true
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == true
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
                                        true;
                                  },
                                  child: Text("あり")),
                              SizedBox(width: 16),
                              ElevatedButton(
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
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: value.value == true
                                        ? Colors.white
                                        : context.appTheme.primaryColor,
                                    backgroundColor: value.value == true
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
                                        .value = true;
                                  },
                                  child: Text("あり")),
                              SizedBox(width: 16),
                              ElevatedButton(
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
                                  formGroup.control("treatmentDetail1").value =
                                      false;
                                },
                                child: Text("なし"),
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
                      "服薬中の薬名、有効成分含有量、\n服用方法、服用量など",
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
                                  IntrinsicWidth(
                                    stepWidth: 250,
                                    child: ReactiveForm(
                                        formGroup: currenForm,
                                        child: ReactiveTextField(
                                          formControlName: "drug",
                                        )),
                                  ),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton.icon(
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
                          style:
                              TextStyle(color: context.appTheme.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: "privetcy",
                        title: Text(
                          "個人情報の取り扱いについて、プライバシーポリシーに同意します。",
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ValueListenableListener(
          valueListenable: context
              .read<ApplicationRiskTestModel>()
              .submitApplicationRiskTestResponse,
          onListen: () {
            final value = context
                .read<ApplicationRiskTestModel>()
                .submitApplicationRiskTestResponse
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
                prefixIcon: const Icon(Icons.check_circle, color: Colors.white),
              );
            }
          },
          child: ValueListenableBuilder(
              valueListenable: context
                  .read<ApplicationRiskTestModel>()
                  .submitApplicationRiskTestResponse,
              builder: (context, value, _) {
                return ReactiveFormConsumer(builder: (context, form, _) {
                  return ElevatedButton(
                    onPressed: !value.loading && form.valid
                        ? () {
                            context
                                .read<ApplicationRiskTestModel>()
                                .postApplicationRiskTesk(form);
                          }
                        : null,
                    child: WithLoadingButton(
                      isLoading: value.loading,
                      child: Text("保存する"),
                    ),
                  );
                });
              }),
        )
      ],
    );
  }
}
