// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'contract_template_detail_file.dart';
import 'contract_template_detail_form.dart';
import 'contract_template_detail_model.dart';
import 'document_content.dart';

class ContractDetailScreen extends StatefulWidget {
  const ContractDetailScreen({super.key});

  @override
  State<ContractDetailScreen> createState() => _ContractDetailScreenState();
}

class _ContractDetailScreenState extends State<ContractDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(
            context.appTheme.spacing.marginMedium,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              ),
              color: Colors.white),
          child: RowSeparated(
            separatorBuilder: (context, index) => SizedBox(
              width: context.appTheme.spacing.marginSmall,
            ),
            children: [
              Container(
                padding: EdgeInsets.all(
                  context.appTheme.spacing.marginMedium,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      context.appTheme.spacing.borderRadiusMedium,
                    ),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    color: Colors.grey.withOpacity(0.1)),
                child: Icon(
                  Icons.edit_document,
                  color: context.appTheme.primaryColor,
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '【患者直接の契約書】医療ツーリズムコーディネート契約書・約款',
                    style: context.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  boxRequired(enabled: true, label: '電子契約'),
                ],
              ),
              const Spacer(),
              const Text('甲'),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: () {},
                child: const Text('自社'),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              const Text('乙'),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 206, 195, 95)),
                ),
                onPressed: () {},
                child: const Text('患者'),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(16),
            child: ColumnSeparated(
              separatorBuilder: (context, index) =>
                  SizedBox(height: context.appTheme.spacing.marginMedium),
              children: [
                const Row(
                  children: [
                    SizedBox(width: 50),
                    Expanded(
                      flex: 1,
                      child: Text('バージョン'),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('更新日'),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text('件名'),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('運用'),
                    ),
                  ],
                ),
                const Divider(color: Colors.grey, height: 1),
                Expanded(
                  child: SingleChildScrollView(
                    child: ColumnSeparated(
                      separatorBuilder: (context, index) => SizedBox(
                          height: context.appTheme.spacing.marginMedium),
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: ColumnSeparated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: context.appTheme.spacing.marginMedium,
                            ),
                            children: [
                              ColumnSeparated(
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(height: 16);
                                },
                                children: List.generate(
                                  2,
                                  (index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: index.isEven
                                            ? context.appTheme.primaryColor
                                                .withOpacity(0.1)
                                            : Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: RowSeparated(
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(width: 16);
                                        },
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              '001',
                                              style:
                                                  context.textTheme.bodySmall,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '2023/07/18',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              '【患者直接の契約書】医療ツーリズムコーディネート契約書・約款',
                                              style:
                                                  context.textTheme.bodyMedium,
                                            ),
                                          ),
                                          boxRequired(
                                              enabled: true, label: '運用中'),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
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
                              //image: DecorationImage(image: NetworkImage(data!.uploadFile.toString()))
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
                                      'パンフレットや資料をここにドラッグ＆ドロップ',
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
                                        filePicker().then((value) {
                                          if (value != null) {
                                            showCreateWithFileDialog(
                                                context, value);
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
                              Text('基本情報',
                                  style: context.textTheme.titleMedium),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                separatorBuilder: (context, index) => SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium),
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('甲'),
                                      IntrinsicWidth(
                                        stepWidth: 200,
                                        child: ValueListenableBuilder(
                                          valueListenable: context
                                              .read<ContractTemplateModel>()
                                              .listA,
                                          builder: (context, value, _) {
                                            return ReactiveDropdownFormField(
                                              formControlName: 'contractA',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('乙'),
                                      IntrinsicWidth(
                                        stepWidth: 200,
                                        child: ValueListenableBuilder(
                                          valueListenable: context
                                              .read<ContractTemplateModel>()
                                              .listB,
                                          builder: (context, value, _) {
                                            return ReactiveDropdownFormField(
                                              formControlName: 'contractB',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('丙'),
                                      IntrinsicWidth(
                                        stepWidth: 200,
                                        child: ValueListenableBuilder(
                                          valueListenable: context
                                              .read<ContractTemplateModel>()
                                              .listC,
                                          builder: (context, value, _) {
                                            return ReactiveDropdownFormField(
                                              formControlName: 'contractC',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              formControlName:
                                                  'fastening_method',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('病院の場合の契約先'),
                                      Row(
                                        children: [
                                          IntrinsicWidth(
                                            child: ReactiveRadioListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              value: 'Other_MS_Corporations',
                                              formControlName:
                                                  'contracting_party_for_hospitals',
                                              title: const Text('MS法人'),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          IntrinsicWidth(
                                            child: ReactiveRadioListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              contentPadding: EdgeInsets.zero,
                                              value: 'MS_Corporation',
                                              formControlName:
                                                  'contracting_party_for_hospitals',
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
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'operation',
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
                        const DocumentContent(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<ContractTemplateModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: validationMessages,
            child: ReactiveFormBuilder(
              form: () => contractTemplateform(file)..markAllAsTouched(),
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
