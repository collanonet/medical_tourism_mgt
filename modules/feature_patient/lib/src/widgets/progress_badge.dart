// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../utils/progress_stage_helper.dart';

class ProgressBadge extends StatelessWidget {
  const ProgressBadge({
    super.key,
    required this.stage,
    this.maxWidth,
    this.showDetail = true,
  });

  final ProgressStage stage;
  final double? maxWidth;
  final bool showDetail;

  @override
  Widget build(BuildContext context) {
    final detail =
        showDetail && stage.hasDetail ? stage.detail?.trim() : null;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? double.infinity,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: stage.color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              stage.category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (detail != null) ...[
            const SizedBox(height: 4),
            Text(
              detail,
              softWrap: true,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF374151),
                height: 1.3,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

