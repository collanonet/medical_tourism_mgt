import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../basic_info_model.dart';

class MedicalRecordUserAccountSection extends StatelessWidget {
  const MedicalRecordUserAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('Patient_account') as FormGroup;
    return ValueListenableBuilder(
        valueListenable: context.read<BasicInformationModel>().userAccount,
        builder: (context, value, _) => Skeletonizer(
              enabled: value.loading,
              child: Container(
                padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    ),
                  ),
                  color: const Color(0xffEDF1F4),
                ),
                child: ReactiveForm(
                  formGroup: formGroup,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('患者マイページ'),
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'loginId',
                              decoration: InputDecoration(
                                label: Text('ログインID'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          Expanded(
                            child: ReactiveTextField(
                              formControlName: 'loginPassword',
                              obscureText: true,
                              decoration: InputDecoration(
                                label: Text('ログインPW'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.appTheme.spacing.marginMedium,
                          ),
                          AnimatedToggleSwitch<String>.size(
                              textDirection: TextDirection.rtl,
                              current: 'OPEN',
                              values: const ['CLOSE', 'OPEN'],
                              iconList: [
                                Text('CLOSE'),
                                Text('OPEN'),
                              ],
                              indicatorSize: const Size.fromWidth(100),
                              borderWidth: 4.0,
                              iconAnimationType: AnimationType.onHover,
                              style: ToggleStyle(
                                borderColor: Colors.transparent,
                                borderRadius: BorderRadius.circular(10.0),
                                backgroundColor: Colors.white,
                                indicatorColor: Colors.white,
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
                                    indicatorColor:
                                        context.appTheme.primaryColor,
                                    backgroundColor: Colors.white,
                                  ),
                              onChanged: (i) {}),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
