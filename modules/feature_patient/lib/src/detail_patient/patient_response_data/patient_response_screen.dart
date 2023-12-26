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
                child:
                    TextFormField(decoration: InputDecoration(isDense: true)),
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
                    iconList: [
                      Text('あり'),
                      Text('なし'),
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
                    iconList: [
                      Text('あり'),
                      Text('なし'),
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
                    iconList: [
                      Text('あり'),
                      Text('なし'),
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
              isDense: true,
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            '服薬中の薬名、有効成分含有量、服用方法、服用量など',
            style: context.textTheme.titleLarge,
          ),
          Text(
            '薬名',
            style: context.textTheme.bodySmall,
          ),
          TextFormField(
            decoration: InputDecoration(isDense: true, hintText: 'メルカゾール'),
          ),
          Text(
            '薬名',
            style: context.textTheme.bodySmall,
          ),
          TextFormField(
            decoration: InputDecoration(isDense: true, hintText: 'メルカゾール'),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add_circle,
                  color: context.appTheme.primaryColor,
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginSmall,
                ),
                Text(
                  '薬名を追加',
                  style: TextStyle(color: context.appTheme.primaryColor),
                ) // TODO: l10n 対応 (病院を追加) (addHospital)
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('既往歴', style: context.textTheme.titleMedium),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('今までの健康状態、病気及び治療内容', style: context.textTheme.bodySmall),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              AnimatedToggleSwitch<String>.size(
                textDirection: TextDirection.rtl,
                current: 'あり',
                values: const ['あり', 'なし'],
                iconList: [
                  Text('あり'),
                  Text('なし'),
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
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('詳細'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(isDense: true, hintText: '詳細を入力'),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('家族歴'),
          Text('詳細'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration:
                InputDecoration(isDense: true, hintText: '例）父が脳梗塞で70歳で他界'),
          ),
          Text('薬物アレルギー', style: context.textTheme.titleMedium),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('今までの健康状態、病気及び治療内容', style: context.textTheme.bodySmall),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              AnimatedToggleSwitch<String>.size(
                textDirection: TextDirection.rtl,
                current: 'あり',
                values: const ['あり', 'なし'],
                iconList: [
                  Text('あり'),
                  Text('なし'),
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
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('詳細'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(isDense: true, hintText: '詳細を入力'),
          ),
          Text('治療費について', style: context.textTheme.titleMedium),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('予算（自国の通貨でご入力ください）'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(isDense: true, hintText: '例）30,0000元'),
          ),
          Text('希望医療機関', style: context.textTheme.titleMedium),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('希望する医療機関はありますか', style: context.textTheme.bodySmall),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              AnimatedToggleSwitch<String>.size(
                textDirection: TextDirection.rtl,
                current: 'あり',
                values: const ['あり', 'なし'],
                iconList: [
                  Text('あり'),
                  Text('なし'),
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
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('希望するエリア・医療機関名'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(
                isDense: true, hintText: '例）大阪近郊の病院を希望します。りんくうクリニックを希望します。'),
          ),
          Text('理由'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(
                isDense: true,
                hintText: '例）りんくうクリニックは、〇〇の治療で有名で、関空から近いため希望します。'),
          ),
          Text(
            '受診希望日',
            style: context.textTheme.bodySmall,
          ),
          TextFormField(
            decoration: InputDecoration(
                isDense: true, hintText: '2024/03/05（自由テキスト入力可）'),
          ),
          Text('日本滞在予定期間'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(
                isDense: true, hintText: '''例）2024/03/05〜2024/03/10まで
                治療期間に合わせて滞在可能。
                3/13までには必ず帰国したいです。'''),
          ),
          Text('現在の体調状況', style: context.textTheme.titleMedium),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('歩行', style: context.textTheme.bodySmall),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              AnimatedToggleSwitch<String>.size(
                textDirection: TextDirection.rtl,
                current: '独立',
                values: const ['独立', '要支援'],
                iconList: [
                  Text('独立'),
                  Text('要支援'),
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
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('詳細'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(isDense: true, hintText: '詳細を入力'),
          ),
          Text('座り', style: context.textTheme.bodySmall),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              AnimatedToggleSwitch<String>.size(
                textDirection: TextDirection.rtl,
                current: '独立',
                values: const ['独立', '要支援'],
                iconList: [
                  Text('独立'),
                  Text('要支援'),
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
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('詳細'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(isDense: true, hintText: '詳細を入力'),
          ),
          Text('食事', style: context.textTheme.bodySmall),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              AnimatedToggleSwitch<String>.size(
                textDirection: TextDirection.rtl,
                current: '独立',
                values: const ['独立', '要支援'],
                iconList: [
                  Text('独立'),
                  Text('要支援'),
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
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('詳細'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(isDense: true, hintText: '詳細を入力'),
          ),
          Text('排泄', style: context.textTheme.bodySmall),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              AnimatedToggleSwitch<String>.size(
                textDirection: TextDirection.rtl,
                current: '独立',
                values: const ['独立', '要支援'],
                iconList: [
                  Text('独立'),
                  Text('要支援'),
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
            height: context.appTheme.spacing.marginMedium,
          ),
          Text('詳細'),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(isDense: true, hintText: '詳細を入力'),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginExtraLarge,
          ),
          Text('女性の方のみご入力ください', style: context.textTheme.titleLarge),
          Text('妊娠について', style: context.textTheme.titleLarge),
          Row(
            children: [
              Checkbox(value: true, onChanged: (value) {}),
              Text('妊娠していない')
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text('妊娠している可能性がある')
            ],
          ),
          Row(
            children: [
              Checkbox(value: false, onChanged: (value) {}),
              Text('妊娠している')
            ],
          )
        ],
      ),
    );
  }
}
