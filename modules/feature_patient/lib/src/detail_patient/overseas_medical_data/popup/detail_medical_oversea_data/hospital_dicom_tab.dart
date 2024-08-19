import 'package:core_network/core_network.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';

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
            decoration: InputDecoration(
              isDense: true,
              hintText: 'コメント 大阪府済生会吹田病院',
            ),
          ),

          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              hintText: 'コメント 自社',
            ),
          ),

          TextFormField(
            decoration: InputDecoration(
              isDense: true,
              hintText: 'コメント 大阪府済生会吹田病院',
            ),
          ),
          Avatar.network(
            medicalRecordOverseaData?.file,
            placeholder: AssetImage(
              Images.logoMadical,
              package: 'core_ui',
            ),
            shape: BoxShape.rectangle,
            customSize: const Size(200, 200),
          )
        ],
      ),
    );
  }
}
