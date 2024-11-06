// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup medicalVisaForm({required String medicalRecord}) {
  return FormGroup(
    {
      //本人 personal
      'medicalRecord': FormControl<String>(value: medicalRecord),
      'personal': FormArray(
        [
          FormGroup(
            {
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
              'visaIssuingOverseasEstablishments':
                  FormControl<String>(value: ''),
              'remarks': FormControl<String>(value: ''),
              'paymentStatus': FormControl<String>(value: ''),
            },
          ),
        ],
      ),

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
                  'byOthers': FormControl<bool>(value: false),
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
                  ),
                  'treatmentScheduleFileSelect': FormControl<FileSelect>(),
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
          'statementOfReasonsFileSelect': FormControl<FileSelect>(),
          'travelCompanionListDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'travelCompanionListFileSelect': FormControl<FileSelect>(),
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
                  'visaValidityPeriodExpirationDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'dateOfEntryIntoJapan': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'departureDateFromJapan': FormControl<DateTime>(
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
          'vasaInfo': FormArray([
            FormGroup({
              'visaPage': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'visaPageFileName': FormControl<FileSelect>(),
              'landingPermit': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'landingPermitFileName': FormControl<FileSelect>(),
            }),
          ]),
          'ticket': FormArray([
            FormGroup({
              'planeTicketForYourVisitToJapan': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'planeTicketForYourVisitToJapanFileName':
                  FormControl<FileSelect>(),
            }),
          ]),
          'ticketBack': FormArray([
            FormGroup({
              'returnFlightTicket': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'returnFlightTicketFileName': FormControl<FileSelect>(),
            }),
          ]),
          'boardingPass': FormArray([
            FormGroup({
              'boardingPassForReturnFlight': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'boardingPassForReturnFlightFileName': FormControl<FileSelect>(),
            }),
          ]),
          'certificateOfEligibility': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'certificateOfEligibilityFileName': FormControl<FileSelect>(),
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
                  'visaValidityPeriodExpirationDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'dateOfEntryIntoJapan': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'departureDateFromJapan': FormControl<DateTime>(
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
          'remarks': FormControl<String>(value: ''),
          'vasaInfo': FormArray([
            FormGroup({
              'visaPage': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'visaPageFileName': FormControl<FileSelect>(),
              'landingPermit': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'landingPermitFileName': FormControl<FileSelect>(),
            }),
          ]),
          'ticket': FormArray([
            FormGroup({
              'planeTicketForYourVisitToJapan': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'planeTicketForYourVisitToJapanFileName':
                  FormControl<FileSelect>(),
            }),
          ]),
          'ticketBack': FormArray([
            FormGroup({
              'returnFlightTicket': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'returnFlightTicketFileName': FormControl<FileSelect>(),
            }),
          ]),
          'boardingPass': FormArray([
            FormGroup({
              'boardingPassForReturnFlight': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'boardingPassForReturnFlightFileName': FormControl<FileSelect>(),
            }),
          ]),
          'certificateOfEligibility': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'certificateOfEligibilityFileName': FormControl<FileSelect>(),
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
                  ),
                  'treatmentScheduleFileSelect': FormControl<FileSelect>(),
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
          'statementOfReasonsFileSelect': FormControl<FileSelect>(),
          'travelCompanionListDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'travelCompanionListFileSelect': FormControl<FileSelect>(),
        },
      ),

      'afterGettingVisaFinal': FormGroup(
        {
          'vasaInfo': FormArray([
            FormGroup({
              'visaPage': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'visaPageFileName': FormControl<FileSelect>(),
              'landingPermit': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'landingPermitFileName': FormControl<FileSelect>(),
            }),
          ]),
          'ticket': FormArray([
            FormGroup({
              'planeTicketForYourVisitToJapan': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'planeTicketForYourVisitToJapanFileName':
                  FormControl<FileSelect>(),
            }),
          ]),
          'ticketBack': FormArray([
            FormGroup({
              'returnFlightTicket': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'returnFlightTicketFileName': FormControl<FileSelect>(),
            }),
          ]),
          'boardingPass': FormArray([
            FormGroup({
              'boardingPassForReturnFlight': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'boardingPassForReturnFlightFileName': FormControl<FileSelect>(),
            }),
          ]),
          'certificateOfEligibility': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'certificateOfEligibilityFileName': FormControl<FileSelect>(),
          'remarks': FormControl<String>(),
        },
      ),
    },
  );
}
