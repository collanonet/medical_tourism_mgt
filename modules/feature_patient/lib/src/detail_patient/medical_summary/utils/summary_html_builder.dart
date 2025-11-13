// Package imports:
import 'package:core_network/core_network.dart';
import 'package:intl/intl.dart';

String buildSummaryHtml(MedicalRecordSummary summary) {
  String formatDate(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('yyyy/MM/dd').format(date);
  }

  String formatBool(
    bool? value, {
    String trueLabel = 'あり',
    String falseLabel = 'なし',
  }) {
    if (value == null) return '-';
    return value ? trueLabel : falseLabel;
  }

  String formatGender(bool? gender) {
    if (gender == null) return '-';
    return gender ? '男性' : '女性';
  }

  String formatText(String? value) {
    if (value == null || value.trim().isEmpty) return '-';
    return value.replaceAll('\n', '<br/>');
  }

  String tableRow(String title, String value) {
    return '<tr><th style="width:25%;">$title</th><td>$value</td></tr>';
  }

  final buffer = StringBuffer()
    ..writeln('<html><head><meta charset="utf-8" />')
    ..writeln(
        '<style>body{font-family:"Noto Sans JP","Yu Gothic",sans-serif;} table{width:100%;border-collapse:collapse;} th,td{border:1px solid #999;padding:6px;text-align:left;vertical-align:top;} th{background-color:#f2f2f2;}</style>')
    ..writeln('</head><body>')
    ..writeln('<h1 style="text-align:center;">診療サマリー</h1>')
    ..writeln('<table>')
    ..writeln(tableRow('記載日', formatDate(summary.entryDate)))
    ..writeln(tableRow('氏名（パスポート）', formatText(summary.namePassport)))
    ..writeln(tableRow('生年月日', formatDate(summary.dateOfBirth)))
    ..writeln(tableRow('年齢', summary.age?.toString() ?? '-'))
    ..writeln(tableRow('性別', formatGender(summary.gender)))
    ..writeln(tableRow(
        '氏名（中国語漢字/ベトナム語）', formatText(summary.nameChineseKanjiVietnamese)))
    ..writeln(tableRow('氏名（カナ）', formatText(summary.nameKana)))
    ..writeln(tableRow('現住所', formatText(summary.currentAddress)))
    ..writeln(
        tableRow('携帯番号（患者）', formatText(summary.mobileNumberPatient)))
    ..writeln(
        tableRow('携帯番号（国内可）', formatText(summary.mobileNumberDomestic)))
    ..writeln(tableRow('病名', formatText(summary.diseaseName)))
    ..writeln(tableRow('組織型', formatText(summary.tissueType)))
    ..writeln(tableRow('特記事項', formatBool(summary.diseaseNotices)))
    ..writeln(tableRow('診断・診察医療機関名',
        formatText(summary.diagnosticMedicalInstitutionName)))
    ..writeln(tableRow(
        '既往歴・家族歴等', formatText(summary.pastIllnessFamilyHistory)))
    ..writeln(tableRow('紹介医療機関等',
        formatText(summary.referralMedicalInstitutionEtc)))
    ..writeln(tableRow('病状経過と検査結果等',
        formatText(summary.diseaseCourseSndTestResultsEtc)))
    ..writeln(tableRow('症状', formatText(summary.symptoms)))
    ..writeln(tableRow('注意事項', formatBool(summary.notices)))
    ..writeln(tableRow('転移', formatBool(summary.metastasis)))
    ..writeln(tableRow('放射線治療の有無',
        formatBool(summary.radiationTreatmentOrNot)))
    ..writeln(tableRow('抗がん剤治療の有無',
        formatBool(summary.presenceOfAnticancerDrugTreatment)))
    ..writeln(tableRow('生検', formatBool(summary.biopsy)))
    ..writeln(tableRow('患者様の希望', formatText(summary.patientsWishes)))
    ..writeln(tableRow('エージェント名', formatText(summary.agentName)))
    ..writeln(tableRow('担当者名', formatText(summary.personInChargeName)))
    ..writeln(tableRow('携帯番号（担当）', formatText(summary.mobileNumber)))
    ..writeln(tableRow('滞在予定住所', formatText(summary.patientsAddressStay)))
    ..writeln(tableRow('緊急連絡先', formatText(summary.emergencyContact)))
    ..writeln(tableRow('備考', formatText(summary.remarks)))
    ..writeln('</table>')
    ..writeln('</body></html>');

  return buffer.toString();
}

