import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class PatientResponseScreen extends StatefulWidget {
  const PatientResponseScreen({super.key});

  @override
  State<PatientResponseScreen> createState() => _PatientResponseScreenState();
}

class _PatientResponseScreenState extends State<PatientResponseScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('委託目的', style: context.textTheme.titleMedium),
          SizedBox(height: context.appTheme.spacing.marginMedium),
          Row(
            children: [
              SizedBox(
                width: 150,
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
                    Text('治療'),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              SizedBox(
                width: 150,
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
                    Text('来日治療'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 150,
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              SizedBox(
                width: 150,
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
                    Text('セカンドオピニオン'),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              SizedBox(
                width: 150,
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
                    Text('精密検査'),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              SizedBox(
                width: 150,
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
                    Text('健診'),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              SizedBox(
                width: 150,
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
                    Text('再生医療'),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              SizedBox(
                width: 150,
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
                    Text('幹細胞療法'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 150,
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              SizedBox(
                width: 150,
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
                    Text('免疫細胞療法'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 150,
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              SizedBox(
                width: 150,
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
                    Text('その他'),
                  ],
                ),
              ),
            ],
          ),
          Divider(),
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
              Text('血液浄化療法(アフェレーシス)・透析'),
            ],
          ),
          Divider(),
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
              Text('リスク検査'),
            ],
          ),
          Divider(),
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
              Text('美容'),
            ],
          ),
          Divider(),
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
              Text('その他'),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              SizedBox(
                width: 150,
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), isDense: true)),
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('母国の医療機関の病状資料（入退院記録等）'),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  AnimatedToggleSwitch<String>.size(
                    textDirection: TextDirection.rtl,
                    current: 'あり',
                    values: const ['あり', 'なし'],
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
                  )
                ],
              ),
              SizedBox(
                width: context.appTheme.spacing.marginExtraLarge,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('提供可能なDICOM画像データ'),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  AnimatedToggleSwitch<String>.size(
                    textDirection: TextDirection.rtl,
                    current: 'あり',
                    values: const ['あり', 'なし'],
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
                  )
                ],
              ),
              SizedBox(
                width: context.appTheme.spacing.marginExtraLarge,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('その他検査データ（血液検査等）'),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  AnimatedToggleSwitch<String>.size(
                    textDirection: TextDirection.rtl,
                    current: 'あり',
                    values: const ['あり', 'なし'],
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
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('詳細'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              hintText: '''例）PET-CT 　2023年10月撮影
例）CT 　2023年10月撮影
例）MRI 　2023年10月撮影''',
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('母国の医療機関での診断名'),
          TextFormField(
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              hintText: '胃がん',
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('病状説明'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              hintText:
                  '''例如（記入例）：2001年心肌梗塞、当时在ｘｘ医院做了扩张血管的手，后来好转后在家疗养、○月○日开始有胸闷气促。''',
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('発症の経緯'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
              hintText: '''例）会社の健康診断で要検査となり、CTを取ったら病気が発覚しました。''',
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('現在行っている治療'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
        ],
      ),
    );
  }
}
