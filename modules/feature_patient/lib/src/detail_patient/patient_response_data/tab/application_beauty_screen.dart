import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:intl/intl.dart';

import 'application_beauty_model.dart';

class ApplicationBeautyScreen extends StatefulWidget {
  const ApplicationBeautyScreen({super.key});

  @override
  State<ApplicationBeautyScreen> createState() =>
      _ApplicationBeautyScreenState();
}

//I16【患者】申込_美容
class _ApplicationBeautyScreenState extends State<ApplicationBeautyScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return Consumer<AuthModel>(
      builder: (context, model, _) {
        return Scaffold(
          body: SingleChildScrollView(
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
                      boxRequired(enabled: true, label: "必須")
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "第１希望",
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                          )
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "第​ 2 希望",
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                          )
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "第 3 希望",
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                          )
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "desiredDate",
                    title: Text("希望日なし"),
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
                      Text("希望人数"),
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
                          size: 35,
                          color: context.appTheme.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 100,
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
                          size: 35,
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
                        width: 100,
                        child: ReactiveTextField(
                          formControlName: "age",
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text("歳")
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text("性別"),
                      const SizedBox(width: 10),
                      boxRequired(enabled: true, label: "必須")
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
                                  child: Text("女性"))),
                        ],
                      );
                    },
                  ),
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
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                        color: context.appTheme.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    formGroup.control("attend").value = true;
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
                                  child: Text("なし"))),
                        ],
                      );
                    },
                  ),
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
                  const SizedBox(height: 16),
                  Text(
                    "希望するメニュー",
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "顔",
                    style: context.textTheme.bodyMedium,
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "faceMenu1",
                    onChanged: (control) {},
                    title: const Text("二重整形・目元整形"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "faceMenu2",
                    onChanged: (control) {},
                    title: const Text("目元のクマ・しわ・たるみ取り"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "faceMenu3",
                    onChanged: (control) {},
                    title: const Text("鼻の整形"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "faceMenu4",
                    onChanged: (control) {},
                    title: const Text("口元・ガミースマイル・たらこ唇"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "faceMenu5",
                    onChanged: (control) {},
                    title: const Text("小顔・顔のたるみ・フェイスライン・リフトアップ"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "faceMenu6",
                    onChanged: (control) {},
                    title: const Text("ヒアルロン酸注射"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "faceMenu7",
                    onChanged: (control) {},
                    title: const Text("ボトックス注射"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "faceMenu8",
                    onChanged: (control) {},
                    title: const Text("脂肪注入"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "faceMenu9",
                    onChanged: (control) {},
                    title: const Text("若返り・エイジングケア"),
                  ),
                  const Text("その他"),
                  const SizedBox(height: 8),
                  ReactiveTextField(
                    formControlName: "others",
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "ボディ",
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "bodyMenu1",
                    onChanged: (control) {},
                    title: const Text("豊胸・バストアップ"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "bodyMenu2",
                    onChanged: (control) {},
                    title: const Text("婦人科形成"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "bodyMenu3",
                    onChanged: (control) {},
                    title: const Text("痩身・ダイエット・脂肪溶解注射"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "bodyMenu4",
                    onChanged: (control) {},
                    title: const Text("脂肪吸引"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "bodyMenu5",
                    onChanged: (control) {},
                    title: const Text("ヒップ"),
                  ),
                  Text("その他"),
                  const SizedBox(height: 8),
                  ReactiveTextField(
                    formControlName: "others1",
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "肌",
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "skinMenu1",
                    onChanged: (control) {},
                    title: const Text("内服薬・外用薬"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "skinMenu2",
                    onChanged: (control) {},
                    title: const Text("ヒップ"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "skinMenu3",
                    onChanged: (control) {},
                    title: const Text("スキンケア（美白・しみ・肝斑）"),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "脱毛",
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "hairRemovalMeun1",
                    onChanged: (control) {},
                    title: const Text("全身脱毛（顔・VIO・首・おなじ除く）"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "hairRemovalMeun2",
                    onChanged: (control) {},
                    title: const Text("VIO脱毛"),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "その他",
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "otherMenu1",
                    onChanged: (control) {},
                    title: const Text("女性の薄毛治療（FAGA）"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "otherMenu2",
                    onChanged: (control) {},
                    title: const Text("ピアス穴開け・耳・へその整形"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "otherMenu3",
                    onChanged: (control) {},
                    title: const Text("多汗症・わきが治療"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "otherMenu4",
                    onChanged: (control) {},
                    title: const Text("ほくろ除去・いぼ治療"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "otherMenu5",
                    onChanged: (control) {},
                    title: const Text("ケロイド・タトゥー"),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "メンズ",
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "menMenu1",
                    onChanged: (control) {},
                    title: const Text("AGA"),
                  ),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "menMenu2",
                    onChanged: (control) {},
                    title: const Text("ED治療"),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "他院修正",
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  ReactiveCheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    formControlName: "otherHospital",
                    onChanged: (control) {},
                    title: const Text("セカンドオピニオン"),
                  ),
                  const SizedBox(height: 8),
                  Text("その他"),
                  const SizedBox(height: 8),
                  ReactiveTextField(
                    formControlName: "others2",
                  ),
                  const SizedBox(height: 8),
                  Text("現在気になっていること"),
                  const SizedBox(height: 8),
                  ReactiveTextField(
                    formControlName: "concerne",
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8),
                  Text("仲介会社・紹介者"),
                  const SizedBox(height: 8),
                  ReactiveTextField(
                    formControlName: "brokerageCompany",
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveCheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          formControlName: 'privetcy',
                          onChanged: (value) {},
                          title: Text(
                            '個人情報の取り扱いについて、\nプライバシーポリシーに同意します。',
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ValueListenableListener(
                      valueListenable: context
                          .read<ApplicationBeautyModel>()
                          .submitApplicationBeautyData,
                      onListen: () {
                        final value = context
                            .read<ApplicationBeautyModel>()
                            .submitApplicationBeautyData
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
                              .read<ApplicationBeautyModel>()
                              .submitApplicationBeautyData,
                          builder: (context, value, _) {
                            return ReactiveFormConsumer(
                                builder: (context, form, _) {
                              return ElevatedButton(
                                onPressed: !value.loading && form.valid
                                    ? () {
                                        // call function submit data for I4
                                        context
                                            .read<ApplicationBeautyModel>()
                                            .postApplicationBeauty(form);
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
        );
      },
    );
  }
}
