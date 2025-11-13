// Flutter imports:
import 'package:flutter/material.dart';

class ProgressStage {
  const ProgressStage({
    required this.category,
    required this.color,
    this.detail,
  });

  final String category;
  final Color color;
  final String? detail;

  bool get hasDetail {
    final trimmedDetail = detail?.trim();
    return trimmedDetail != null &&
        trimmedDetail.isNotEmpty &&
        trimmedDetail != category;
  }
}

ProgressStage resolveProgressStage(String? rawDetail) {
  final detail = rawDetail?.trim();
  if (detail == null || detail.isEmpty) {
    return const ProgressStage(
      category: '未設定',
      color: Color(0xFF9CA3AF),
      detail: null,
    );
  }

  final match = _stageDefinitions.firstWhere(
    (definition) => definition.matches(detail),
    orElse: () => _StageDefinition.fallback,
  );

  return ProgressStage(
    category: match.label,
    color: match.color,
    detail: detail,
  );
}

bool isSpecialProgressStage(String? rawDetail) {
  if (rawDetail == null) return false;
  return _specialKeywords.any((keyword) => rawDetail.contains(keyword));
}

class _StageDefinition {
  const _StageDefinition({
    required this.label,
    required this.keywords,
    required this.color,
  });

  final String label;
  final List<String> keywords;
  final Color color;

  bool matches(String value) {
    return keywords.any((keyword) => value.contains(keyword));
  }

  static const _StageDefinition fallback = _StageDefinition(
    label: 'その他',
    keywords: [],
    color: Color(0xFF0F766E),
  );
}

const List<_StageDefinition> _stageDefinitions = [
  _StageDefinition(
    label: 'キャンセル',
    keywords: ['キャンセル', 'CXL'],
    color: Color(0xFFDC2626),
  ),
  _StageDefinition(
    label: '一時保留',
    keywords: ['一時保留', '手配一時保留'],
    color: Color(0xFFF59E0B),
  ),
  _StageDefinition(
    label: 'お問い合わせ',
    keywords: ['お問い合せ', 'お問い合わせ'],
    color: Color(0xFF0EA5E9),
  ),
  _StageDefinition(
    label: 'ご提案中',
    keywords: [
      'お申込み',
      '申し込み',
      '資料提出',
      '医療機関の選定・ご提案',
    ],
    color: Color(0xFFF97316),
  ),
  _StageDefinition(
    label: '受注',
    keywords: [
      '契約締結・入金',
      '資料翻訳・病院問い合わせ',
      '訪日治療適応判断',
      '来日決定・お見積提示・入金',
      '来日決定・お見積り提示・入金',
      '医療ビザ申請・来日日程確定',
      '医療機関の正式予約',
      '来日治療・受診サポート',
    ],
    color: Color(0xFF22C55E),
  ),
  _StageDefinition(
    label: '完了',
    keywords: ['治療終了・帰国・フォローアップ'],
    color: Color(0xFF6366F1),
  ),
];

const List<String> _specialKeywords = [
  'キャンセル',
  'CXL',
  '一時保留',
  '手配一時保留',
];

