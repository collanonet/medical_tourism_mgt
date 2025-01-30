// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import 'g_and_a_model.dart';
import 'section/g_and_a_list_section.dart';
import 'section/q_and_a_new_registration_section.dart';

class QAndASection extends StatefulWidget {
  const QAndASection({super.key});

  @override
  State<QAndASection> createState() => _QAndASectionState();
}

class _QAndASectionState extends State<QAndASection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable:
            context.watch<QAndAModel>().newRegistrationHospitalData,
        builder: (context, value, _) {
          return ValueListenableBuilder(
            valueListenable: context.watch<QAndAModel>().editData,
            builder: (context, editData, _) {
              return Skeletonizer(
                enabled: value.loading || editData.loading,
                child: ColumnSeparated(
                  separatorBuilder: ((context, index) => SizedBox(
                        height: context.appTheme.spacing.formSpacing,
                      )),
                  children: [
                    const QAndANewRegistrationSection(),
                    if (!editData.hasData) const QAndAListSection()
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
