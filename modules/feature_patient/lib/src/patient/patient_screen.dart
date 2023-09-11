import 'package:auto_route/auto_route.dart';
import 'package:core_l10n/l10n.dart';
import 'package:feature_patient/feature_patient.dart';
import 'package:feature_patient/src/patient/filter_patient.dart';
import 'package:flutter/material.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  String filterText = "すべて";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PatientFilter(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: () {
                  context.pushRoute(const PrePatientRoute());
                },
                child: Text(context.l10n.actionListOfPreMembers),
              ),
              const Spacer(),
              SegmentedButton<String>(
                showSelectedIcon: false,
                segments: <ButtonSegment<String>>[
                  ButtonSegment<String>(
                    value: context.l10n.labelOrdersOnly,
                    label: Text(context.l10n.labelOrdersOnly),
                    tooltip: context.l10n.labelOrdersOnly,
                  ),
                  ButtonSegment<String>(
                    value: context.l10n.labelCXL,
                    label: Text(context.l10n.labelCXL),
                    tooltip: context.l10n.labelCXL,
                  ),
                  ButtonSegment<String>(
                      value: context.l10n.labelAll,
                      label: Text(context.l10n.labelAll),
                      tooltip: context.l10n.labelAll),
                ],
                selected: <String>{filterText},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    filterText = newSelection.first;
                  });
                },
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: () {},
                child: Text(context.l10n.actionNewRegistration),
              ),
            ],
          ),
        ),
        const Center(
          child: Text('Patient Screen'),
        ),
      ],
    );
  }
}
