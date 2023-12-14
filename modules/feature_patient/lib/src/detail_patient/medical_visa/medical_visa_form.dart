import 'package:reactive_forms/reactive_forms.dart';

FormGroup medicalVisaForm() => FormGroup({
      //本人 personal

      'personal': FormGroup({
        'medical_visa': FormControl<String>(),
        'application_date': FormControl<DateTime>(),
        'issue_date': FormControl<DateTime>(),
        'expiration_date': FormControl<DateTime>(),
        'accompanying_persons_number': FormControl<String>(),
        'visa_issuing_overseas_establishments': FormControl<String>(),
        'remarks': FormControl<String>(),
        'payment_status': FormControl<String>(),
      }),

// 滞在期間 stay period
      'stay_period': FormGroup({
        'stay_starting_date_personal_reference': FormControl<DateTime>(),
        'stay_end_date': FormControl<DateTime>(),
        'stay_starting_date_actual': FormControl<DateTime>(),
        'expiration_date': FormControl<DateTime>(),
      }),

      // 入国 hand in
      'hand_in': FormGroup({
        'departure': FormControl<String>(),
        'arrival': FormControl<String>(),
        'flight_number': FormControl<String>(),
        'departure_time': FormControl<String>(),
        'arrival_time': FormControl<String>(),
      }),

      // 出国 hand out
      'hand_out': FormGroup({
        'departure': FormControl<String>(),
        'arrival': FormControl<String>(),
        'flight_number': FormControl<String>(),
        'departure_time': FormControl<String>(),
        'arrival_time': FormControl<String>(),
        'seat_number': FormControl<String>(),
      }),
      // ビザの取り下げ visa withdrawal
      'visa_withdrawal': FormGroup({
        'subject__visa_withdrawal': FormControl<String>(),
        'death_or_occurrence_event_date': FormControl<DateTime>(),
        'remarks': FormControl<String>(),
      }),
// 同行者  companion
      'companion': FormGroup({
        'seat_number': FormControl<String>(),
        'remarks': FormControl<String>(),
        'remarks2': FormControl<String>(),
      }),
      // 日本で必要 required in Japan
      'required_in_japan': FormGroup({
        'passport_file_upload_date': FormControl<DateTime>(),
        'passport_file_upload': FormControl<String>(),

        'personal_reference_file_upload_date': FormControl<DateTime>(),
        'personal_reference_file_upload': FormControl<String>(),
        'send_original_ems_fedex_pds_file_upload': FormControl<String>(),

        'treatment_schedule_file_upload_date': FormControl<DateTime>(),
        'treatment_schedule_file_upload': FormControl<String>(),

        'statement_reasons_file_upload_date': FormControl<DateTime>(),
        'statement_reasons_file_upload': FormControl<String>(),

        'accompanying_persons_list_file_upload_date': FormControl<DateTime>(),
        'accompanying_persons_list_file_upload': FormControl<String>(),
        // ビザ取得後の必要なもの required after visa acquisition
        'visa_page_file_upload_date': FormControl<DateTime>(),
        'visa_page_file_upload': FormControl<String>(),

        'landing_permit_file_upload_date': FormControl<DateTime>(),
        'landing_permit_file_upload': FormControl<String>(),

        'airline_ticke_arrival_japan_file_upload_date': FormControl<DateTime>(),
        'airline_ticke_arrival_japan_file_upload': FormControl<String>(),

        'airline_ticket_return_japan_file_upload_date': FormControl<DateTime>(),
        'airline_ticket_return_japan_file_upload': FormControl<String>(),

        'boarding_pass_returning_file_upload_date': FormControl<DateTime>(),
        'boarding_pass_returning_file_upload': FormControl<String>(),

        'certificate_eligibility_file_upload_date': FormControl<DateTime>(),
        'certificate_eligibility_file_upload': FormControl<String>(),
        // 申請時に必要なもの required at the time of application
        'photo_file_upload_date': FormControl<DateTime>(),
        'photo_file_upload': FormControl<String>(),

        'visa_application_form_file_upload_date': FormControl<DateTime>(),
        'visa_application_form_file_upload': FormControl<String>(),

        'bank_balance_certificate_file_upload_date': FormControl<DateTime>(),
        'bank_balance_certificate_file_upload': FormControl<String>(),

        'identification_documents_file_upload_date': FormControl<DateTime>(),
        'identification_documents_file_upload': FormControl<String>(),

        'others_file_upload_date': FormControl<DateTime>(),
        'others_file_upload': FormControl<String>(),
      }),
    });
