import 'package:core_utils/async.dart';
import 'package:data_agent/data_agent.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/src/models/models.dart';

@injectable
class ContractModel {
  ContractModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());

  submitData(FormGroup form) {}
}
