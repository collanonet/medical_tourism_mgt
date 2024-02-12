import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class PatientResponseModel {
  PatientResponseModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

}
