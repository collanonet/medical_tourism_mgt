// Package imports:
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';

@injectable
class MedicalSummaryModel {
  MedicalSummaryModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;
}
