// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';

class ViewPopup extends StatelessWidget {
  const ViewPopup({
    super.key,
    required this.datas,
  });

  final List<DomesticMedicalDataResponse> datas;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        const Row(
          children: [
            Expanded(flex: 2, child: Text('医療機関名')),
            Expanded(child: Text('カテゴリ')),
            Expanded(child: Text('書類名')),
            Expanded(
              child: Text('備考欄'),
            ),
            Expanded(
              child: Text('発行日'),
            ),
            Expanded(
              child: Text('共有URL発行'),
            ),
            Expanded(
              child: Text('患者へ開示'),
            ),
            Expanded(
              child: Text('他医療機関へ開示'),
            )
          ],
        ),
        const Divider(
          height: 2,
          thickness: 2,
          color: Color(0xff98A6B5),
        ),
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.separated(
            itemCount: datas.length,
            itemBuilder: (context, index) {
              final data = datas[index];
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(data.medicalInstitutionName ?? ''),
                  ),
                  Expanded(
                    child: Text(data.category ?? ''),
                  ),
                  Expanded(
                    child: Text(data.documentName ?? ''),
                  ),
                  Expanded(
                    child: Text(data.remarks ?? ''),
                  ),
                  Expanded(
                    child: Text(data.dateOfIssue == null
                        ? ''
                        : Dates.formShortDate(data.dateOfIssue)),
                  ),
                  Expanded(
                    child: isImage(data.file)
                        ? Avatar.network(
                            data.file,
                            placeholder: const AssetImage(
                              Images.logoMadical,
                              package: 'core_ui',
                            ),
                            shape: BoxShape.rectangle,
                            customSize: const Size(60, 60),
                          )
                        : data.file != null
                            ? SizedBox(
                                child:
                                    Text(data.file.toString().split('.').last),
                              )
                            : const SizedBox(),
                  ),
                  Expanded(
                    child: Text(data.disclosureToPatient == true ? 'o' : 'x'),
                  ),
                  Expanded(
                    child: Text(
                        data.disclosureToOtherMedicalInstitutions == true
                            ? 'o'
                            : 'x'),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.grey,
              );
            },
          ),
        )
      ],
    );
  }
}
