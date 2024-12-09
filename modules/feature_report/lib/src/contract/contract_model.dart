// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_report/data_report.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ContractModel with ChangeNotifier {
  ContractModel({required this.reportRepository});
  final ReportRepository reportRepository;

  ValueNotifier<AsyncData<List<ContractTemplateBasicInformationResponse>>>
      filterData = ValueNotifier(const AsyncData());
  Future<void> contractFilter({FormGroup? formGroup}) async {
    filterData.value = const AsyncData(loading: true);

    notifyListeners();
    await reportRepository
        .getReportContract(
            documentName: formGroup?.control('documentName').value == null
                ? null
                : formGroup!.control('documentName').value,
            first: formGroup?.control('first').value == null
                ? null
                : formGroup!.control('first').value,
            second: formGroup?.control('second').value == null
                ? null
                : formGroup!.control('second').value,
            methodOfConclusion:
                formGroup?.control('methodOfConclusion').value == null
                    ? null
                    : formGroup!.control('methodOfConclusion').value)
        .then((value) {
      filterData.value = AsyncData(data: value);
    }).catchError((err) {
      filterData.value = AsyncData(error: err);
    }).whenComplete(() {
      notifyListeners();
    });
    logger.d(formGroup!.control('first').value);
    logger.d(formGroup.value);
  }

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

class A {
  String item;
  A({required this.item});
}

class B {
  String item;
  B({required this.item});
}

class FasteningMethod {
  String item;
  FasteningMethod({required this.item});
}
