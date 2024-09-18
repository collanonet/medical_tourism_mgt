// Package imports:
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup medicalVisaForm() {
  return FormGroup({
    //本人 personal

    'personal': FormArray([
      FormGroup({
        'medicalVisa': FormControl<String>(value: ''),
        'applicationDate': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'issueDate': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'expirationDate': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'accompanyingPersonsNumber': FormControl<String>(value: ''),
        'visaIssuingOverseasEstablishments': FormControl<String>(value: ''),
        'remarks': FormControl<String>(value: ''),
        'paymentStatus': FormControl<String>(value: ''),
      }),
    ]),

// 滞在期間 stay period
    'stayPeriod': FormArray(
      [
        FormGroup(
          {
            'stayStartingDatePersonalReference': FormControl<DateTime>(
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'stayEndDate': FormControl<DateTime>(
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            // 'stayStartingDateActual': FormControl<DateTime>(
            //   validators: [
            //     Validators.pattern(
            //       ValidatorRegExp.date,
            //     ),
            //   ],
            // ),
            // 'expirationDate': FormControl<DateTime>(
            //   validators: [
            //     Validators.pattern(
            //       ValidatorRegExp.date,
            //     ),
            //   ],
            // ),
          },
        ),
      ],
    ),

    'requiredInJapan' : FormGroup({
      'visaInfo' : FormArray([
        FormGroup({
          'passportDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'letterOfGuaranteeDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'sendBy' : FormControl<String>(value: ''),
          'byEMS' : FormControl<bool>(value: false),
          'byFedex' : FormControl<bool>(value: false),
          'byothers' : FormControl<bool>(value: false),
        }),
      ]),
      'schedule' : FormArray([
        FormGroup({
          'treatmentSchedule' : FormControl<DateTime>(
             validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          )
        })
      ]),
      '' : FormArray([
        FormGroup({
          '' : FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          '' : FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
        })
      ])
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
      'deathOrOccurrenceEventDate': FormControl<DateTime>(
        validators: [
          Validators.pattern(
            ValidatorRegExp.date,
          ),
        ],
      ),
      'remarks': FormControl<String>(),
    }),
// 同行者  companion
    'companion': FormGroup({
      'seatNumber': FormControl<String>(),
      'remarks': FormControl<String>(),
      'remarks2': FormControl<String>(),
    }),
    // 日本で必要 required in Japan
    // 'requiredInJapan': FormGroup({
    //   'passportFileUploadDate': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   // 'passportFileUpload': FormControl<String>(),

    //   'personal_reference_file_upload_date': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   // 'personal_reference_file_upload': FormControl<String>(),
    //   // 'send_original_ems_fedex_pds_file_upload': FormControl<String>(),

    //   'treatment_schedule_file_upload_date': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   //'treatment_schedule_file_upload': FormControl<String>(),

    //   'statement_reasons_file_upload_date': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   // 'statement_reasons_file_upload': FormControl<String>(),

    //   'accompanying_persons_list_file_upload_date': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   //'accompanying_persons_list_file_upload': FormControl<String>(),
    //   // ビザ取得後に必要なもの required after obtaining a visa
    //   'visa_page_file_upload_date': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'visa_page_file_upload': FormControl<String>(),

    //   'landing_permit_file_upload_date': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'landing_permit_file_upload': FormControl<String>(),

    //   'airline_ticke_arrival_japan_file_upload_date': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'airline_ticke_arrival_japan_file_upload': FormControl<String>(),

    //   'airline_ticket_return_japan_file_upload_date': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'airline_ticket_return_japan_file_upload': FormControl<String>(),

    //   'boardingPassReturningFileUploadDate': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'boardingPassReturningFileUpload': FormControl<String>(),

    //   'certificateEligibilityFileUploadDate': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'certificateEligibilityFileUpload': FormControl<String>(),
    //   // 申請時に必要なもの required at the time of application
    //   'photoFileUploadDate': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'photoFileUpload': FormControl<String>(),

    //   'visaApplicationFormFileUploadDate': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'visaApplicationFormFileUpload': FormControl<String>(),

    //   'bankBalanceCertificateFileUploadDate': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'bankBalanceCertificateFileUpload': FormControl<String>(),

    //   'identificationDocumentsFileUploadDate': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'identificationDocumentsFileUpload': FormControl<String>(),

    //   'othersFileUploadDate': FormControl<DateTime>(
    //     validators: [
    //       Validators.pattern(
    //         ValidatorRegExp.date,
    //       ),
    //     ],
    //   ),
    //   'othersFileUpload': FormControl<String>(),
    // }),
    'addition': FormGroup({
      'dateLandingPermit': FormControl<DateTime>(
        validators: [
          Validators.pattern(
            ValidatorRegExp.date,
          ),
        ],
      ),
      'dateVisaExpiration': FormControl<DateTime>(
        validators: [
          Validators.pattern(
            ValidatorRegExp.date,
          ),
        ],
      ),
      'dateEntryIntoJapan': FormControl<DateTime>(
        validators: [
          Validators.pattern(
            ValidatorRegExp.date,
          ),
        ],
      ),
      'dateEntryFromJapan': FormControl<DateTime>(
        validators: [
          Validators.pattern(
            ValidatorRegExp.date,
          ),
        ],
      ),
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
      'deathOrOccurrenceEventDate': FormControl<DateTime>(
        validators: [
          Validators.pattern(
            ValidatorRegExp.date,
          ),
        ],
      ),
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
