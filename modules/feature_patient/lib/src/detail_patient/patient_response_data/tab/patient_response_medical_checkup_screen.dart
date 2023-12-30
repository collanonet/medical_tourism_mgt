import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PatientResponseMedicalCheckupScreen extends StatefulWidget {
  const PatientResponseMedicalCheckupScreen({super.key});

  @override
  State<PatientResponseMedicalCheckupScreen> createState() =>
      _PatientResponseMedicalCheckupScreenState();
}

class _PatientResponseMedicalCheckupScreenState
    extends State<PatientResponseMedicalCheckupScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'その他の健診希望者',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: context.appTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ))),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              SizedBox(
                width: 300,
                child: ReactiveTextField(
                  formControlName: 'number_people',
                  decoration: InputDecoration(
                    hintText: '健診希望人数',
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: context.appTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ))),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 300,
                child: ReactiveTextField(
                  formControlName: 'age',
                  decoration: InputDecoration(
                    hintText: '年齢',
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              Text(
                '歳',
                style: context.textTheme.bodyMedium,
              )
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            '性別',
            style: context.textTheme.bodyMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: '男性',
            values: const ['女性', '男性'],
            iconList: [
              Text('女性'),
              Text('男性'),
            ],
            indicatorSize: const Size.fromWidth(100),
            borderWidth: 4.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            styleBuilder: (i) => ToggleStyle(
              indicatorColor: context.appTheme.primaryColor,
              backgroundColor: Colors.white,
            ),
            onChanged: (i) => setState(() {}),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          SizedBox(
            width: 300,
            child: ReactiveTextField(
              formControlName: 'relationship',
              decoration: InputDecoration(
                hintText: '本人との関係',
              ),
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Divider(
            color: context.appTheme.primaryColor,
            thickness: 2,
            height: 0,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('希望医療機関', style: context.textTheme.titleMedium),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('希望する医療機関はありますか', style: context.textTheme.titleMedium),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: 'あり',
            values: const ['なし', 'あり'],
            iconList: [
              Text('なし'),
              Text('あり'),
            ],
            indicatorSize: const Size.fromWidth(100),
            borderWidth: 4.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            styleBuilder: (i) => ToggleStyle(
              indicatorColor: context.appTheme.primaryColor,
              backgroundColor: Colors.white,
            ),
            onChanged: (i) => setState(() {}),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Expanded(
                child: ReactiveTextField(
                  formControlName: 'disease',
                  maxLines: 3,
                  minLines: 2,
                  decoration: InputDecoration(
                    hintText: '希望するエリア・医療機関名',
                  ),
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
                  formControlName: 'reason',
                  maxLines: 3,
                  minLines: 2,
                  decoration: InputDecoration(
                    hintText: '理由',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('希望するメニュー', style: context.textTheme.titleMedium),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('PET-CT'),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  AnimatedToggleSwitch<String>.size(
                    textDirection: TextDirection.rtl,
                    current: '希望する',
                    values: const ['希望しない', '希望する'],
                    iconList: [
                      Text('希望しない'),
                      Text('希望する'),
                    ],
                    indicatorSize: const Size.fromWidth(100),
                    borderWidth: 4.0,
                    iconAnimationType: AnimationType.onHover,
                    style: ToggleStyle(
                      borderColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                    ),
                    styleBuilder: (i) => ToggleStyle(
                      indicatorColor: context.appTheme.primaryColor,
                      backgroundColor: Colors.white,
                    ),
                    onChanged: (i) => setState(() {}),
                  ),
                ],
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('MRI'),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  AnimatedToggleSwitch<String>.size(
                    textDirection: TextDirection.rtl,
                    current: '希望する',
                    values: const ['希望しない', '希望する'],
                    iconList: [
                      Text('希望しない'),
                      Text('希望する'),
                    ],
                    indicatorSize: const Size.fromWidth(100),
                    borderWidth: 4.0,
                    iconAnimationType: AnimationType.onHover,
                    style: ToggleStyle(
                      borderColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                    ),
                    styleBuilder: (i) => ToggleStyle(
                      indicatorColor: context.appTheme.primaryColor,
                      backgroundColor: Colors.white,
                    ),
                    onChanged: (i) => setState(() {}),
                  ),
                ],
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('胃カメラ'),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  AnimatedToggleSwitch<String>.size(
                    textDirection: TextDirection.rtl,
                    current: '希望する',
                    values: const ['希望しない', '希望する'],
                    iconList: [
                      Text('希望しない'),
                      Text('希望する'),
                    ],
                    indicatorSize: const Size.fromWidth(100),
                    borderWidth: 4.0,
                    iconAnimationType: AnimationType.onHover,
                    style: ToggleStyle(
                      borderColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                    ),
                    styleBuilder: (i) => ToggleStyle(
                      indicatorColor: context.appTheme.primaryColor,
                      backgroundColor: Colors.white,
                    ),
                    onChanged: (i) => setState(() {}),
                  ),
                ],
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
                  formControlName: 'Free_input',
                  maxLines: 3,
                  minLines: 2,
                  decoration: InputDecoration(
                    hintText: '自由入力',
                  ),
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
                  formControlName: 'concerned',
                  maxLines: 3,
                  minLines: 2,
                  decoration: InputDecoration(
                    hintText: '現在気になっていること',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          SizedBox(
            width: 300,
            child: ReactiveTextField(
              formControlName: 'introducer',
              decoration: InputDecoration(
                hintText: '仲介会社・紹介者',
              ),
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('がんについて', style: context.textTheme.titleMedium),
          Text('がんの既往歴'),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: 'あり',
            values: const ['なし', 'あり'],
            iconList: [
              Text('なし'),
              Text('あり'),
            ],
            indicatorSize: const Size.fromWidth(100),
            borderWidth: 4.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            styleBuilder: (i) => ToggleStyle(
              indicatorColor: context.appTheme.primaryColor,
              backgroundColor: Colors.white,
            ),
            onChanged: (i) => setState(() {}),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          SizedBox(
            width: 300,
            child: ReactiveTextField(
              formControlName: 'cancer_site',
              decoration: InputDecoration(
                hintText: 'がんの部位',
              ),
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('糖尿病について', style: context.textTheme.titleMedium),
          Text('現在糖尿病'),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: 'あり',
            values: const ['なし', 'あり'],
            iconList: [
              Text('なし'),
              Text('あり'),
            ],
            indicatorSize: const Size.fromWidth(100),
            borderWidth: 4.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            styleBuilder: (i) => ToggleStyle(
              indicatorColor: context.appTheme.primaryColor,
              backgroundColor: Colors.white,
            ),
            onChanged: (i) => setState(() {}),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('糖尿病服薬'),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: 'あり',
            values: const ['なし', 'あり'],
            iconList: [
              Text('なし'),
              Text('あり'),
            ],
            indicatorSize: const Size.fromWidth(100),
            borderWidth: 4.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            styleBuilder: (i) => ToggleStyle(
              indicatorColor: context.appTheme.primaryColor,
              backgroundColor: Colors.white,
            ),
            onChanged: (i) => setState(() {}),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('空腹時血糖'),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 200,
                child: ReactiveTextField(
                  formControlName: 'fasting_blood_sugar',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              Text(
                'mg/dL',
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              SizedBox(
                width: 200,
                child: ReactiveTextField(
                  formControlName: 'fasting_blood_sugar_mmol',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              Text(
                'mmol/L',
                style: context.textTheme.bodyMedium,
              )
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            'インプラント',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: 'あり',
            values: const ['なし', 'あり'],
            iconList: [
              Text('なし'),
              Text('あり'),
            ],
            indicatorSize: const Size.fromWidth(100),
            borderWidth: 4.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            styleBuilder: (i) => ToggleStyle(
              indicatorColor: context.appTheme.primaryColor,
              backgroundColor: Colors.white,
            ),
            onChanged: (i) => setState(() {}),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('インプラントをした時期'),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 200,
                child: ReactiveTextField(
                  formControlName: 'implant_date_year',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              Text(
                '年',
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              SizedBox(
                width: 200,
                child: ReactiveTextField(
                  formControlName: 'implant_date_day',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginExtraSmall,
              ),
              Text(
                '月頃',
                style: context.textTheme.bodyMedium,
              )
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            '体内金属/刺青（tatooo）',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: 'あり',
            values: const ['なし', 'あり'],
            iconList: [
              Text('なし'),
              Text('あり'),
            ],
            indicatorSize: const Size.fromWidth(100),
            borderWidth: 4.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            styleBuilder: (i) => ToggleStyle(
              indicatorColor: context.appTheme.primaryColor,
              backgroundColor: Colors.white,
            ),
            onChanged: (i) => setState(() {}),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            '体内金属後に/刺青後にMRI受診したことが',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: 'あり',
            values: const ['なし', 'あり'],
            iconList: [
              Text('なし'),
              Text('あり'),
            ],
            indicatorSize: const Size.fromWidth(100),
            borderWidth: 4.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            styleBuilder: (i) => ToggleStyle(
              indicatorColor: context.appTheme.primaryColor,
              backgroundColor: Colors.white,
            ),
            onChanged: (i) => setState(() {}),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          SizedBox(
            width: 300,
            child: ReactiveTextField(
              formControlName: 'Part_material',
              decoration: InputDecoration(
                hintText: '部位とその材質',
              ),
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            '閉所恐怖症',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: 'あり',
            values: const ['なし', 'あり'],
            iconList: [
              Text('なし'),
              Text('あり'),
            ],
            indicatorSize: const Size.fromWidth(100),
            borderWidth: 4.0,
            iconAnimationType: AnimationType.onHover,
            style: ToggleStyle(
              borderColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1.5),
                ),
              ],
            ),
            styleBuilder: (i) => ToggleStyle(
              indicatorColor: context.appTheme.primaryColor,
              backgroundColor: Colors.white,
            ),
            onChanged: (i) => setState(() {}),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
        ],
      ),
    );
  }
}
