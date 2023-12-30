import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PatientResponseOtherScreen extends StatefulWidget {
  const PatientResponseOtherScreen({super.key});

  @override
  State<PatientResponseOtherScreen> createState() =>
      _PatientResponseOtherScreenState();
}

class _PatientResponseOtherScreenState
    extends State<PatientResponseOtherScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '本人',
            style: context.textTheme.titleLarge,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            '有効なビザをもっていますか？',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: 'はい',
            values: const ['いいえ', 'はい'],
            iconList: [
              Text('いいえ'),
              Text('はい'),
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
            'どんなビザを取得予定ですか',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          SizedBox(
            width: 300,
            child: ReactiveTextField(
              formControlName: 'visa',
              decoration: InputDecoration(
                hintText: 'ビザ',
              ),
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  value: true,
                  onChanged: (value) {}),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Text(
                '医療ビザ取得のための身元保証書を希望する',
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            '診療データ　その他の方法で提出',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          SizedBox(
            width: 300,
            child: ReactiveTextField(
              formControlName: 'remarks',
              decoration: InputDecoration(
                hintText: '備考',
              ),
            ),
          ),
          Divider(),
          Text(
            '同行者',
            style: context.textTheme.titleLarge,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Text(
            '有効なビザをもっていますか？',
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          AnimatedToggleSwitch<String>.size(
            textDirection: TextDirection.rtl,
            current: 'はい',
            values: const ['いいえ', 'はい'],
            iconList: [
              Text('いいえ'),
              Text('はい'),
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
            'どんなビザを取得予定ですか',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          SizedBox(
            width: 300,
            child: ReactiveTextField(
              formControlName: 'companion_visa',
              decoration: InputDecoration(
                hintText: 'ビザ',
              ),
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  value: true,
                  onChanged: (value) {}),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Text(
                '医療ビザ取得のための身元保証書を希望する',
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
