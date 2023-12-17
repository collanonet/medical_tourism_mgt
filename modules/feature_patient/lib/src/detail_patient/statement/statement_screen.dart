import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class StatementScreen extends StatefulWidget {
  const StatementScreen({super.key});

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(color: Colors.grey),
                ),
                checkColor: Colors.white,
                value: false,
                onChanged: (value) {},
              ),
              Expanded(
                  child: Text(
                '書類番号',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '種別',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '宛先',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '発行日',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  flex: 2,
                  child: Text(
                    '件名',
                    style: context.textTheme.bodySmall,
                  )),
              Expanded(
                  child: Text(
                'エージェントへ開示',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '患者へ開示',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '実績反映',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: SizedBox(
                width: context.appTheme.spacing.marginMedium,
              )),
            ],
          ),
          const Divider(),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.grey),
                      ),
                      checkColor: Colors.white,
                      value: false,
                      onChanged: (value) {},
                    ),
                    Expanded(
                        child: Text(
                      '19Y−0630−1',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                context.appTheme.spacing.marginExtraSmall,
                            vertical: context.appTheme.spacing.marginExtraSmall,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(
                                context.appTheme.spacing.borderRadiusMedium),
                          ),
                          child: Text(
                            '見積書',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Text(
                      '大瀚人力资源集团',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        child: Text(
                      '2023/07/18',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          '劉 偉強 様　呼吸器疾患の受診（京大病院）',
                          style: context.textTheme.bodySmall,
                        )),
                    Expanded(
                        child: Text(
                      '○',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        child: Text(
                      '×',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                        child: Text(
                      'ー',
                      style: context.textTheme.bodySmall,
                    )),
                    Expanded(
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('請求書を発行する'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                thickness: 0.5,
              );
            },
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  '削除する',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'CSV出力',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'コピーして新規作成',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '新規作成',
                ),
              )
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '売上実績データへコピー',
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginMedium,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium),
            ),
            child: ReactiveForm(
              formGroup: formGroup.control('title_estimate') as FormGroup,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('タイトル'),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'title',
                          decoration: InputDecoration(
                            label: Text(
                              '件名',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: context.appTheme.spacing.marginMedium,
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
                          formControlName: 'quotation_number',
                          decoration: InputDecoration(
                            label: Text(
                              '見積番号',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'issue_date',
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'issue_date',
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
                                label: Text(
                                  '発行日',
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
                          child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('開示先'),
                              Row(
                                children: [
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: BorderSide(color: Colors.grey),
                                    ),
                                    checkColor: Colors.white,
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                  Text('エージェント'),
                                  Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      side: BorderSide(color: Colors.grey),
                                    ),
                                    checkColor: Colors.white,
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                  Text('患者'),
                                ],
                              )
                            ],
                          )
                        ],
                      )),
                    ],
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveDatePicker<DateTime>(
                          formControlName: 'payment_due_date',
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          builder: (BuildContext context,
                              ReactiveDatePickerDelegate<dynamic> picker,
                              Widget? child) {
                            return ReactiveTextField<DateTime>(
                              formControlName: 'payment_due_date',
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
                                label: Text(
                                  'お支払い期限',
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
                        child: ReactiveTextField(
                          formControlName: 'payment_terms',
                          decoration: InputDecoration(
                            label: Text(
                              'お支払い条件',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'contact_person',
                          decoration: InputDecoration(
                            label: Text(
                              '担当者',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'prospective',
                          decoration: InputDecoration(
                            label: Text(
                              '見込み',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginMedium,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('エージェント'),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                ReactiveForm(
                  formGroup: formGroup.control('agent') as FormGroup,
                  child: Row(
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'agent_company_name',
                          decoration: InputDecoration(
                            label: Text(
                              '企業',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'full_name_kanji',
                          decoration: InputDecoration(
                            label: Text(
                              '氏名（漢字）',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'name_kana',
                          decoration: InputDecoration(
                            label: Text(
                              '氏名（カナ）',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                Text('紹介者'),
                SizedBox(
                  height: context.appTheme.spacing.marginMedium,
                ),
                ReactiveForm(
                  formGroup: formGroup.control('introducer') as FormGroup,
                  child: Row(
                    children: [
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'introducer_company_name',
                          decoration: InputDecoration(
                            label: Text(
                              '企業',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'full_name_kanji',
                          decoration: InputDecoration(
                            label: Text(
                              '氏名（漢字）',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Expanded(
                        child: ReactiveTextField(
                          formControlName: 'name_kana',
                          decoration: InputDecoration(
                            label: Text(
                              '氏名（カナ）',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ElevatedButton(onPressed: () {}, child: Text('プレビュー'))],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginSmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              )),
              color: context.appTheme.primaryColor.withOpacity(0.1),
              border: Border.all(
                color: context.appTheme.primaryColor,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '預かり金（治療費）',
                    style: context.textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(flex: 2, child: Text('日本円（税込）')),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '1,820,000円',
                          style: context.textTheme.titleLarge,
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginSmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              )),
              color: context.appTheme.primaryColor.withOpacity(0.1),
              border: Border.all(
                color: context.appTheme.primaryColor,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '精算金（診療報酬明細書）',
                    style: context.textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(flex: 2, child: Text('日本円（税込）')),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '1,700,830円',
                          style: context.textTheme.titleLarge,
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginSmall,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              )),
              color: Colors.yellow.withOpacity(0.1),
              border: Border.all(
                color: Colors.yellow,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '残金',
                    style: context.textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(flex: 2, child: Text('日本円（税込）')),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '119,170円',
                          style: context.textTheme.titleLarge,
                        ))),
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Radio(
                value: 0,
                groupValue: 1,
                onChanged: (value) {},
              ),
              Text('治療費概算'),
              Radio(
                value: 1,
                groupValue: 1,
                onChanged: (value) {},
              ),
              Text('治療費'),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginMedium,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    )),
                    border: Border.all(
                      color: context.appTheme.primaryColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      ReactiveFormArray(
                        formArrayName: 'treatment_cost',
                        builder: (context, formArray, child) {
                          final rows = formArray.controls
                              .map((control) => control as FormGroup)
                              .map(
                                (currentForm) => ReactiveForm(
                                  formGroup: currentForm,
                                  child: Row(
                                    children: [
                                      Text(
                                          '${formArray.controls.indexOf(currentForm) + 1}'),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ReactiveTextField(
                                          formControlName: 'item',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '項目',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ReactiveTextField(
                                                formControlName: 'quantity',
                                                decoration: InputDecoration(
                                                  label: Text(
                                                    '数量',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '式',
                                              style:
                                                  context.textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'unit_price',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '単価',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'amount',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '金額',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'cost',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '原価',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'profit',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '利益',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Icon(
                                        Icons.remove_circle_outline_rounded,
                                        color: context.appTheme.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              );

                          return ColumnSeparated(
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            children: rows.toList(),
                          );
                        },
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: context.appTheme.primaryColor,
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginSmall,
                          ),
                          Text(
                            '行を追加',
                            style:
                                TextStyle(color: context.appTheme.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(
                                context.appTheme.spacing.marginSmall,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                  context.appTheme.spacing.borderRadiusMedium,
                                )),
                                color: context.appTheme.primaryColor
                                    .withOpacity(0.1),
                                border: Border.all(
                                  color: context.appTheme.primaryColor,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Spacer(),
                                  Text('小計'),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  SizedBox(
                                    height: 20,
                                    child: VerticalDivider(
                                      thickness: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Text(
                                    '1,655,300円',
                                    style: context.textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.arrow_back_ios_new_rounded,
                color: context.appTheme.primaryColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    ReactiveForm(
                      formGroup: formGroup.control('search_treatment_cost')
                          as FormGroup,
                      child: Row(
                        children: [
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'search_hospital_name',
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    Container(
                      padding: EdgeInsets.all(
                        context.appTheme.spacing.marginMedium,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(
                          context.appTheme.spacing.borderRadiusMedium,
                        )),
                        border: Border.all(
                          color: context.appTheme.primaryColor,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(child: Text('項目')),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: Center(child: Text('単価')),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('免疫活性化血管内治療　1回コース'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('1,000,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('免疫活性化血管内治療　3回コース'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('2,500,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('活性化リンパ球療法（キラーT細胞）'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('400,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('MSC‐CM（エクソソーム）動脈直注投与'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('605,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('仲介手数料20%'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('各項目×20％を控除'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('サービス費', style: context.textTheme.titleMedium),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginMedium,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    )),
                    border: Border.all(
                      color: context.appTheme.primaryColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      ReactiveFormArray(
                        formArrayName: 'service_fee',
                        builder: (context, formArray, child) {
                          final rows = formArray.controls
                              .map((control) => control as FormGroup)
                              .map(
                                (currentForm) => ReactiveForm(
                                  formGroup: currentForm,
                                  child: Row(
                                    children: [
                                      Text(
                                          '${formArray.controls.indexOf(currentForm) + 1}'),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ReactiveTextField(
                                          formControlName: 'item',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '項目',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: ReactiveTextField(
                                                formControlName: 'quantity',
                                                decoration: InputDecoration(
                                                  label: Text(
                                                    '数量',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '式',
                                              style:
                                                  context.textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'unit_price',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '単価',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'amount',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '金額',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'cost',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '原価',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControlName: 'profit',
                                          decoration: InputDecoration(
                                            label: Text(
                                              '利益',
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      ),
                                      Icon(
                                        Icons.remove_circle_outline_rounded,
                                        color: context.appTheme.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              );

                          return ColumnSeparated(
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            children: rows.toList(),
                          );
                        },
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: context.appTheme.primaryColor,
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginSmall,
                          ),
                          Text(
                            '行を追加',
                            style:
                                TextStyle(color: context.appTheme.primaryColor),
                          )
                        ],
                      ),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(
                                context.appTheme.spacing.marginSmall,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                  context.appTheme.spacing.borderRadiusMedium,
                                )),
                                color: context.appTheme.primaryColor
                                    .withOpacity(0.1),
                                border: Border.all(
                                  color: context.appTheme.primaryColor,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Spacer(),
                                  Text('小計'),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  SizedBox(
                                    height: 20,
                                    child: VerticalDivider(
                                      thickness: 0.5,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Text(
                                    '1,655,300円',
                                    style: context.textTheme.titleLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.arrow_back_ios_new_rounded,
                color: context.appTheme.primaryColor,
              ),
              Expanded(
                child: Column(
                  children: [
                    ReactiveForm(
                      formGroup:
                          formGroup.control('search_service_fee') as FormGroup,
                      child: Row(
                        children: [
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'search_hospital_name',
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    Container(
                      padding: EdgeInsets.all(
                        context.appTheme.spacing.marginMedium,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(
                          context.appTheme.spacing.borderRadiusMedium,
                        )),
                        border: Border.all(
                          color: context.appTheme.primaryColor,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(child: Text('項目')),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              Expanded(
                                child: Center(child: Text('単価')),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('1-A 医療機関マッチング・来日前折衝費用'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('100,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('1-A 医療機関マッチング・来日前折衝費用'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('100,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('1-A 医療機関マッチング・来日前折衝費用'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('100,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('1-A 医療機関マッチング・来日前折衝費用'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('100,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('1-A 医療機関マッチング・来日前折衝費用'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('100,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('1-A 医療機関マッチング・来日前折衝費用'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('100,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('1-A 医療機関マッチング・来日前折衝費用'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('100,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('1-A 医療機関マッチング・来日前折衝費用'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('100,000'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                context.appTheme.spacing.borderRadiusMedium,
                              )),
                              color: Colors.white,
                              border: Border.all(
                                color: context.appTheme.primaryColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text('1-A 医療機関マッチング・来日前折衝費用'),
                                ),
                                SizedBox(
                                  width: context.appTheme.spacing.marginMedium,
                                ),
                                Expanded(
                                  child: Text('100,000'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginSmall,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    )),
                    color: context.appTheme.primaryColor.withOpacity(0.1),
                    border: Border.all(
                      color: context.appTheme.primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(),
                      Text('計'),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          thickness: 0.5,
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Text(
                        '1,655,300円',
                        style: context.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginExtraSmall,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginSmall,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    )),
                    color: context.appTheme.primaryColor.withOpacity(0.1),
                    border: Border.all(
                      color: context.appTheme.primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(),
                      Text('消費税'),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          thickness: 0.5,
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Text(
                        '1655,300円',
                        style: context.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginExtraSmall,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginSmall,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    )),
                    color: context.appTheme.primaryColor.withOpacity(0.1),
                    border: Border.all(
                      color: context.appTheme.primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(),
                      Text('合計'),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          thickness: 0.5,
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Text(
                        '335,000円',
                        style: context.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: SizedBox(
                  width: context.appTheme.spacing.marginMedium,
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
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginSmall,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    )),
                    color: context.appTheme.primaryColor.withOpacity(0.1),
                    border: Border.all(
                      color: context.appTheme.primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(),
                      Text('利益'),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      SizedBox(
                        height: 20,
                        child: VerticalDivider(
                          thickness: 0.5,
                        ),
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Text(
                        '335,000円',
                        style: context.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('備考', style: context.textTheme.titleMedium),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Expanded(
                child: ReactiveTextField(
                  maxLines: 15,
                  minLines: 1,
                  formControlName: 'memo',
                  decoration: InputDecoration(
                    label: Text('メモ'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
