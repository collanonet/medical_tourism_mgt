// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../basic_info_model.dart';

class MedicalRecordAgentSection extends StatelessWidget {
  const MedicalRecordAgentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('MEDICAL_RECORD_AGENTS') as FormGroup;
    return ValueListenableBuilder(
        valueListenable:
            context.watch<BasicInformationModel>().medicalRecordAgents,
        builder: (context, value, _) => Skeletonizer(
              enabled: value.loading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'エージェント/紹介者',
                        style: context.textTheme.titleLarge,
                      ),
                      SizedBox(
                        width: context.appTheme.spacing.marginMedium,
                      ),
                      Text(
                        '病院へは共有されません/紹介者',
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  const Text(
                    'エージェント',
                    style: TextStyle(
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                  ReactiveForm(
                    formGroup: formGroup,
                    child: RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: [
                        Expanded(
                          child: ValueListenableBuilder<
                                  AsyncData<List<AgentResponse>>>(
                              valueListenable:
                                  context.read<BasicInformationModel>().agents,
                              builder: (context, agentsData, _) {
                                final agents = agentsData.data ?? [];
                                return ReactiveFormField<String?, String?>(
                                  formControlName: 'company',
                                  builder: (field) {
                                    return LayoutBuilder(
                                      builder: (context, constraints) {
                                        return DropdownMenu<String>(
                                          width: constraints.maxWidth,
                                          initialSelection: field.value,
                                          enableFilter: true,
                                          requestFocusOnTap: true,
                                          label: const Text('エージェント企業名（任意）'),
                                          dropdownMenuEntries: agents
                                              .map((e) => DropdownMenuEntry<String>(
                                                    value: e.companyName ?? '',
                                                    label: e.companyName ?? '',
                                                  ))
                                              .toList(),
                                          onSelected: (value) {
                                            field.didChange(value);
                                            final selectedName = value;
                                            if (selectedName != null) {
                                              try {
                                                final agent = agents.firstWhere(
                                                    (e) =>
                                                        e.companyName ==
                                                        selectedName);
                                                formGroup
                                                        .control('nameInKanji')
                                                        .value =
                                                    agent.manager
                                                            ?.fullNameJapaneseKanjiChineseOnly ??
                                                        '';
                                                formGroup
                                                    .control('nameInKana')
                                                    .value =
                                                    agent.manager
                                                            ?.fullNameKana ??
                                                        '';
                                              } catch (_) {
                                                // Handle case where agent is not found or other errors
                                              }
                                            }
                                          },
                                          errorText: field.errorText,
                                        );
                                      },
                                    );
                                  },
                                );
                              }),
                        ),
//                         Expanded(
//                           child: ReactiveTextField(
//                             formControlName: 'nameInKanji',
//                             decoration: const InputDecoration(
//                               label: Text(
//                                 '担当者',
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: ReactiveTextField(
//                             formControlName: 'nameInKana',
//                             decoration: const InputDecoration(
//                               label: Text(
//                                 '担当者 (カナ)',
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: ReactiveDropdownField<String?>(
//                             formControlName: 'agentType',
//                             decoration: const InputDecoration(
//                               label: Text(
//                                 '種別', //   TODO: l10n 対応
//                               ),
//                             ),
//                             items: const [
//                               DropdownMenuItem(
//                                 value: 'domestic_company',
//                                 child: Text('日本国内企業'),
//                               ),
//                               DropdownMenuItem(
//                                 value: 'domestic_individual',
//                                 child: Text('日本在住個人'),
//                               ),
//                               DropdownMenuItem(
//                                 value: 'overseas_company',
//                                 child: Text('海外企業'),
//                               ),
//                               DropdownMenuItem(
//                                 value: 'overseas_individual',
//                                 child: Text('海外在住個人'),
//                               ),
//                             ],
//                           ),
//                         ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.appTheme.spacing.marginMedium,
                  ),
                ],
              ),
            ));
  }
}

