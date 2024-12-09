import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'contract_template_detail_model.dart';

class ContractForm extends StatelessWidget {
  const ContractForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = ReactiveForm.of(context) as FormGroup;
    return ColumnSeparated(
      separatorBuilder: (context, index) => SizedBox(
        height: context.appTheme.spacing.marginMedium,
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReactiveValueListenableBuilder<FileSelect>(
              formControlName: 'file',
              builder: (context, control, child) {
                var logoFile = control.value;
                return InkWell(
                  onTap: () {
                    filePicker().then((value) {
                      formGroup.control('file').value = value;
                    });
                  },
                  child: Container(
                    width: 250,
                    height: 250,
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
                    child: logoFile != null && logoFile.file != null
                        ? Image.memory(
                            logoFile.file!,
                            fit: BoxFit.fill,
                          )
                        : logoFile != null && logoFile.url != null
                            ? Avatar.network(
                                logoFile.url,
                                placeholder: const AssetImage(
                                  Images.logoMadical,
                                  package: 'core_ui',
                                ),
                                shape: BoxShape.rectangle,
                                customSize: const Size(200, 380),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.copy_all_rounded,
                                    size: 50,
                                    color: context.appTheme.primaryColor,
                                  ),
                                  SizedBox(
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  Text(
                                    'ロゴをアップロードする',
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        context.appTheme.spacing.marginMedium,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      filePicker().then(
                                        (value) {
                                          formGroup.control('file').value =
                                              value;
                                        },
                                      );
                                    },
                                    child: const Text(
                                      '画像を選択',
                                    ),
                                  )
                                ],
                              ),
                  ),
                );
              },
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          // height: 280,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16),
          child: ColumnSeparated(
            separatorBuilder: (context, index) => SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('基本情報', style: context.textTheme.titleMedium),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('バージョン'),
                      IntrinsicWidth(
                        stepWidth: 300,
                        child: ReactiveTextField(
                          formControlName: 'version',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('書類名'),
                      IntrinsicWidth(
                        stepWidth: 500,
                        child: ReactiveTextField(
                          formControlName: 'documentName',
                        ),
                      )
                    ],
                  )
                ],
              ),
              RowSeparated(
                separatorBuilder: (context, index) =>
                    SizedBox(width: context.appTheme.spacing.marginMedium),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('甲'),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ValueListenableBuilder(
                          valueListenable:
                              context.read<ContractTemplateModel>().listA,
                          builder: (context, value, _) {
                            return ReactiveDropdownFormField(
                              formControlName: 'first',
                              items: value
                                  .map((e) => DropdownMenuItem(
                                        value: e.item,
                                        child: Text(
                                          e.item,
                                        ),
                                      ))
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('乙'),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ValueListenableBuilder(
                          valueListenable:
                              context.read<ContractTemplateModel>().listB,
                          builder: (context, value, _) {
                            return ReactiveDropdownFormField(
                              formControlName: 'second',
                              items: value
                                  .map((e) => DropdownMenuItem(
                                        value: e.item,
                                        child: Text(
                                          e.item,
                                        ),
                                      ))
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('丙'),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ValueListenableBuilder(
                          valueListenable:
                              context.read<ContractTemplateModel>().listC,
                          builder: (context, value, _) {
                            return ReactiveDropdownFormField(
                              formControlName: 'c',
                              items: value
                                  .map((e) => DropdownMenuItem(
                                        value: e.item,
                                        child: Text(
                                          e.item,
                                        ),
                                      ))
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('締結方法'),
                      IntrinsicWidth(
                        stepWidth: 200,
                        child: ValueListenableBuilder(
                          valueListenable: context
                              .read<ContractTemplateModel>()
                              .listFasteningMethod,
                          builder: (context, value, _) {
                            return ReactiveDropdownFormField(
                              formControlName: 'methodOfConclusion',
                              items: value
                                  .map((e) => DropdownMenuItem(
                                        value: e.item,
                                        child: Text(
                                          e.item,
                                        ),
                                      ))
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              RowSeparated(
                separatorBuilder: (context, index) => SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('病院の場合の契約先'),
                      Row(
                        children: [
                          IntrinsicWidth(
                            child: ReactiveRadioListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              value: 'MS法人',
                              formControlName:
                                  'contractPartnerInCaseOfHospital',
                              title: const Text('MS法人'),
                            ),
                          ),
                          const SizedBox(width: 20),
                          IntrinsicWidth(
                            child: ReactiveRadioListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              value: 'その他のMS法人',
                              formControlName:
                                  'contractPartnerInCaseOfHospital',
                              title: const Text('その他のMS法人'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text('運用'),
                      IntrinsicWidth(
                        child: ReactiveCheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          formControlName: 'user',
                          title: const Text('このデータをシステム上で運用する'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('更新する'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('新規登録'),
            )
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('書類内容'),
          ],
        ),
      ],
    );
  }
}
