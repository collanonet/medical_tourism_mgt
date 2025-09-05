// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProgressRecordWidget extends StatefulWidget {
  const ProgressRecordWidget({
    super.key,
    this.onDelete,
  });

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
        children: [
          // ドラッグ&ドロップハンドル
          Icon(
            Icons.drag_handle,
            color: Colors.grey[400],
            size: 20,
          ),
          SizedBox(width: context.appTheme.spacing.marginSmall),
          ReactiveCheckbox(
            formControlName: 'completed',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(color: Colors.grey),
            ),
            checkColor: Colors.white,
          ),
          ReactiveValueListenableBuilder<String?>(
              formControlName: 'tag',
              builder: (context, control, child) {
                return control.value == null
                    ? const SizedBox.shrink()
                    : Container(
                        width: context.appTheme.spacing.marginExtraLarge * 2,
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.appTheme.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            control.value ?? '',
                            style: TextStyle(
                                fontFamily: 'NotoSansJP',
                                package: 'core_ui',
                                color: context.appTheme.primaryColor),
                          ),
                        ),
                      );
              }),
          SizedBox(
            width: context.appTheme.spacing.marginExtraLarge,
          ),
          Expanded(
            flex: 4,
            child: ReactiveTextField(
              formControlName: 'task',
            ),
          ),
          SizedBox(
            width: context.appTheme.spacing.marginMedium,
          ),
          const           Expanded(
              flex: 2,
              child: ReactiveDatePickerField(
                formControlName: 'completionDate',
              )),
          SizedBox(
            width: context.appTheme.spacing.marginMedium,
          ),
          Expanded(
              flex: 2,
              child: ReactiveTextField(
                formControlName: 'tag',
                decoration: const InputDecoration(
                  labelText: '作業者',
                  hintText: '当社、患者、病院など',
                ),
              )),
          SizedBox(
            width: context.appTheme.spacing.marginMedium,
          ),
          Expanded(
              flex: 2,
              child: ReactiveTextField(
                formControlName: 'remarks',
              )),
          SizedBox(
            width: context.appTheme.spacing.marginMedium,
          ),
          if (widget.onDelete != null)
            IconButton(
              icon: const Icon(
                Icons.remove_circle_outline_rounded,
                color: Colors.red,
              ),
              onPressed: () {
                widget.onDelete?.call();
              },
            ),
        ],
      ),
    );
  }
}
