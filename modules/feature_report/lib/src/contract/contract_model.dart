

import 'package:data_report/data_report.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class ContractModel{
  ContractModel({required this.reportRepository});
 final ReportRepository reportRepository;

  ValueNotifier<List<A>> listA = ValueNotifier([
    A(item: '自社'),
  ]);

  ValueNotifier<List<B>> listB = ValueNotifier([
    B(item: '患者'),
    B(item: 'AG'),
    B(item: '病院'),
  ]);

  ValueNotifier<List<FasteningMethod>> listFasteningMethod = ValueNotifier([
    FasteningMethod(item: '電子契約'),
    FasteningMethod(item: '書面契約'),
  ]);
}

class A{
  String item;
  A({required this.item});
}

class B{
  String item;
  B({required this.item});
}

class FasteningMethod{
  String item;
  FasteningMethod({required this.item});
}