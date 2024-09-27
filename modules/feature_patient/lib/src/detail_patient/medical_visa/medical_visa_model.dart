// Flutter imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';

@injectable
class MedicalVisaModel with ChangeNotifier {
  MedicalVisaModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  late Patient _patient;

  Patient get patient => _patient;

  Future<void> initialData({Patient? patient, String? id}) async {
    notifyListeners();
  }

  ValueNotifier<AsyncData<List<MedicalVisaPersonalResponse>>> personalData = ValueNotifier(const AsyncData());
  Future<void> fetchMedicalVisaPersonal() async{
    try{
      personalData.value = const AsyncData(loading: true);
      final response = await patientRepository.getMedicalVisaPersonal();
      personalData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
      personalData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<MedicalVisaPersonalResponse>> submitPersonalData = ValueNotifier(const AsyncData());
  Future<void> submitMedicalVisaPersonal() async{
    try{
      submitPersonalData.value = const AsyncData(loading: true);

    }catch(e){
      logger.d(e);
      submitPersonalData.value = AsyncData(error: e);
    }
  }
}
