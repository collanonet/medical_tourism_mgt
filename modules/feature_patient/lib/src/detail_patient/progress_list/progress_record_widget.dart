// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProgressRecordWidget extends StatefulWidget {
  const ProgressRecordWidget({
    super.key,
    this.index, // オプショナルに変更
    this.onDelete,
  });

  // ドラッグ操作のためにインデックスを要求（オプショナル）
  final int? index;
  // delete this row
  final Function? onDelete;

  @override
  State<ProgressRecordWidget> createState() => _ProgressRecordWidgetState();
}

class _ProgressRecordWidgetState extends State<ProgressRecordWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ProgressRecordWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 済/未（チェックボックス）
          ReactiveCheckbox(
            formControlName: 'completed',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(color: Colors.grey),
            ),
            checkColor: Colors.white,
          ),
          SizedBox(width: context.appTheme.spacing.marginMedium),
          
          // 作業者（固定幅で制御）
          SizedBox(
            width: 100,
            child: ReactiveTextField(
              formControlName: 'tag',
              decoration: const InputDecoration(
                labelText: '作業者',
                hintText: '当社、患者、病院など',
              ),
            ),
          ),
          SizedBox(width: context.appTheme.spacing.marginMedium),
          
          // タスク
          Expanded(
            flex: 4,
            child: ReactiveTextField(
              formControlName: 'task',
            ),
          ),
          SizedBox(width: context.appTheme.spacing.marginMedium),
          
          // 完了日
          Expanded(
            flex: 1,
            child: ReactiveDatePickerField(
              formControlName: 'completionDate',
            ),
          ),
          SizedBox(width: context.appTheme.spacing.marginMedium),
          
          // 備考
          Expanded(
            flex: 2,
            child: ReactiveTextField(
              formControlName: 'remarks',
            ),
          ),
          SizedBox(width: context.appTheme.spacing.marginMedium),
          
          // 削除ボタン（右端に配置）
          if (widget.onDelete != null)
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: IconButton(
                icon: const Icon(
                  Icons.remove_circle_outline_rounded,
                  color: Colors.red,
                ),
                onPressed: () {
                  widget.onDelete?.call();
                },
              ),
            ),
        ],
      ),
    );
  }
}
