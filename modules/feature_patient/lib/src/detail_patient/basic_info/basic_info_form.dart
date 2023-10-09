import 'package:core_network/entities.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup basicInfoForm({
  String? patientId,
  MedicalRecord? medicalRecord,
  MedicalRecordHospital? medicalRecordHospital,
}) =>
    FormGroup(
      {
        'id': FormControl<String>(value: medicalRecord?.id),
        'dateOfBirth': FormControl<DateTime>(value: medicalRecord?.dateOfBirth),
        'age': FormControl<String>(value: medicalRecord?.age.toString() ?? ''),
        'gender': FormControl<String>(value: medicalRecord?.gender ?? 'male'),
        'arrivalDate': FormControl<DateTime>(value: medicalRecord?.arrivalDate),
        'examinationDate':
            FormControl<DateTime>(value: medicalRecord?.examinationDate),
        'departureDate':
            FormControl<DateTime>(value: medicalRecord?.departureDate),
        'caseNumber': FormControl<String>(value: medicalRecord?.caseNumber),
        'receptionDate':
            FormControl<DateTime>(value: medicalRecord?.receptionDate),
        'type': FormControl<String>(value: medicalRecord?.type),
        'progress': FormControl<String>(value: medicalRecord?.progress),
        'advancePaymentDate':
            FormControl<DateTime>(value: medicalRecord?.advancePaymentDate),
        'paymentMethod':
            FormControl<String>(value: medicalRecord?.paymentMethod),
        'memo': FormControl<String>(value: medicalRecord?.memo),
        'patient':
            FormControl<String>(value: patientId ?? medicalRecord?.patient),
        'hospitalName':
            FormControl<String>(value: medicalRecordHospital?.hospitalName),
        'medicalCardNumber': FormControl<String>(
            value: medicalRecordHospital?.medicalCardNumber),
      },
    );
