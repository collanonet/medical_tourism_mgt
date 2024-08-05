import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../feature_report.dart';
import '../feature_report.gm.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          padding: const EdgeInsets.all(16),
          child: Text('マスタトップ'),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      context.router.push(ContractRoute());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xffF0F3F5),
                      ),
                      padding: const EdgeInsets.all(40),
                      child: Row(
                        children: [
                          Icon(
                            Icons.note_alt,
                            color: context.appTheme.primaryColor,
                          ),
                          Text(
                            '契約書ひな形',
                            style: TextStyle(
                              color: context.appTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      context.router.push(ReportsRoute());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xffF0F3F5),
                      ),
                      padding: const EdgeInsets.all(40),
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: context.appTheme.primaryColor,
                          ),
                          Text(
                            'マスタ',
                            style: TextStyle(
                              color: context.appTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
