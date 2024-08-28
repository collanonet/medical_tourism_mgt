// Package imports:
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';

@injectable
class SummaryListModel {
  SummaryListModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;
}
