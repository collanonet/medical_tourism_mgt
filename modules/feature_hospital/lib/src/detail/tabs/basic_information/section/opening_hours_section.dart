import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OpeningHoursSection extends StatefulWidget {
  const OpeningHoursSection({super.key});

  @override
  State<OpeningHoursSection> createState() => _OpeningHoursSectionState();
}

class _OpeningHoursSectionState extends State<OpeningHoursSection> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(
          context.appTheme.spacing.borderRadiusMedium,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    '診療時間',
                    style: TextStyle(
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: boxText(
                  context,
                  '月',
                  textColor: Colors.white,
                  bg: context.appTheme.primaryColor,
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: boxText(
                  context,
                  '火',
                  textColor: Colors.white,
                  bg: context.appTheme.primaryColor,
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: boxText(
                  context,
                  '水',
                  textColor: Colors.white,
                  bg: context.appTheme.primaryColor,
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: boxText(
                  context,
                  '木',
                  textColor: Colors.white,
                  bg: context.appTheme.primaryColor,
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: boxText(
                  context,
                  '金',
                  textColor: Colors.white,
                  bg: context.appTheme.primaryColor,
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: boxText(
                  context,
                  '土',
                  textColor: Colors.white,
                  bg: context.appTheme.primaryColor,
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Expanded(
                child: boxText(
                  context,
                  '日',
                  textColor: Colors.white,
                  bg: context.appTheme.primaryColor,
                ),
              ),
              const Expanded(
                flex: 7,
                child: SizedBox(),
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
                child: ReactiveTextField(
                  formControlName: 'shift1',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift1Mon',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift1Tue',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift1Wed',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift1Thu',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift1Fri',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift1Sat',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift1Sun',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 7,
                child: SizedBox(),
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
                child: ReactiveTextField(
                  formControlName: 'shift2',
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift2Mon',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift2Tue',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift2Wed',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift2Thu',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift2Fri',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift2Sat',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'shift2Sun',
                  items: [
                    DropdownMenuItem(
                      value: '×',
                      child: Text('×'),
                    ),
                    DropdownMenuItem(
                      value: '○',
                      child: Text('○'),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 7,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

boxText(BuildContext context, String text,
        {Color? bg, Color? borderC, Color? textColor, Function()? onTap}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
        decoration: BoxDecoration(
          color: bg,
          border: Border.all(
            color: borderC ?? bg ?? Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
              context.appTheme.spacing.borderRadiusMedium),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor ?? Colors.black),
          ),
        ),
      ),
    );
