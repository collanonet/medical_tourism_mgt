import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';

class DocumentContent extends StatelessWidget {
  const DocumentContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: ColumnSeparated(
          separatorBuilder: (context, index) =>
              SizedBox(height: context.appTheme.spacing.marginMedium),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('　医療ツーリズムコーディネート契約書'),
              ],
            ),
            Text(
                '委託者 　　　　　　　  　 　　　（以降、「甲」という。）と 受託者 株式会社コノミティ（以降、「乙」という。）は、当医療ツーリズムコーディネート契約書及び別紙の医療ツーリズムコーディネート約款（以降、「本約款」という。）に記載された内容を十分に理解し、医療ツーリズムコーディネート契約（以降、「本契約」という。）を締結する。\n尚、本契約は甲が申し込んだ「医療ツーリズムコーディネートサービス申込書」に基づき、甲が日本滞在中、\n乙が甲の支援を行うための契約であるため、その有効期間は、本契約の締結の日から甲が離日する日までとなる。'),
            Text(
                '本契約の成立の証として、本書2通を作成し、各当事者の署名の上、各1通を保有する。\n乙は本契約締結後、本書面と同時に本約款を甲に交付する。'),
            Text('20　　年　　月　　日'),
            Text('委託者：　甲'),
            Text('住  所：'),
            Text('氏  名：'),
            Text('受託者：　乙'),
            Text('住  所：　　東京都港区新橋 6-9-4 新橋6丁目ビル'),
            Text('会社名：　　株式会社コノミティ'),
            Text('代表者：　　代表取締役　小林　伸二'),
            Text('仲介人又は付添人（存在しない場合は不要）'),
            Text(
                '私は、甲に、本契約及び本約款上の義務を遵守させるとともに、自らも本契約及び本約款上甲が負う義務を遵守することに同意します。'),
            Text('氏　名：'),
            Text('住　所：'),
            Text('甲との関係：'),
          ],
        ),
      ),
    );
  }
}
