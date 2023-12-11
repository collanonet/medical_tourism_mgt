// pick_medical_data_file

import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';

@injectable
class PickMedicalDataFileModel {
  PickMedicalDataFileModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;
}
