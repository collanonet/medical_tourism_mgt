import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'basic_info_model.dart';
import 'basic_info_section.dart';

class BasicInformationScreen extends StatelessWidget {
  const BasicInformationScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer<BasicInformationModel>(
      builder: (context, model, child) => Column(
        children: [
          const Expanded(
            child: BasicInfoSection(),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ReactiveFormConsumer(
                builder: (context, form, _) {
                  return model.loading  ? const CircularProgressIndicator() : ElevatedButton(
                    onPressed:
                        form.valid ? () => model.createUpdateAll(form) : null,
                    child: const Text(
                      '保存する', // TODO: l10n 対応 (保存する) (save)
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
