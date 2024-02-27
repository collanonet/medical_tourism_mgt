import 'package:core_l10n/l10n.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'basic_information_form.dart';
import 'basic_information_model.dart';
import 'basic_information_screen.dart';

class AgentBasicInformationPage extends StatelessWidget {
  const AgentBasicInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
      },
      child: ReactiveFormBuilder(
        form: () => formBasicInformation()..markAllAsTouched(),
        builder: (context, formGroup, child) {
          return Provider(
            create: (context) => GetIt.I<AgentBasicInformationModel>(),
            child: ColumnSeparated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10);
              },
              children: [
                const Expanded(child: AgentBasicInformationScreen()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('保存する'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
