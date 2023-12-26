import 'package:data_patient/data_patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailPatientWebReservationModel with ChangeNotifier {
  DetailPatientWebReservationModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

}