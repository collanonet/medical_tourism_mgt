// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup medicalVisaForm() {
  return FormGroup(
    {
      //本人 personal

      'personal': FormArray([
        FormGroup({
          'date': FormControl<DateTime>(value: DateTime.now()),
          'fileName': FormControl<FileSelect>(),
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
            },
          ),
        ],
      ),

      'requiredInJapan': FormGroup(
        {
          'visaInfo': FormArray(
            [
              FormGroup(
                {
                  'fileName': FormControl<FileSelect>(),
                  'passportDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'passportFileSelect': FormControl<FileSelect>(),
                  'letterOfGuaranteeDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'letterOfGuaranteeFileSelect': FormControl<FileSelect>(),
                  'sendBy': FormControl<String>(value: ''),
                  'byEMS': FormControl<bool>(value: false),
                  'byFedex': FormControl<bool>(value: false),
                  'byothers': FormControl<bool>(value: false),
                },
              ),
            ],
          ),
          'schedule': FormArray(
            [
              FormGroup(
                {
                  'treatmentSchedule': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  )
                },
              )
            ],
          ),
          'statementOfReasonsDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'travelCompanionListDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'travelInfo': FormArray(
            [
              FormGroup(
                {
                  'landingPermissionDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'visa_validity_period_expiration_date': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'date_of_entry_into_japan': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'departure_date_from_japan': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),

                  // 入国 hand in
                  'departureIn': FormControl<String>(value: ''),
                  'arrivalIn': FormControl<String>(value: ''),
                  'flightNumberIn': FormControl<String>(value: ''),
                  'departureTimeIn': FormControl<String>(value: ''),
                  'arrivalTimeIn': FormControl<String>(value: ''),

                  // 出国 hand out
                  'departureOut': FormControl<String>(value: ''),
                  'arrivalOut': FormControl<String>(value: ''),
                  'flightNumberOut': FormControl<String>(value: ''),
                  'departureTimeOut': FormControl<String>(value: ''),
                  'arrivalTimeOut': FormControl<String>(value: ''),
                  'seatNumberOut': FormControl<String>(value: ''),

                  'remarks': FormControl<String>(value: ''),
                },
              ),
            ],
          )
        },
      ),
      'visaWithdrawal': FormGroup({
        'subjectVisaWithdrawal': FormControl<bool>(value: false),
        'deathOrOccurrenceEventDate': FormControl<DateTime>(
          validators: [
            Validators.pattern(
              ValidatorRegExp.date,
            ),
          ],
        ),
        'remarks': FormControl<String>(),
      }),

      'afterGettingVisa': FormGroup(
        {
          'vasaInfo': FormArray(
            [
              FormGroup(
                {
                  'visaPage': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'landingPermit': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                },
              )
            ],
          ),
          'ticket': FormArray(
            [
              FormGroup({
                'plane_ticket_for_your_visit_to_japan': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
              })
            ],
          ),
          'ticketBack': FormArray(
            [
              FormGroup(
                {
                  'return_flight_ticket': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                },
              ),
            ],
          ),
          'boardingPass': FormArray(
            [
              FormGroup({
                'boarding_pass_for_return_flight': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
              })
            ],
          ),
          'certificate_of_eligibility': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
        },
      ),

      'travel_companion': FormGroup(
        {
          'nameRomaji': FormControl<String>(),
          'dateBirth': FormControl<DateTime>(),
          'age': FormControl<int>(),
          'sex': FormControl<String>(value: ''),
          'addressArea': FormControl<String>(),
          'numberPassport': FormControl<String>(),
          'travelInfo': FormArray(
            [
              FormGroup(
                {
                  'landingPermissionDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'visa_validity_period_expiration_date': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'date_of_entry_into_japan': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'departure_date_from_japan': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),

                  // 入国 hand in
                  'departureIn': FormControl<String>(value: ''),
                  'arrivalIn': FormControl<String>(value: ''),
                  'flightNumberIn': FormControl<String>(value: ''),
                  'departureTimeIn': FormControl<String>(value: ''),
                  'arrivalTimeIn': FormControl<String>(value: ''),

                  // 出国 hand out
                  'departureOut': FormControl<String>(value: ''),
                  'arrivalOut': FormControl<String>(value: ''),
                  'flightNumberOut': FormControl<String>(value: ''),
                  'departureTimeOut': FormControl<String>(value: ''),
                  'arrivalTimeOut': FormControl<String>(value: ''),
                  'seatNumberOut': FormControl<String>(value: ''),
                },
              ),
            ],
          ),
          'travelRemarks': FormControl<String>(value: ''),
          'visaWithdrawalTarget': FormControl<bool>(value: false),
          'reason': FormControl<String>(value: ''),
          'remarks': FormControl<String>(),
          'vasaInfo': FormArray(
            [
              FormGroup(
                {
                  'visaPage': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'landingPermit': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                },
              )
            ],
          ),
          'ticket': FormArray(
            [
              FormGroup({
                'plane_ticket_for_your_visit_to_japan': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
              })
            ],
          ),
          'ticketBack': FormArray(
            [
              FormGroup(
                {
                  'return_flight_ticket': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                },
              ),
            ],
          ),
          'boardingPass': FormArray(
            [
              FormGroup({
                'boarding_pass_for_return_flight': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
              })
            ],
          ),
          'certificate_of_eligibility': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
        },
      ),

      'necessaryInJapan': FormGroup(
        {
          'visaInfo': FormArray(
            [
              FormGroup(
                {
                  'passportDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'passportFileSelect': FormControl<FileSelect>(),
                  'letterOfGuaranteeDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'letterOfGuaranteeFileSelect': FormControl<FileSelect>(),
                  'sendBy': FormControl<String>(value: ''),
                  'byEMS': FormControl<bool>(value: false),
                  'byFedex': FormControl<bool>(value: false),
                  'byothers': FormControl<bool>(value: false),
                },
              ),
            ],
          ),
          'schedule': FormArray(
            [
              FormGroup(
                {
                  'treatmentSchedule': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  )
                },
              )
            ],
          ),
          'statementOfReasonsDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'travelCompanionListDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'travelInfo': FormArray(
            [
              FormGroup(
                {
                  'landingPermissionDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'visa_validity_period_expiration_date': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'date_of_entry_into_japan': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'departure_date_from_japan': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                },
              ),
            ],
          )
        },
      ),

      'afterGettingVisaFinal': FormGroup(
        {
          'vasaInfo': FormArray(
            [
              FormGroup(
                {
                  'visaPage': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'landingPermit': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                },
              )
            ],
          ),
          'ticket': FormArray(
            [
              FormGroup({
                'plane_ticket_for_your_visit_to_japan': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
              })
            ],
          ),
          'ticketBack': FormArray(
            [
              FormGroup(
                {
                  'return_flight_ticket': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                },
              ),
            ],
          ),
          'boardingPass': FormArray(
            [
              FormGroup({
                'boarding_pass_for_return_flight': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
              })
            ],
          ),
          'certificate_of_eligibility': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'remarks': FormControl<String>(),
        },
      ),
    },
  );
}
