// Flutter imports:
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
  });

  final int index;
  final List<MedicalRecordOverseaData> medicalRecordOverseaDatas;

  @override
  State<DetailMedicalOverseaDataScreen> createState() =>
      _DetailMedicalOverseaDataScreenState();
}

class _DetailMedicalOverseaDataScreenState
    extends State<DetailMedicalOverseaDataScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  late List<String> _tabs = const [
    '北京協和病院_DICOM',
    '中国人民解放軍総病院_診断書',
    '四川大学華西病院_DICOM',
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex.value = widget.index;
    _tabs = widget.medicalRecordOverseaDatas
        .map((e) => e.hospitalName.toString())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (BuildContext context, int value, Widget? child) {
            return TabBarWidget(
              selectedIndex: value,
              menu: _tabs,
              onPressed: (index) {
                _selectedIndex.value = index;
              },
            );
          },
        ),
        Expanded(
          child: ValueListenableBuilder<int>(
            valueListenable: _selectedIndex,
            builder: (context, index, child) {
              return widget.medicalRecordOverseaDatas
                  .map((e) => HospitalDICOMTab(
                        medicalRecordOverseaData: e,
                      ))
                  .toList()[index];
            },
          ),
        )
      ],
    );
  }
}
