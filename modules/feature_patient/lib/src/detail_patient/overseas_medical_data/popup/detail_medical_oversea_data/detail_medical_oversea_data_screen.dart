import 'package:core_network/core_network.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'study_of_dicom_tab.dart';
import 'package:flutter/cupertino.dart';

import 'hospital_certificate_tab.dart';
import 'hospital_dicom_tab.dart';

class DetailMedicalOverseaDataScreen extends StatefulWidget {
  const DetailMedicalOverseaDataScreen({
    super.key,
    this.medicalRecordOverseaData,
  });
  final MedicalRecordOverseaData? medicalRecordOverseaData;
  @override
  State<DetailMedicalOverseaDataScreen> createState() =>
      _DetailMedicalOverseaDataScreenState();
}

class _DetailMedicalOverseaDataScreenState
    extends State<DetailMedicalOverseaDataScreen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  final List<String> _tabs = const [
    '北京協和病院_DICOM',
    '中国人民解放軍総病院_診断書',
    '四川大学華西病院_DICOM',
  ];

  late List<Widget> pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      HospitalDICOMTab(
        medicalRecordOverseaData: widget.medicalRecordOverseaData,
      ),
      const HospitalCertificateTab(),
      const StudyOfDICOMTab(),
    ];
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
            builder: (BuildContext context, int index, Widget? child) {
              return pages[index];
            },
          ),
        )
      ],
    );
  }
}
