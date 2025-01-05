// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';

class HospitalDICOMTab extends StatelessWidget {
  const HospitalDICOMTab({
    super.key,
    this.medicalRecordOverseaData,
  });

  final MedicalRecordOverseaData? medicalRecordOverseaData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Padding(
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
              enabled: false,
            ),
            TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'コメント 自社',
              ),
              enabled: false,
            ),
            TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'コメント 大阪府済生会吹田病院',
              ),
              enabled: false,
            ),
            if (medicalRecordOverseaData?.file != null &&
                medicalRecordOverseaData?.file?.isNotEmpty == true)
              Expanded(
                child: DicomWebViewer(
                    seriesId:
                        medicalRecordOverseaData?.file?.first.parentSeries ??
                            ''),
              ),
            if (medicalRecordOverseaData?.sharedUrl != null &&
                medicalRecordOverseaData?.sharedUrl?.isNotEmpty == true)
              Expanded(
                child: WebView(
                  uri: Uri.parse(medicalRecordOverseaData?.sharedUrl ?? ''),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
