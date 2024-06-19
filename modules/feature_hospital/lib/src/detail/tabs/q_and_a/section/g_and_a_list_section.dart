import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class QAndAListSection extends StatefulWidget {
  const QAndAListSection({super.key});

  @override
  State<QAndAListSection> createState() => _QAndAListSectionState();
}

class _QAndAListSectionState extends State<QAndAListSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('listSection') as FormGroup;
    return ReactiveForm(
        formGroup: formGroup,
        child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (context, index) => SizedBox(
                  height: context.appTheme.spacing.formSpacing,
                ),
            children: [
              RowSeparated(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  separatorBuilder: (context, index) => SizedBox(
                        width: context.appTheme.spacing.formSpacing,
                      ),
                  children: [
                    Text(
                      'Q＆A一覧',
                      style: context.textTheme.bodyLarge,
                    ),
                    RowSeparated(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        separatorBuilder: (context, index) => SizedBox(
                              width: context.appTheme.spacing.formSpacing,
                            ),
                        children: [
                          ColumnSeparated(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              separatorBuilder: (context, index) => SizedBox(
                                    height: context
                                        .appTheme.spacing.marginExtraSmall,
                                  ),
                              children: [
                                Text(
                                  '分類',
                                  style: context.textTheme.bodyMedium,
                                ),
                                IntrinsicWidth(
                                  stepWidth:
                                      MediaQuery.of(context).size.width * 0.2,
                                  child: ReactiveDropdownField(
                                    formControlName: 'classification',
                                    decoration: const InputDecoration(
                                        hintText: '予約方法について'),
                                    items: const [],
                                  ),
                                )
                              ]),
                          IntrinsicWidth(
                            stepWidth: MediaQuery.of(context).size.width * 0.2,
                            child: ReactiveTextField(
                              formControlName: 'enterKeyword',
                              decoration:
                                  const InputDecoration(hintText: 'キーワードを入力'),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              '保存する',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ])
                  ]),
              ExpansionTile(
                collapsedBackgroundColor:
                    context.appTheme.primaryBackgroundColor,
                title: Text(
                  'こちらの病院のベットは、個室ベットはありますか？こちらの病院のベットは、個室ベットはありますか？',
                  style: context.textTheme.bodyMedium!
                      .copyWith(color: context.appTheme.primaryColor),
                ),
                children: List.generate(
                    3, (index) => const ListTile(title: Text('Answer'))),
              ),
              ExpansionTile(
                collapsedBackgroundColor:
                    context.appTheme.primaryBackgroundColor,
                title: Text(
                  '医師の経歴を教えてください。',
                  style: context.textTheme.bodyMedium!
                      .copyWith(color: context.appTheme.primaryColor),
                ),
                children: List.generate(
                    3, (index) => const ListTile(title: Text('Answer'))),
              ),
              ExpansionTile(
                collapsedBackgroundColor:
                    context.appTheme.primaryBackgroundColor,
                title: Text(
                  '医師の経歴を教えてください。',
                  style: context.textTheme.bodyMedium!
                      .copyWith(color: context.appTheme.primaryColor),
                ),
                children: List.generate(
                    3, (index) => const ListTile(title: Text('Answer'))),
              ),
              ReactiveTextField(
                formControlName: 'about',
                maxLines: 6,
                decoration: const InputDecoration(hintText: '分類'),
              ),
              RowSeparated(
                  mainAxisAlignment: MainAxisAlignment.end,
                  separatorBuilder: (context, index) => SizedBox(
                        width: context.appTheme.spacing.formSpacing,
                      ),
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.appTheme.spacing.marginSmall,
                              vertical: context.appTheme.spacing.buttonVertical,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {},
                        child: Text(
                          "削除する",
                          style: context.textTheme.labelLarge
                              ?.copyWith(color: context.appTheme.primaryColor),
                        )),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.appTheme.spacing.marginSmall,
                              vertical: context.appTheme.spacing.buttonVertical,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {},
                        child: Text(
                          "編集する",
                          style: context.textTheme.labelLarge
                              ?.copyWith(color: context.appTheme.primaryColor),
                        )),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'コピーする',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ])
            ]));
  }
}
