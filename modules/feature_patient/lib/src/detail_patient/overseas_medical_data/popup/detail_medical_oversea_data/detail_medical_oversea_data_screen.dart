// Flutter imports:
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/widgets.dart';

// Project imports:
import 'hospital_dicom_tab.dart';

class DetailMedicalOverseaDataScreen extends StatefulWidget {
  const DetailMedicalOverseaDataScreen({
    super.key,
    required this.medicalRecordOverseaDatas,
    required this.index,
    this.onRefresh,
  });

  final Function? onRefresh;
  final int index;
  final List<MedicalRecordOverseaData> medicalRecordOverseaDatas;

  @override
  State<DetailMedicalOverseaDataScreen> createState() =>
      _DetailMedicalOverseaDataScreenState();
}

class _DetailMedicalOverseaDataScreenState
    extends State<DetailMedicalOverseaDataScreen> {
  late List<String> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = widget.medicalRecordOverseaDatas
        .map((e) => e.hospitalName.toString())
        .toList();
  }

  @override
  void didUpdateWidget(
      covariant DetailMedicalOverseaDataScreen oldWidget,
      ) {
    super.didUpdateWidget(oldWidget);
    _tabs = widget.medicalRecordOverseaDatas
        .map((e) => e.hospitalName.toString())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      initialIndex: widget.index,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              isScrollable: true,
              labelColor: context.appTheme.primaryColor,
              unselectedLabelColor: context.appTheme.primaryColor,
              indicatorColor: context.appTheme.primaryColor,
              indicatorWeight: 2,
              labelStyle: context.textTheme.titleSmall,
              unselectedLabelStyle: context.textTheme.titleSmall,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  context.appTheme.spacing.borderRadiusMedium,
                ),
                color: context.appTheme.primaryColor.withOpacity(0.1),
              ),
              tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: widget.medicalRecordOverseaDatas
                    .map((e) => HospitalDICOMTab(
                  medicalRecordOverseaData: e,
                  onRefresh: widget.onRefresh,
                ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}