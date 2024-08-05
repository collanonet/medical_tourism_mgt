import 'package:reactive_forms/reactive_forms.dart';

FormGroup medicalVisaForm() {
  return FormGroup({
    //本人 personal

    'personal': FormGroup({
      'medicalVisa': FormControl<String>(),
      'applicationDate': FormControl<DateTime>(),
      'issueDate': FormControl<DateTime>(),
      'expirationDate': FormControl<DateTime>(),
      'accompanyingPersonsNumber': FormControl<String>(),
      'visaIssuingOverseasEstablishments': FormControl<String>(),
      'remarks': FormControl<String>(),
      'paymentStatus': FormControl<String>(),
    }),

// 滞在期間 stay period
    'stayPeriod': FormGroup({
      'stayStartingDatePersonalReference': FormControl<DateTime>(),
      'stayEndDate': FormControl<DateTime>(),
      'stayStartingDateActual': FormControl<DateTime>(),
      'expirationDate': FormControl<DateTime>(),
    }),

    // 入国 hand in
    'handIn': FormGroup({
      'departure': FormControl<String>(),
      'arrival': FormControl<String>(),
      'flightNumber': FormControl<String>(),
      'departureTime': FormControl<String>(),
      'arrivalTime': FormControl<String>(),
    }),

    // 出国 hand out
    'handOut': FormGroup({
      'departure': FormControl<String>(),
      'arrival': FormControl<String>(),
      'flightNumber': FormControl<String>(),
      'departureTime': FormControl<String>(),
      'arrivalTime': FormControl<String>(),
      'seatNumber': FormControl<String>(),
    }),
    // ビザの取り下げ visa withdrawal
    'visaWithdrawal': FormGroup({
      'subjectVisaWithdrawal': FormControl<String>(),
      'deathOrOccurrenceEventDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
    }),
// 同行者  companion
    'companion': FormGroup({
      'seatNumber': FormControl<String>(),
      'remarks': FormControl<String>(),
      'remarks2': FormControl<String>(),
    }),
    // 日本で必要 required in Japan
    'requiredInJapan': FormGroup({
      'passportFileUploadDate': FormControl<DateTime>(),
      'passportFileUpload': FormControl<String>(),

      'personal_reference_file_upload_date': FormControl<DateTime>(),
      'personal_reference_file_upload': FormControl<String>(),
      'send_original_ems_fedex_pds_file_upload': FormControl<String>(),

      'treatment_schedule_file_upload_date': FormControl<DateTime>(),
      'treatment_schedule_file_upload': FormControl<String>(),

      'statement_reasons_file_upload_date': FormControl<DateTime>(),
      'statement_reasons_file_upload': FormControl<String>(),

      'accompanying_persons_list_file_upload_date': FormControl<DateTime>(),
      'accompanying_persons_list_file_upload': FormControl<String>(),
      // ビザ取得後に必要なもの required after obtaining a visa
      'visa_page_file_upload_date': FormControl<DateTime>(),
      'visa_page_file_upload': FormControl<String>(),

      'landing_permit_file_upload_date': FormControl<DateTime>(),
      'landing_permit_file_upload': FormControl<String>(),

      'airline_ticke_arrival_japan_file_upload_date': FormControl<DateTime>(),
      'airline_ticke_arrival_japan_file_upload': FormControl<String>(),

      'airline_ticket_return_japan_file_upload_date': FormControl<DateTime>(),
      'airline_ticket_return_japan_file_upload': FormControl<String>(),

      'boardingPassReturningFileUploadDate': FormControl<DateTime>(),
      'boardingPassReturningFileUpload': FormControl<String>(),

      'certificateEligibilityFileUploadDate': FormControl<DateTime>(),
      'certificateEligibilityFileUpload': FormControl<String>(),
      // 申請時に必要なもの required at the time of application
      'photoFileUploadDate': FormControl<DateTime>(),
      'photoFileUpload': FormControl<String>(),

      'visaApplicationFormFileUploadDate': FormControl<DateTime>(),
      'visaApplicationFormFileUpload': FormControl<String>(),

      'bankBalanceCertificateFileUploadDate': FormControl<DateTime>(),
      'bankBalanceCertificateFileUpload': FormControl<String>(),

      'identificationDocumentsFileUploadDate': FormControl<DateTime>(),
      'identificationDocumentsFileUpload': FormControl<String>(),

      'othersFileUploadDate': FormControl<DateTime>(),
      'othersFileUpload': FormControl<String>(),
    }),
    'addition': FormGroup({
      'dateLandingPermit': FormControl<DateTime>(),
      'dateVisaExpiration': FormControl<DateTime>(),
      'dateEntryIntoJapan': FormControl<DateTime>(),
      'dateEntryFromJapan': FormControl<DateTime>(),
      'departureEntry': FormControl<String>(),
      'arrivalEntry': FormControl<String>(),
      'flightNumberEntry': FormControl<String>(),
      'departureTimeEntry': FormControl<String>(),
      'arrivalTimeEntry': FormControl<String>(),
      'departureDeparture': FormControl<String>(),
      'arrivalDeparture': FormControl<String>(),
      'flightNumberDeparture': FormControl<String>(),
      'departureTimeDeparture': FormControl<String>(),
      'arrivalTimeDeparture': FormControl<String>(),
      'flightSeatNumbeDeparturer': FormControl<String>(),
      'remarks': FormControl<String>(),
    }),
    // Withdrawal of visa
    'withdrawalOfVisa': FormGroup({
      'subjectToVisaWithdrawal': FormControl<bool>(),
      'deathOrOccurrenceEventDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
    }),

    // 同行者
    'companionOther': FormGroup({
      'nameRomaji': FormControl<String>(),
      'dateBirth': FormControl<DateTime>(),
      'sex': FormControl<bool>(),
      'addressArea': FormControl<String>(),
      'numberPassport': FormControl<String>(),
      'dateLandingPermit': FormControl<DateTime>(),
      'dateVisaExpiration': FormControl<DateTime>(),
      'dateEntryIntoJapan': FormControl<DateTime>(),
      'dateEntryFromJapan': FormControl<DateTime>(),
      'departureEntry': FormControl<String>(),
      'arrivalEntry': FormControl<String>(),
      'flightNumberEntry': FormControl<String>(),
      'departureTimeEntry': FormControl<String>(),
      'arrivalTimeEntry': FormControl<String>(),
      'departureDeparture': FormControl<String>(),
      'arrivalDeparture': FormControl<String>(),
      'flightNumberDeparture': FormControl<String>(),
      'departureTimeDeparture': FormControl<String>(),
      'arrivalTimeDeparture': FormControl<String>(),
      'flightSeatNumbeDeparturer': FormControl<String>(),
      'remarks': FormControl<String>(),
    }),

    // Withdrawal of visa
    'withdrawalOfVisaOther': FormGroup({
      'subjectToVisaWithdrawal': FormControl<bool>(),
      'reason': FormControl<String>(),
      'remarks': FormControl<String>(),
    }),
  });
}
