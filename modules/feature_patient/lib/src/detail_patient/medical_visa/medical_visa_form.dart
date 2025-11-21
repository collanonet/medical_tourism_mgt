// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup medicalVisaForm({required String medicalRecord}) {
  return FormGroup(
    {
      //本人 personal
      '_id': FormControl<String>(),
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
              'visaPageFileName': FormControl<FileSelect>(),
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
                  'byOthersRemarks': FormControl<String>(value: ''),
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
          'otherApplicationDocuments': FormArray(
            [
              FormGroup(
                {
                  'date': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'fileSelect': FormControl<FileSelect>(),
                },
              )
            ],
          ),
          'paymentStatus': FormControl<String>(value: ''),
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
                  'landingPermitDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'landingPermitFileSelect': FormControl<FileSelect>(),
                  'returnFlightTicketDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'returnFlightTicketFileSelect': FormControl<FileSelect>(),

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
        'reason': FormControl<String>(value: ''),
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
      'travelCompanion': FormGroup(
        {
          'nameRomaji': FormControl<String>(value: ''),
          'dateBirth': FormControl<DateTime>(),
          'age': FormControl<int>(),
          'sex': FormControl<String>(value: ''),
          'addressArea': FormControl<String>(value: ''),
          'numberPassport': FormControl<String>(value: ''),
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
                  'landingPermitDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'landingPermitFileSelect': FormControl<FileSelect>(),
                  'returnFlightTicketDate': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'returnFlightTicketFileSelect': FormControl<FileSelect>(),

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
                  'byOthers': FormControl<bool>(value: false),
                  'byOthersRemarks': FormControl<String>(value: ''),
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
          'visaPageFileName': FormControl<FileSelect>(),
          'otherApplicationDocuments': FormArray(
            [
              FormGroup(
                {
                  'date': FormControl<DateTime>(
                    validators: [
                      Validators.pattern(
                        ValidatorRegExp.date,
                      ),
                    ],
                  ),
                  'fileSelect': FormControl<FileSelect>(),
                },
              )
            ],
          ),
          'paymentStatus': FormControl<String>(value: ''),
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

      // ビザの取り下げ・変更情報のタブごとのファイル添付
      'visaChangeInfo': FormGroup({
        'tabs': FormArray([
          // 短期滞在の期間の延長
          FormGroup({
            'documents': FormArray([
              FormGroup({
                'documentName': FormControl<String>(value: ''),
                'issueDate': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
                'fileSelect': FormControl<FileSelect>(),
              }),
            ]),
          }),
          // 特定活動の期間の延長
          FormGroup({
            'documents': FormArray([
              FormGroup({
                'documentName': FormControl<String>(value: ''),
                'issueDate': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
                'fileSelect': FormControl<FileSelect>(),
              }),
            ]),
          }),
          // 短期滞在　医療ビザ→特定活動
          FormGroup({
            'documents': FormArray([
              FormGroup({
                'documentName': FormControl<String>(value: ''),
                'issueDate': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
                'fileSelect': FormControl<FileSelect>(),
              }),
            ]),
          }),
          // 海外での特定活動ビザ変更
          FormGroup({
            'documents': FormArray([
              FormGroup({
                'documentName': FormControl<String>(value: ''),
                'issueDate': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
                'fileSelect': FormControl<FileSelect>(),
              }),
            ]),
          }),
          // 日程変更届
          FormGroup({
            'documents': FormArray([
              FormGroup({
                'documentName': FormControl<String>(value: ''),
                'issueDate': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
                'fileSelect': FormControl<FileSelect>(),
              }),
            ]),
          }),
        ]),
      }),
    },
  );
}
