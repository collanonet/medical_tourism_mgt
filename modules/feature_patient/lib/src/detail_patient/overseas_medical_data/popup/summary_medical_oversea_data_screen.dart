import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummaryMedicalOverseaDataScreen extends StatelessWidget {
  const SummaryMedicalOverseaDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'サマリー転記用に項目を出力しました。コピーして利用してください。',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close)),
          ],
        ),
        Text('テキスト'),
        TextFormField(
          minLines: 3,
          maxLines: 10,
          enabled: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(), isDense: true, hintText: '''
北京協和病院　画像データ（DICOM）　PET-CT 　2023/06/30
中華人民解放軍総病院　病状資料　入退院記録 　2023/06/30
四川大学華西病院　病状資料　PET-CT 　2023/06/30
中華人民解放軍総病院　画像データ（DICOM）　MRI 　2023/06/30
北京協和病院　画像データ（DICOM）　検査結果 　2023/06/30
          '''),
        ),
      ],
    );
  }
}
