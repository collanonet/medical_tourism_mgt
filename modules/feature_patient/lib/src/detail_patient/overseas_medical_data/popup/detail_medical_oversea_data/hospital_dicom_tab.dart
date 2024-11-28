// Flutter imports:
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';

class HospitalDICOMTab extends StatelessWidget {
  const HospitalDICOMTab({
    super.key,
    this.medicalRecordOverseaData,
  });

  final MedicalRecordOverseaData? medicalRecordOverseaData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ColumnSeparated(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
        children: [
          TextFormField(
            decoration: const InputDecoration(
              isDense: true,
              hintText: 'コメント 大阪府済生会吹田病院',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              isDense: true,
              hintText: 'コメント 自社',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              isDense: true,
              hintText: 'コメント 大阪府済生会吹田病院',
            ),
          ),
          if (medicalRecordOverseaData?.file != null &&
              medicalRecordOverseaData?.file?.isNotEmpty == true)
            Expanded(
              child: DicomWebViewer(
                  seriesId:
                      medicalRecordOverseaData?.file?.first.parentSeries ?? ''),
            ),
        ],
      ),
    );
  }
}
