import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AutoTranslateScreen extends StatelessWidget {
  const AutoTranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
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
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        Text(
          '診療情報を日本語へ自動翻訳しました。',
          style: context.textTheme.titleLarge,
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        const Row(
          children: [
            Expanded(child: Text('原文')),
            SizedBox(
              width: 50,
            ),
            Expanded(child: Text('翻訳結果')),
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginSmall,
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginMedium,
                  ),
                  decoration: BoxDecoration(
                      color: context.appTheme.primaryBackgroundColor,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium)),
                  child: SingleChildScrollView(
                    child: Text('''
1、关于患者的病理过程：
患者何时、多大年龄被诊断出？
16岁时被诊断患有乙型肝炎
那么症状是什么？
- 没有任何症状，但只有进行一般检查才能发现。
你去哪家医院？
- 就在最近，他在河内圣保罗医院接受了检查
什么是诊断？
- 乙型肝炎
给予了怎样的治疗？
- 从未接受过治疗
治疗结果如何？
病程是怎样的，采取了什么治疗方法？
- 尚未治疗
病情进展如何？
- 病毒载量增加和肝酶增加
如果有相关文件
您目前的症状是什么？
- 普通的

2.病史
患者有病史吗？
- 它不是
你曾经做过手术吗？ （包括腹腔镜手术）
- 仍然
你体内有金属吗？
- 它不是
另外，您是否正在接受任何疾病的治疗？
- 它不是
我正在吃药。功能性食品？
- 它不是
您有任何食物或药物过敏吗？
- 它不是
                  '''),
                  ),
                ),
              ),
              Center(
                  child: Icon(
                Icons.play_arrow_rounded,
                size: 50,
                color: context.appTheme.primaryColor,
              )),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(
                    context.appTheme.spacing.marginMedium,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium)),
                  child: SingleChildScrollView(
                    child: Text('''
1. 患者の病理学的過程に関して：
患者はいつ、何歳で診断されましたか?
16歳でB型肝炎と診断される
では、どんな症状があるのでしょうか？
- 症状はありませんが、一般的な検査だけでわかります。
どこの病院に通っていますか？
- つい最近、彼はハノイのセントポール病院で検査を受けました
診断とは何ですか?
- B型肝炎
どのような治療が行われましたか?
- 治療を受けたことがない
治療の結果はどうですか？
その後の病気の経過とどのような治療が施されましたか?
- まだ治療はされていません
病気はどのように進行するのでしょうか？
- ウイルス量が増加し、肝酵素が増加します
関連する書類があれば
現在の症状は？
- 普通

2. 病歴について
患者に病歴はありますか?
- そうではない
手術を受けたことはありますか？ （腹腔鏡手術を含む）
- まだ
体の中に金属が入っていますか？
- そうではない
また、何か病気の治療を受けていますか？
- そうではない
薬を服用しています。機能性食品？
- そうではない
食物や薬物のアレルギーはありますか?
- そうではない
家族歴がある場合は？
- お父さん: 痛風
- 祖父：肺がん
                  '''),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
