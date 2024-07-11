import 'package:core_l10n/l10n.dart';
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'contract_form.dart';
import 'contract_model.dart';
import 'contrant_file.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key, required this.id});
  final String id;
  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  filePicker().then((value) {
                    if (value != null) {
                      showCreateWithFileDialog(context, value);
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginExtraLarge,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    )),
                    border: Border.all(
                      color: context.appTheme.primaryColor,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.copy_all_rounded,
                        size: 50,
                        color: context.appTheme.primaryColor,
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Column(
                        children: [
                          Text(
                            '契約書をここにドラッグ＆ドロップ',
                            style: context.textTheme.bodySmall?.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              filePicker().then((value) {
                                if (value != null) {
                                  showCreateWithFileDialog(context, value);
                                }
                              });
                            },
                            child: const Text(
                              'またはファイルを選択する',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              const Row(
                children: [
                  Expanded(flex: 2, child: Text('書類名')),
                  Expanded(child: Text('締結日')),
                ],
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              ValueListenableBuilder(
                  valueListenable: context.read<ContractModel>().contrantData,
                  builder: (context, value, _) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: value.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                      value.requireData[index].fileName ?? ''),
                                ),
                                Expanded(
                                  child: Text(value
                                              .requireData[index].updatedAt ==
                                          null
                                      ? ''
                                      : Dates.formShortDate(
                                          value.requireData[index].updatedAt)),
                                ),
                              ],
                            ),
                          );
                        }, separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            color: Colors.grey,
                          );
                      },
                      ),
                    );
                  })
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
              onPressed: () {},
              child: Text('削除する'),
            ),
            SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('印刷する'),
            )
          ],
        )
      ],
    );
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<ContractModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: <String, ValidationMessageFunction>{
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
            child: ReactiveFormBuilder(
              form: () => contractForm(agentRecordId: widget.id, file: file)
                ..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const Popup();
              },
            ),
          ),
        ),
      ),
    );
  }
}
