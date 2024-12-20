// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'application_regenerative_medicine_model.dart';

class ApplicationRegenerativeMedicalScreen extends StatefulWidget {
  const ApplicationRegenerativeMedicalScreen({super.key});

  @override
  State<ApplicationRegenerativeMedicalScreen> createState() =>
      _ApplicationRegenerativeMedicalScreenState();
}

//I14【患者】申込_再生医療
class _ApplicationRegenerativeMedicalScreenState
    extends State<ApplicationRegenerativeMedicalScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('nameOfTheDrug') as FormArray;

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
                          '委託目的',
                          style: context.textTheme.labelLarge,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        boxRequired(label: '必須', enabled: true),
                      ],
                    ),
                    Row(
                      children: [
                        IntrinsicWidth(
                          child: ReactiveCheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            formControlName: 'diseasePrevention',
                            onChanged: (value) {},
                            title: const Text('疾病予防'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        IntrinsicWidth(
                          child: ReactiveCheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            formControlName: 'relapsePrevention',
                            onChanged: (value) {},
                            title: const Text('再発予防'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'antiAging',
                      title: const Text('アンチエイジング'),
                    )),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'beauty',
                      title: const Text('美容'),
                    )),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'increaseImmunity',
                      title: const Text('免疫力アップ'),
                    )),
                    Row(
                      children: [
                        Text(
                          '希望日',
                          style: context.textTheme.labelLarge,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        boxRequired(label: '必須', enabled: true),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Text(
                    //   '第１希望',
                    //   style: context.textTheme.bodyMedium,
                    // ),
                    const SizedBox(height: 8),
                    const IntrinsicWidth(
                      stepWidth: 250,
                      child: ReactiveDatePickerField(
                        formControlName: 'date1',
                        label: '第１希望',

                      ),
                    ),
                    const SizedBox(height: 8),
                    // Text(
                    //   '第 2 希望',
                    //   style: context.textTheme.bodyMedium,
                    // ),
                    const SizedBox(height: 8),
                    const IntrinsicWidth(
                      stepWidth: 250,
                      child: ReactiveDatePickerField(
                        formControlName: 'date2',
                        label: '第 2 希望',
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Text(
                    //   '第 3 希望',
                    //   style: context.textTheme.bodyMedium,
                    // ),
                    const SizedBox(height: 8),
                    const IntrinsicWidth(
                      stepWidth: 250,
                      child: ReactiveDatePickerField(
                        formControlName: 'date3',
                        label: '第 3 希望',
                      ),
                    ),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'noDesiredDate',
                      title: const Text('希望日なし'),
                    )),
                    const SizedBox(height: 8),
                    const Text('備考'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'remarks',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      'その他の希望者',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '希望人数',
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        boxRequired(label: '必須', enabled: true),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            formGroup.control('people').value++;
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
                            formControlName: 'people',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (formGroup.control('people').value > 0) {
                              formGroup.control('people').value--;
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
                    const Text('年齢'),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: ReactiveTextField(
                            formControlName: 'age',
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Text('歳')
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text('性別'),
                        const SizedBox(
                          width: 10,
                        ),
                        boxRequired(label: '必須', enabled: true),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: 'sex',
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
                                    formGroup.control('sex').value = true;
                                  },
                                  child: const Text('男性')),
                              const SizedBox(width: 16),
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
                                  formGroup.control('sex').value = false;
                                },
                                child: const Text('女性'),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 8),
                    const Text('本人との関係'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'relationship',
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      '希望医療機関',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '希望する医療機関はありますか',
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: 'atten',
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
                                    formGroup.control('atten').value = true;
                                  },
                                  child: const Text('あり')),
                              const SizedBox(width: 16),
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
                                  formGroup.control('atten').value = false;
                                },
                                child: const Text('なし'),
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 8),
                    const Text('希望するエリア・医療機関名'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'desiredArea',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    const Text('理由'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'reason',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      '希望するメニュー',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Text('幹細胞療法（移植）'),
                    const SizedBox(height: 8),
                    buttonInfo(formGroup, 'stemCellTherapy'),
                    const SizedBox(height: 8),
                    const Text('幹細胞療法（上清液）'),
                    const SizedBox(height: 8),
                    buttonInfo(formGroup, 'stemCellTherapy1'),
                    const SizedBox(height: 8),
                    const Text('免疫細胞療法'),
                    const SizedBox(height: 8),
                    buttonInfo(formGroup, 'stemCellTherapy2'),
                    const SizedBox(height: 8),
                    const Text('自由入力'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'freeInput',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    const Text('線維芽細胞療法'),
                    const SizedBox(height: 8),
                    buttonInfo(formGroup, 'fibroblastTherapy'),
                    const SizedBox(height: 8),
                    const Text('PRP療法'),
                    const SizedBox(height: 8),
                    buttonInfo(formGroup, 'prpTherapy'),
                    const SizedBox(height: 8),
                    const Text('その他'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'others',
                    ),
                    const SizedBox(height: 8),
                    const Text('現在気になっていること'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'currentlyConcerned',
                      maxLines: 3,
                    ),
                    Text(
                      '質問',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'これまでに再生医療を受けたことが \nありますか？',
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                        formControlName: 'medicine',
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
                                    formGroup.control('medicine').value = true;
                                  },
                                  child: const Text('はい')),
                              const SizedBox(width: 16),
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
                                    formGroup.control('medicine').value = false;
                                  },
                                  child: const Text('いいえ')),
                            ],
                          );
                        }),

                    // buttonInfo(formGroup, "medicine"),
                    const SizedBox(height: 8),
                    Text(
                      'あると答えた方は、受けたことのあるメニューをすべて選んでください。',
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'item1',
                      title: const Text('幹細胞療法（移植）'),
                    )),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'item2',
                      title: const Text('幹細胞療法（上清液'),
                    )),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'item3',
                      title: const Text('免疫細胞療法'),
                    )),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'item4',
                      title: const Text('線維芽細胞療法'),
                    )),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'item5',
                      title: const Text('PRP療法'),
                    )),
                    const SizedBox(height: 8),
                    const Text('その他'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'others',
                    ),
                    const SizedBox(height: 8),
                    const Text('どこで受けましたか？'),
                    const SizedBox(height: 8),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'receive1',
                      title: const Text('母国'),
                    )),
                    IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      formControlName: 'receive2',
                      title: const Text('日本'),
                    )),
                    const SizedBox(height: 8),
                    const Text('母国以外の外国'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'countryOther',
                    ),
                    const SizedBox(height: 8),
                    const Text('仲介会社・紹介者'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'brokerageCompany',
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      'がんについて',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'がんの既往歴',
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveValueListenableBuilder(
                      formControlName: 'historyCancer',
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
                                  formGroup.control('historyCancer').value =
                                      true;
                                },
                                child: const Text('あり')),
                            const SizedBox(width: 16),
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
                                formGroup.control('historyCancer').value =
                                    false;
                              },
                              child: const Text('なし'),
                            ),
                          ],
                        );
                      },
                    ),
                    //   buttonInfo(formGroup, 'historyCancer'),
                    const SizedBox(height: 8),
                    const Text('がんの部位'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'cancerSite',
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      '女性の方のみご入力ください',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '妊娠について',
                          style: context.textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 10),
                        boxRequired(label: '必須', enabled: true),
                      ],
                    ),
                    IntrinsicWidth(
                      child: ReactiveRadioListTile(
                        formControlName: 'readio',
                        value: 'option1',
                        title: const Text('妊娠していない'),
                        onChanged: (control) {},
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveRadioListTile(
                        formControlName: 'readio',
                        value: 'option2',
                        title: const Text('妊娠している可能性がある'),
                      ),
                    ),
                    IntrinsicWidth(
                      child: ReactiveRadioListTile(
                        formControlName: 'readio',
                        value: 'option3',
                        title: const Text('妊娠している'),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      '既往歴',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '今までの健康状態、病気及び治療内容',
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    buttonInfo(formGroup, 'currentHealth'),
                    const SizedBox(height: 8),
                    const Text('詳細'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'detail',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      '薬物アレルギー',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Text('今までの健康状態、病気及び治療内容'),
                    const SizedBox(height: 8),
                    buttonInfo(formGroup, 'currentHealth1'),
                    const SizedBox(height: 8),
                    const Text('詳細'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'detail1',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    Text(
                      '服薬中の薬名、有効成分含有量、\n服用方法、服用量など',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ReactiveFormArray(
                      formArrayName: 'nameOfTheDrug',
                      builder: (context, formArray, _) {
                        final row = formArray.controls
                            .map((control) => (control as FormGroup))
                            .map(
                              (currenForm) => Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text('薬名'),
                                  const SizedBox(height: 8),
                                  IntrinsicWidth(
                                    child: ReactiveForm(
                                        formGroup: currenForm,
                                        child: ReactiveTextField(
                                          formControlName: 'nameDrug',
                                        )),
                                  ),
                                ],
                              ),
                            )
                            .toList();

                        return ColumnSeparated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
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
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          foregroundColor: Colors.transparent,
                          shadowColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          surfaceTintColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          formArray.add(
                            FormGroup({
                              'nameDrug': FormControl<String>(),
                            }),
                          );
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.add_box_rounded,
                          color: context.appTheme.primaryColor,
                        ),
                        label: Text(
                          '薬名を追加',
                          style:
                              TextStyle(color: context.appTheme.primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '母国の医療機関の病状資料（入退院記録等）',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    buttonInfo(formGroup, 'medicalInformation'),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '提供可能なDICOM画像データ',
                          style: context.textTheme.titleMedium,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.question_mark_rounded,
                              size: 35,
                              color: context.appTheme.primaryColor,
                            )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    buttonInfo(formGroup, 'dicomImage'),
                    const SizedBox(height: 8),
                    Text(
                      'その他検査データ（血液検査等）',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    buttonInfo(formGroup, 'otherTest'),
                    const SizedBox(height: 8),
                    const Text('詳細'),
                    const SizedBox(height: 8),
                    ReactiveTextField(
                      formControlName: 'detail2',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'DICOMデータは、発症時と最新のデータがそれぞれ必要です。',
                      style: context.textTheme.bodyMedium,
                    ),
                    IntrinsicWidth(
                      child: ReactiveCheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        formControlName: 'privetcy',
                        onChanged: (value) {},
                        title: Text(
                          '個人情報の取り扱いについて、プライバシーポリシーに同意します。',
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
              .read<ApplicationRegenerativeMedicalModel>()
              .submitApplicationRegenerativeMedical,
          onListen: () {
            final value = context
                .read<ApplicationRegenerativeMedicalModel>()
                .submitApplicationRegenerativeMedical
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
                  .read<ApplicationRegenerativeMedicalModel>()
                  .submitApplicationRegenerativeMedical,
              builder: (context, value, _) {
                return ReactiveFormConsumer(builder: (context, form, _) {
                  return ElevatedButton(
                    onPressed: !value.loading && form.valid
                        ? () {
                            context
                                .read<ApplicationRegenerativeMedicalModel>()
                                .postApplicationRegenerativeMedical(form);
                          }
                        : null,
                    child: WithLoadingButton(
                      isLoading: value.loading,
                      child: const Text('保存する'),
                    ),
                  );
                });
              }),
        ),
      ],
    );
  }

  Widget buttonInfo(FormGroup formGroup, String control) {
    return ReactiveValueListenableBuilder(
      formControlName: control,
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
                  formGroup.control(control).value = true;
                },
                child: const Text('希望する')),
            const SizedBox(width: 16),
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
                  formGroup.control(control).value = false;
                },
                child: const Text('希望しない')),
          ],
        );
      },
    );
  }
}
