import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:feature_hospital/src/detail/tabs/treatment/section/telemedicine_menu_section.dart';
import 'package:feature_hospital/src/detail/tabs/treatment/section/treatmenu_sectiion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'treatment_model.dart';

class TreatmentSection extends StatefulWidget {
  const TreatmentSection({super.key, required this.hospitalId});
  final String hospitalId;
  @override
  State<TreatmentSection> createState() => _TreatmentSectionState();
}

class _TreatmentSectionState extends State<TreatmentSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ColumnSeparated(
        crossAxisAlignment: CrossAxisAlignment.start,
        separatorBuilder: (context, index) => SizedBox(
          height: context.appTheme.spacing.formSpacing,
        ),
        children: [
          TreatmentMenuSection(
            hospitalId: widget.hospitalId,
          ),
          const TelemedicineMenuSection(),
          ValueListenableListener(
            valueListenable: context.read<TreatmentModle>().submitTreatmentMenudata,
            onListen: () {
              final value = context.read<TreatmentModle>().submitTreatmentMenudata.value;

              if (value.hasError) {
                snackBarWidget(
                  message: '保存できませんでした。 もう一度試してください。',
                  backgroundColor: Colors.red,
                  prefixIcon: const Icon(Icons.error, color: Colors.white),
                );
              }

              if (value.hasData) {
                snackBarWidget(
                  message: '正常に保存されました',
                  prefixIcon:
                      const Icon(Icons.check_circle, color: Colors.white),
                );
              }
            },
            child: ValueListenableBuilder(
              valueListenable: context.watch<TreatmentModle>().submitTreatmentMenudata,
              builder: (context, value, child) {
                return Align(
                  alignment: Alignment.bottomRight,
                  child: ReactiveFormConsumer(
                    builder: (context, formGroup, child) {
                      return ElevatedButton(
                        onPressed: value.loading
                            ? null
                            : () {
                                context
                                    .read<TreatmentModle>()
                                    .submitTreatmentMenu(formGroup);
                              },
                        child: WithLoadingButton(
                          isLoading: value.loading,
                          child: const Text('印刷する'),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
