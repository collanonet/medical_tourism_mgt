import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OverseasMedicalDataScreen extends StatefulWidget {
  const OverseasMedicalDataScreen({super.key});

  @override
  State<OverseasMedicalDataScreen> createState() =>
      _OverseasMedicalDataScreenState();
}

class _OverseasMedicalDataScreenState extends State<OverseasMedicalDataScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginExtraLarge,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              )),
              border: Border.all(
                color: context.appTheme.primaryColor,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.copy_all_rounded,
                  size: 50,
                  color: context.appTheme.primaryColor,
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Column(
                  children: [
                    Text(
                      '診療データをここにドラッグ＆ドロップ',
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.appTheme.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'またはファイルを選択する',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '外部URLを追加',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(color: Colors.grey),
                ),
                checkColor: Colors.white,
                value: false,
                onChanged: (value) {},
              ),
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
                'QR',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '閲覧有効期限',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                '共有',
                style: context.textTheme.bodySmall,
              )),
              Expanded(
                  child: Text(
                'コメント',
                style: context.textTheme.bodySmall,
              )),
            ],
          ),
          Divider(),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              10,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: BorderSide(color: Colors.grey),
                      ),
                      checkColor: Colors.white,
                      value: false,
                      onChanged: (value) {},
                    ),
                    Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Flexible(child: Text('北京協和病院')),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.red),
                              ),
                              child: Text(
                                '有効期限あり',
                                style: context.textTheme.bodySmall
                                    ?.copyWith(color: Colors.red),
                              ),
                            )
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
                        child: Icon(
                      Icons.qr_code_scanner,
                      color: context.appTheme.primaryColor,
                    )),
                    Expanded(child: Text('2023/06/30')),
                    Expanded(
                        child: Icon(
                      Icons.person,
                      color: context.appTheme.primaryColor,
                    )),
                    Expanded(
                        child: Icon(
                      Icons.chat,
                      color: context.appTheme.primaryColor,
                    )),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.appTheme.spacing.marginMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '削除する',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  '印刷する',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: context.appTheme.spacing.marginMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'サマリー用に項目を出力',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
