import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'filter_chat_form.dart';
import 'chat_model.dart';

class ChatFilter extends StatelessWidget {
  const ChatFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatModel>(
      builder: (context, model, child) {
        return ReactiveFormConfig(
          validationMessages: validationMessagesFilterPatient(context),
          child: ReactiveFormBuilder(
            form: () => formFilterChat(),
            builder: (context, formGroup, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'チャット',
                    style: context.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '患者名/メッセージ',
                    style: context.textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginExtraSmall,
                  ),
                  ReactiveTextField(
                    formControlName: 'patientNameMessage',
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
