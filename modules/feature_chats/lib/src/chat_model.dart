// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_auth/data_auth.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatModel with ChangeNotifier {
  ChatModel({
    required this.authRepository,
    required this.patientRepository,
  });

  final AuthRepository authRepository;

  final PatientRepository patientRepository;

  AsyncData<Paginated<Patient>> _patientData = const AsyncData();
  AsyncData<Paginated<Patient>> get patientData => _patientData;

  Future<void> patients() {
    _patientData = const AsyncData(loading: true);
    notifyListeners();

    return patientRepository.patients().then((value) {
      _patientData = AsyncData(data: value);
    }).catchError((error) {
      logger.d(error);
      _patientData = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }
}
