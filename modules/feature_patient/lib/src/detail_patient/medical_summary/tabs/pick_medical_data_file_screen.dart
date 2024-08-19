import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class PickMedicalDataFileScreen extends StatelessWidget {
  const PickMedicalDataFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '添付書類選択',
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
          Row(
            children: [
              Expanded(
                  flex: 3,
                  child: Text(
                    '病院名',
                    style: context.textTheme.bodySmall,
                  )),
              Expanded(
                  child: Text(
                '保管場所',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  flex: 2,
                  child: Text(
                    'カテゴリ',
                    style: context.textTheme.bodySmall,
                  )),
              Expanded(
                  child: Text(
                '書類名',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '発行日',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                'QRコード',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '共有',
                style: context.textTheme.bodySmall,
              )),
            ],
          ),
          Divider(),
          Flexible(
            child: ListView(
              children: List.generate(
                10,
                (index) => InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Text('北京協和病院'),
                              ],
                            )),
                        Expanded(
                            child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: context.appTheme.primaryColor),
                              ),
                              child: Text('社内'),
                            ),
                          ],
                        )),
                        Expanded(flex: 2, child: Text('画像データ（DICOM）')),
                        Expanded(
                            child: Text(
                          'PET-CT',
                          style: context.textTheme.bodySmall
                              ?.copyWith(color: context.appTheme.primaryColor),
                        )),
                        Expanded(child: Text('2023/06/30')),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(
                              Icons.qr_code_scanner,
                              color: context.appTheme.primaryColor,
                            ),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: context.appTheme.primaryColor,
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
