import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:feature_patient/feature_patient.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'agent_detail_model.dart';
import 'sub/basic_information/basic_information_page.dart';
import 'sub/contract/contract_page.dart';
import 'sub/estimate_invoice/estimate_invoice_page.dart';

class AgentDetailScreen extends StatefulWidget {
  const AgentDetailScreen({super.key, this.id});
  final String? id;
  @override
  State<AgentDetailScreen> createState() => _AgentDetailScreenState();
}

class _AgentDetailScreenState extends State<AgentDetailScreen> {
  List<String> menu = <String>[
    '基本情報', // basic information
    '対応患者', // Compatible patients
    '契約書', // contract
    '見積書・請求書', // Estimate/Invoice
  ];

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      BasicInformationPage(id: widget.id),
      PatientPageFormAgent(id: widget.id),
      ContractPage(id: widget.id),
      EstimateInvoicePage(id: widget.id),
    ];
  }

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ValueListenableBuilder(
              valueListenable: context.read<AgentDetailModel>().agent,
              builder: (context, value, _) {
                return Skeletonizer(
                  enabled: value.loading,
                  child: ColumnSeparated(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 16);
                    },
                    children: [
                      Text(
                        value.hasData
                            ? value.requireData.companyName ?? ''
                            : '',
                        style: context.textTheme.titleLarge,
                      ),
                      Text(
                        value.hasData ? value.requireData.nameKana ?? '' : '',
                        style: context.textTheme.titleSmall,
                      ),
                    ],
                  ),
                );
              }),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: context.appTheme.spacing.marginMedium,
              left: context.appTheme.spacing.marginMedium),
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (BuildContext context, int value, Widget? child) {
              return Wrap(
                children: [
                  TabBarWidget(
                    selectedIndex: value,
                    menu: menu,
                    onPressed: (index) {
                      _selectedIndex.value = index;
                    },
                  ),
                ],
              );
            },
          ),
        ),
        ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (BuildContext context, int index, Widget? child) {
            return Expanded(
              child: Container(
                padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      context.appTheme.spacing.borderRadiusMedium),
                  color: Colors.white,
                ),
                child: pages[index],
              ),
            );
          },
        )
      ],
    );
  }
}
