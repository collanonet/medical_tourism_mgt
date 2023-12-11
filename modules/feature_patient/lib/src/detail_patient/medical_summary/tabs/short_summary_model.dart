import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShortSummaryModel {
  ShortSummaryModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;
}