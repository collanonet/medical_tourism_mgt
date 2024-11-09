// Flutter imports:
import 'dart:convert';
import 'dart:math';

import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class MedicalVisaModel with ChangeNotifier {
  MedicalVisaModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  late Patient _patient;

  Patient get patient => _patient;

  Future<void> initialData({Patient? patient, String? id}) async {
    notifyListeners();
  }

  ValueNotifier<AsyncData<MedicalRecordVisaResponse>> medicalRecordVisaData =
      ValueNotifier(const AsyncData());

  Future<void> fetchMedicalRecordVisa(FormGroup formGroup,
      {required String id}) async {
    try {
      medicalRecordVisaData.value = const AsyncData(loading: true);
      final response = await patientRepository.getMedicalRecordVisa(id);
      insertData(formGroup, response);
      medicalRecordVisaData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      medicalRecordVisaData.value = AsyncData(error: e);
    }
  }

  void insertData(FormGroup formGroup, MedicalRecordVisaResponse response) {
    formGroup.control('_id').value = response.id;
    formGroup.control('medicalRecord').value = response.medicalRecord;

    // start insert data to form personal
    FormArray personalForm = formGroup.control('personal') as FormArray;
    if (response.personal != null && response.personal!.isNotEmpty) {
      personalForm.reset();
    }

    for (var elements in response.personal ?? []) {
      personalForm.add(FormGroup(
        {
          'medicalVisa': FormControl<String>(value: elements.medicalVisa),
          'applicationDate': FormControl<DateTime>(
            value: elements.applicationDate,
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'issueDate': FormControl<DateTime>(
            value: elements.issueDate,
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'expirationDate': FormControl<DateTime>(
            value: elements.expirationDate,
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'accompanyingPersonsNumber': FormControl<String>(
            value: elements.accompanyingPersonsNumber,
          ),
          'visaIssuingOverseasEstablishments': FormControl<String>(
            value: elements.visaIssuingOverseasEstablishments,
          ),
          'remarks': FormControl<String>(
            value: elements.remarks,
          ),
          'paymentStatus': FormControl<String>(
            value: elements.paymentStatus,
          ),
        },
      ));
    }
    FormArray stayPeriodForm = formGroup.control('stayPeriod') as FormArray;
    for (var element in response.stayPeriod!) {
      stayPeriodForm.add(
        FormGroup(
          {
            'stayStartingDatePersonalReference': FormControl<DateTime>(
              value: element.stayStartingDatePersonalReference,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'stayEndDate': FormControl<DateTime>(
              value: element.expirationDate,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
          },
        ),
      );
    }

    // end insert data to form personal

    FormGroup requiredInJapanForm =
        formGroup.control('requiredInJapan') as FormGroup;
    FormArray requiredInJapanVisaInfo =
        requiredInJapanForm.control('visaInfo') as FormArray;
    FormArray requiredInJapanSchedule =
        requiredInJapanForm.control('schedule') as FormArray;
    for (var element in response.requiredInJapan!.visaInfo!) {
      requiredInJapanVisaInfo.add(
        FormGroup(
          {
            'passportDate': FormControl<DateTime>(
              value: element.passportDate,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'passportFileSelect': FormControl<FileSelect>(),
            'letterOfGuaranteeDate': FormControl<DateTime>(
              value: element.letterOfGuaranteeDate,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'letterOfGuaranteeFileSelect': FormControl<FileSelect>(),
            'sendBy': FormControl<String>(value: element.sendBy),
            'byEMS': FormControl<bool>(value: element.byEMS),
            'byFedex': FormControl<bool>(value: element.byFedex),
            'byOthers': FormControl<bool>(value: element.byothers),
          },
        ),
      );
    }

    for (var element in response.requiredInJapan!.schedule!) {
      requiredInJapanSchedule.add(
        FormGroup(
          {
            'treatmentSchedule': FormControl<DateTime>(
              value: element.treatmentSchedule,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'treatmentScheduleFileSelect': FormControl<FileSelect>(),
          },
        ),
      );
    }
    // requiredInJapanForm.control('statementOfReasonsFileSelect').value =
    //     response.requiredInJapan!.statementOfReasonsDate;
    requiredInJapanForm.control('statementOfReasonsDate').value =
        response.requiredInJapan!.statementOfReasonsDate;
    requiredInJapanForm.control('travelCompanionListDate').value =
        response.requiredInJapan!.travelCompanionListDate;
    // requiredInJapanForm.control('travelCompanionListFileSelect').value =
    //     response.requiredInJapan!.travelCompanionListFileSelect;

    FormArray requiredInJapanTravelInfo =
        requiredInJapanForm.control('travelInfo') as FormArray;
    for (var element in response.requiredInJapan!.travelInfo!) {
      requiredInJapanTravelInfo.add(
        FormGroup(
          {
            'landingPermissionDate': FormControl<DateTime>(
              value: element.landingPermissionDate,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'visaValidityPeriodExpirationDate': FormControl<DateTime>(
              value: element.visaValidityPeriodExpirationDate,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'dateOfEntryIntoJapan': FormControl<DateTime>(
              value: element.dateOfEntryIntoJapan,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'departureDateFromJapan': FormControl<DateTime>(
              value: element.departureDateFromJapan,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),

            // 入国 hand in
            'departureIn': FormControl<String>(value: element.departureIn),
            'arrivalIn': FormControl<String>(value: element.arrivalIn),
            'flightNumberIn':
                FormControl<String>(value: element.flightNumberIn),
            'departureTimeIn': FormControl<String>(value: element.departureIn),
            'arrivalTimeIn': FormControl<String>(value: element.arrivalTimeIn),

            // 出国 hand out
            'departureOut': FormControl<String>(value: element.departureOut),
            'arrivalOut': FormControl<String>(value: element.arrivalOut),
            'flightNumberOut':
                FormControl<String>(value: element.flightNumberOut),
            'departureTimeOut':
                FormControl<String>(value: element.departureTimeOut),
            'arrivalTimeOut':
                FormControl<String>(value: element.arrivalTimeOut),
            'seatNumberOut': FormControl<String>(value: element.seatNumberOut),

            'remarks': FormControl<String>(value: element.remarks),
          },
        ),
      );
    }

    FormGroup requiredInJapanVisaWithdrawal =
        formGroup.control('visaWithdrawal') as FormGroup;
    requiredInJapanVisaWithdrawal.control('subjectVisaWithdrawal').value =
        response.visaWithdrawal!.subjectVisaWithdrawal;
    requiredInJapanVisaWithdrawal.control('deathOrOccurrenceEventDate').value =
        response.visaWithdrawal!.deathOrOccurrenceEventDate;
    requiredInJapanVisaWithdrawal.control('remarks').value =
        response.visaWithdrawal!.remarks;

    FormGroup requiredInJapanAfterGettingVisa =
        formGroup.control('afterGettingVisa') as FormGroup;
    FormArray afterGettingVisaVasaInfo =
        requiredInJapanAfterGettingVisa.control('vasaInfo') as FormArray;
    for (var element in response.afterGettingVisa!.vasaInfo!) {
      afterGettingVisaVasaInfo.add(
        FormGroup({
          'visaPage': FormControl<DateTime>(
            value: element.visaPage,
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'visaPageFileName': FormControl<FileSelect>(),
          'landingPermit': FormControl<DateTime>(
            value: element.landingPermit,
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'landingPermitFileName': FormControl<FileSelect>(),
        }),
      );
    }

    FormArray afterGettingVisaTicket =
        requiredInJapanAfterGettingVisa.control('ticket') as FormArray;
    for (var element in response.afterGettingVisa!.ticket!) {
      afterGettingVisaTicket.add(
        FormGroup({
          'planeTicketForYourVisitToJapan': FormControl<DateTime>(
            value: element.planeTicketForYourVisitToJapan,
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'planeTicketForYourVisitToJapanFileName': FormControl<FileSelect>(),
        }),
      );
    }

    FormArray afterGettingVisaTicketBack =
        requiredInJapanAfterGettingVisa.control('ticketBack') as FormArray;
    for (var element in response.afterGettingVisa!.ticketBack!) {
      afterGettingVisaTicketBack.add(
        FormGroup(
          {
            'returnFlightTicket': FormControl<DateTime>(
              value: element.returnFlightTicket,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'returnFlightTicketFileName': FormControl<FileSelect>(),
          },
        ),
      );
    }
    FormArray afterGettingVisaBoardingPass =
        requiredInJapanAfterGettingVisa.control('boardingPass') as FormArray;
    for (var element in response.afterGettingVisa!.boardingPass!) {
      afterGettingVisaBoardingPass.add(
        FormGroup(
          {
            'boardingPass': FormControl<DateTime>(
              value: element.boardingPassForReturnFlight,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'boardingPassFileName': FormControl<FileSelect>(),
          },
        ),
      );
    }

    // requiredInJapanAfterGettingVisa.control('certificateOfEligibility').value =
    //     response.afterGettingVisa!.certificateOfEligibility;
    // FormGroup travelCompanionForm =
    //     formGroup.control('travel_companion') as FormGroup;
    // travelCompanionForm.control('nameRomaji').value =
    //     response.travelCompanion!.nameRomaji;
    // travelCompanionForm.control('dateBirth').value =
    //     response.travelCompanion!.dateBirth;
    // travelCompanionForm.control('age').value = response.travelCompanion!.age;
    // travelCompanionForm.control('sex').value = response.travelCompanion!.sex;
    // travelCompanionForm.control('addressArea').value =
    //     response.travelCompanion!.addressArea;
    // travelCompanionForm.control('numberPassport').value =
    //     response.travelCompanion!.numberPassport;
    // FormArray travelCompanionTravelInfo =
    //     travelCompanionForm.control('travelInfo') as FormArray;
    // for (var element in response.travelCompanion!.travelInfo!) {
    //   travelCompanionTravelInfo.add(
    //     FormGroup(
    //       {
    //         'landingPermissionDate': FormControl<DateTime>(
    //           value: element.landingPermissionDate,
    //           validators: [
    //             Validators.pattern(
    //               ValidatorRegExp.date,
    //             ),
    //           ],
    //         ),
    //         'visaValidityPeriodExpirationDate': FormControl<DateTime>(
    //           value: element.visaValidityPeriodExpirationDate,
    //           validators: [
    //             Validators.pattern(
    //               ValidatorRegExp.date,
    //             ),
    //           ],
    //         ),
    //         'dateOfEntryIntoJapan': FormControl<DateTime>(
    //           value: element.dateOfEntryIntoJapan,
    //           validators: [
    //             Validators.pattern(
    //               ValidatorRegExp.date,
    //             ),
    //           ],
    //         ),
    //         'departureDateFromJapan': FormControl<DateTime>(
    //           value: element.departureDateFromJapan,
    //           validators: [
    //             Validators.pattern(
    //               ValidatorRegExp.date,
    //             ),
    //           ],
    //         ),

    //         // 入国 hand in
    //         'departureIn': FormControl<String>(value: element.departureIn),
    //         'arrivalIn': FormControl<String>(value: element.arrivalIn),
    //         'flightNumberIn':
    //             FormControl<String>(value: element.flightNumberIn),
    //         'departureTimeIn': FormControl<String>(value: element.departureIn),
    //         'arrivalTimeIn': FormControl<String>(value: element.arrivalTimeIn),

    //         // 出国 hand out
    //         'departureOut': FormControl<String>(value: element.departureOut),
    //         'arrivalOut': FormControl<String>(value: element.arrivalOut),
    //         'flightNumberOut':
    //             FormControl<String>(value: element.flightNumberOut),
    //         'departureTimeOut':
    //             FormControl<String>(value: element.departureTimeOut),
    //         'arrivalTimeOut':
    //             FormControl<String>(value: element.arrivalTimeOut),
    //         'seatNumberOut': FormControl<String>(value: element.seatNumberOut),

    //         'remarks': FormControl<String>(value: element.remarks),
    //       },
    //     ),
    //   );
    // }
    // travelCompanionForm.control('travelRemarks').value =
    //     response.travelCompanion!.travelRemarks;
    // travelCompanionForm.control('visaWithdrawalTarget').value =
    //     response.travelCompanion!.subjectVisaWithdrawal;
    // // travelCompanionForm.control('reason').value = response.travelCompanion!.;
    // travelCompanionForm.control('remarks').value =
    //     response.travelCompanion!.remarks;
    // FormArray travelCompanionFormVasaInfo =
    //     travelCompanionForm.control('vasaInfo') as FormArray;
    // for (var element in response.travelCompanion!.vasaInfo!) {
    //   travelCompanionFormVasaInfo.add(
    //     FormGroup({
    //       'visaPage': FormControl<DateTime>(
    //         value: element.visaPage,
    //         validators: [
    //           Validators.pattern(
    //             ValidatorRegExp.date,
    //           ),
    //         ],
    //       ),
    //       'visaPageFileName': FormControl<FileSelect>(),
    //       'landingPermit': FormControl<DateTime>(
    //         value: element.landingPermit,
    //         validators: [
    //           Validators.pattern(
    //             ValidatorRegExp.date,
    //           ),
    //         ],
    //       ),
    //       'landingPermitFileName': FormControl<FileSelect>(),
    //     }),
    //   );
    // }
    // FormArray travelCompanionFormTicket =
    //     travelCompanionForm.control('ticket') as FormArray;

    // for (var element in response.travelCompanion!.ticket!) {
    //   travelCompanionFormTicket.add(
    //     FormGroup({
    //       'planeTicketForYourVisitToJapan': FormControl<DateTime>(
    //         value: element.planeTicketForYourVisitToJapan,
    //         validators: [
    //           Validators.pattern(
    //             ValidatorRegExp.date,
    //           ),
    //         ],
    //       ),
    //       'planeTicketForYourVisitToJapanFileName': FormControl<FileSelect>(),
    //     }),
    //   );
    // }

    // FormArray travelCompanionFormTicketBack =
    //     travelCompanionForm.control('ticketBack') as FormArray;
    // for (var element in response.travelCompanion!.ticketBack!) {
    //   travelCompanionFormTicketBack.add(
    //     FormGroup(
    //       {
    //         'returnFlightTicket': FormControl<DateTime>(
    //           value: element.returnFlightTicket,
    //           validators: [
    //             Validators.pattern(
    //               ValidatorRegExp.date,
    //             ),
    //           ],
    //         ),
    //         'returnFlightTicketFileName': FormControl<FileSelect>(),
    //       },
    //     ),
    //   );
    // }
    // FormArray travelCompanionFormBoardingPass =
    //     travelCompanionForm.control('boardingPass') as FormArray;
    // for (var element in response.travelCompanion!.boardingPass!) {
    //   travelCompanionFormBoardingPass.add(
    //     FormGroup(
    //       {
    //         'boardingPass': FormControl<DateTime>(
    //           value: element.boardingPassForReturnFlight,
    //           validators: [
    //             Validators.pattern(
    //               ValidatorRegExp.date,
    //             ),
    //           ],
    //         ),
    //         'boardingPassFileName': FormControl<FileSelect>(),
    //       },
    //     ),
    //   );
    // }
    // travelCompanionForm.control('certificateOfEligibility').value =
    //     response.travelCompanion!.certificateOfEligibility;

    FormGroup afterGettingVisaFinalForm =
        formGroup.control('afterGettingVisaFinal') as FormGroup;
    FormArray afterGettingVisaFinalFormVisaInfor =
        afterGettingVisaFinalForm.control('vasaInfo') as FormArray;
  }

  ValueNotifier<AsyncData<MedicalRecordVisaResponse>>
      submitMedicalRecordVisaData = ValueNotifier(const AsyncData());

  Future<void> submitMedicalRecordVisa(FormGroup formGroup) async {
    try {
      submitMedicalRecordVisaData.value = const AsyncData(loading: true);
      // personal

      List<MedicalVisaPersonalRequest>? personal = [];

      await formGroup.control('personal').value.forEach(
        (e) {
          personal.add(
            MedicalVisaPersonalRequest(
              medicalVisa: e['medicalVisa'],
              applicationDate: e['applicationDate'],
              issueDate: e['issueDate'],
              expirationDate: e['expirationDate'],
              accompanyingPersonsNumber: e['accompanyingPersonsNumber'],
              visaIssuingOverseasEstablishments:
                  e['visaIssuingOverseasEstablishments'],
              remarks: e['remarks'],
              paymentStatus: e['paymentStatus'],
            ),
          );
          logger.d('Data ${e['medicalVisa']}');
        },
      );

      logger.d('Data2 ${personal.toList()}');

      //stayPeriod
      List<MedicalVisaStayPeriodRequest>? stayPeriod = [];
      formGroup.control('stayPeriod').value.forEach(
        (e) {
          stayPeriod.add(
            MedicalVisaStayPeriodRequest(
              stayEndDate: e['stayEndDate'],
              stayStartingDatePersonalReference:
                  e['stayStartingDatePersonalReference'],
            ),
          );
        },
      );

      //requiredInJapan
      var formRequiredInJapan =
          formGroup.control('requiredInJapan') as FormGroup;
      List<VisaInfoRequest>? visaInfo = [];

      formRequiredInJapan.control('visaInfo').value.forEach(
        (e) async {
          String? letterOfGuaranteeFileSelect;
          if (e['letterOfGuaranteeFileSelect'] != null) {
            FileSelect docFile = e['letterOfGuaranteeFileSelect'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                letterOfGuaranteeFileSelect = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              letterOfGuaranteeFileSelect = docFile.url;
            }
          }

          VisaInfoRequest(
            passportDate: e['passportDate'],
            passportFileSelect: 'test',
            letterOfGuaranteeDate: e['letterOfGuaranteeDate'],
            letterOfGuaranteeFileSelect: letterOfGuaranteeFileSelect,
            sendBy: e['sendBy'],
            byEMS: e['byEMS'],
            byFedex: e['byFedex'],
            byothers: e['byothers'],
          );
        },
      );

      List<ScheduleRequest>? schedule = [];
      if (schedule.isNotEmpty) {
        formRequiredInJapan.control('schedule').value.forEach((e) {
          schedule.add(
            ScheduleRequest(
              treatmentSchedule: e['treatmentSchedule'],
              treatmentScheduleFileSelect: e['treatmentScheduleFileSelect'],
            ),
          );
        });
      }

      String? statementOfReasonsFileSelect;
      if (formRequiredInJapan.control('statementOfReasonsFileSelect').value !=
          null) {
        FileSelect docFile =
            formRequiredInJapan.control('statementOfReasonsFileSelect').value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            statementOfReasonsFileSelect = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          statementOfReasonsFileSelect = docFile.url;
        }
      }

      String? travelCompanionListFileSelect;
      if (formRequiredInJapan.control('travelCompanionListFileSelect').value !=
          null) {
        FileSelect docFile =
            formRequiredInJapan.control('travelCompanionListFileSelect').value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            travelCompanionListFileSelect = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          travelCompanionListFileSelect = docFile.url;
        }
      }
      List<TravelInfoRequest>? travelInfo = [];
      if (travelInfo.isNotEmpty) {
        formRequiredInJapan.control('travelInfo').value.forEach(
          (e) {
            travelInfo.add(
              TravelInfoRequest(
                landingPermissionDate: e['landingPermissionDate'],
                visaValidityPeriodExpirationDate:
                    e['visaValidityPeriodExpirationDate'],
                dateOfEntryIntoJapan: e['dateOfEntryIntoJapan'],
                departureDateFromJapan: e['departureDateFromJapan'],
                departureIn: e['departureIn'],
                arrivalIn: e['arrivalIn'],
                flightNumberIn: e['flightNumberIn'],
                departureTimeIn: e['departureTimeIn'],
                arrivalTimeIn: e['arrivalTimeIn'],
                flightNumberOut: e['flightNumberOut'],
                departureTimeOut: e['departureTimeOut'],
                departureOut: e['departureOut'],
                arrivalOut: e['arrivalOut'],
                seatNumberOut: e['seatNumberOut'],
                remarks: e['remarks'],
              ),
            );
          },
        );
      }

      RequiredInJapan requiredInJapan = RequiredInJapan(
        visaInfo: visaInfo,
        schedule: schedule,
        statementOfReasonsDate:
            formRequiredInJapan.control('statementOfReasonsDate').value,
        statementOfReasonsFileSelect: statementOfReasonsFileSelect,
        travelCompanionListDate:
            formRequiredInJapan.control('travelCompanionListDate').value,
        travelCompanionListFileSelect: travelCompanionListFileSelect,
        travelInfo: travelInfo,
      );

      //visaWithdrawal
      var formwithdrawal = formGroup.control('visaWithdrawal') as FormGroup;
      MedicalVisaWithdrawalRequest visaWithdrawal =
          MedicalVisaWithdrawalRequest(
              subjectVisaWithdrawal:
                  formwithdrawal.control('subjectVisaWithdrawal').value,
              deathOrOccurrenceEventDate:
                  formwithdrawal.control('deathOrOccurrenceEventDate').value,
              remarks: formwithdrawal.control('remarks').value);

      //GettingVisaInfoRequest

      var afterGettingVisaForm =
          formGroup.control('afterGettingVisa') as FormGroup;
      List<GettingVisaInfoRequest>? gettingVisaInfo = [];

      afterGettingVisaForm.control('vasaInfo').value.forEach(
        (e) async {
          String? visaPageFileName;
          if (e['visaPageFileName'] != null) {
            FileSelect docFile = e['visaPageFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                visaPageFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              visaPageFileName = docFile.url;
            }
          }

          String? landingPermitFileName;
          if (e['landingPermitFileName'] != null) {
            FileSelect docFile = e['landingPermitFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                landingPermitFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              landingPermitFileName = docFile.url;
            }
          }
          gettingVisaInfo.add(GettingVisaInfoRequest(
            visaPage: e['visaPage'],
            visaPageFileName: visaPageFileName,
            landingPermit: e['landingPermit'],
            landingPermitFileName: landingPermitFileName,
          ));
        },
      );

      List<TicketRequest>? ticket = [];

      afterGettingVisaForm.control('ticket').value.forEach(
        (e) async {
          String? planeTicketForYourVisitToJapanFileName;
          if (e['planeTicketForYourVisitToJapanFileName'] != null) {
            FileSelect docFile = e['planeTicketForYourVisitToJapanFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                planeTicketForYourVisitToJapanFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              planeTicketForYourVisitToJapanFileName = docFile.url;
            }
          }
          ticket.add(
            TicketRequest(
              planeTicketForYourVisitToJapan:
                  e['planeTicketForYourVisitToJapan'],
              planeTicketForYourVisitToJapanFileName:
                  planeTicketForYourVisitToJapanFileName,
            ),
          );
        },
      );

      List<TicketBackRequest>? ticketBack = [];

      afterGettingVisaForm.control('ticketBack').value.forEach(
        (e) async {
          String? returnFlightTicketFileName;
          if (e['returnFlightTicketFileName'] != null) {
            FileSelect docFile = e['returnFlightTicketFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                returnFlightTicketFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              returnFlightTicketFileName = docFile.url;
            }
          }
          ticketBack.add(
            TicketBackRequest(
              returnFlightTicket: e['returnFlightTicket'],
              returnFlightTicketFileName: returnFlightTicketFileName,
            ),
          );
        },
      );

      List<BoardingPassRequest>? boardingPass = [];

      afterGettingVisaForm.control('boardingPass').value.forEach(
        (e) async {
          String? boardingPassForReturnFlightFileName;
          if (e['boardingPassForReturnFlightFileName'] != null) {
            FileSelect docFile = e['boardingPassForReturnFlightFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                boardingPassForReturnFlightFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              boardingPassForReturnFlightFileName = docFile.url;
            }
          }
          boardingPass.add(BoardingPassRequest(
            boardingPassForReturnFlight: e['boardingPassForReturnFlight'],
            boardingPassForReturnFlightFileName:
                boardingPassForReturnFlightFileName,
          ));
        },
      );

      String? certificateOfEligibilityFileName;
      if (afterGettingVisaForm
              .control('certificateOfEligibilityFileName')
              .value !=
          null) {
        FileSelect docFile = afterGettingVisaForm
            .control('certificateOfEligibilityFileName')
            .value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            certificateOfEligibilityFileName = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          certificateOfEligibilityFileName = docFile.url;
        }
      }

      AfterGettingVisaRequest afterGettingVisa = AfterGettingVisaRequest(
        vasaInfo: gettingVisaInfo,
        ticket: ticket,
        ticketBack: ticketBack,
        certificateOfEligibility:
            afterGettingVisaForm.control('certificateOfEligibility').value,
        certificateOfEligibilityFileName: certificateOfEligibilityFileName,
      );

      //travel_companion
      var travelCompanionForm =
          formGroup.control('travel_companion') as FormGroup;
      List<TravelInfoRequest>? compationTravelInfo = [];

      travelCompanionForm.control('travelInfo').value.forEach(
        (e) {
          compationTravelInfo.add(
            TravelInfoRequest(
              landingPermissionDate: e['landingPermissionDate'],
              visaValidityPeriodExpirationDate:
                  e['visaValidityPeriodExpirationDate'],
              dateOfEntryIntoJapan: e['dateOfEntryIntoJapan'],
              departureDateFromJapan: e['departureDateFromJapan'],
              departureIn: e['departureIn'],
              arrivalIn: e['arrivalIn'],
              flightNumberIn: e['flightNumberIn'],
              departureTimeIn: e['departureTimeIn'],
              arrivalTimeIn: e['arrivalTimeIn'],
              flightNumberOut: e['flightNumberOut'],
              departureTimeOut: e['departureTimeOut'],
              departureOut: e['departureOut'],
              arrivalOut: e['arrivalOut'],
              seatNumberOut: e['seatNumberOut'],
              remarks: e['remarks'],
            ),
          );
        },
      );

      List<GettingVisaInfoRequest>? compationVisaInfo = [];

      travelCompanionForm.control('vasaInfo').value.forEach(
        (e) async {
          String? visaPageFileName;
          if (e['visaPageFileName'] != null) {
            FileSelect docFile = e['visaPageFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                visaPageFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              visaPageFileName = docFile.url;
            }
          }

          String? landingPermitFileName;
          if (e['landingPermitFileName'] != null) {
            FileSelect docFile = e['landingPermitFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                landingPermitFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              landingPermitFileName = docFile.url;
            }
          }
          compationVisaInfo.add(GettingVisaInfoRequest(
            visaPage: e['visaPage'],
            visaPageFileName: visaPageFileName,
            landingPermit: e['landingPermit'],
            landingPermitFileName: landingPermitFileName,
          ));
        },
      );

      MedicalVisaTravelCompanionRequest travelCompanion =
          MedicalVisaTravelCompanionRequest(
        nameRomaji: travelCompanionForm.control('nameRomaji').value,
        dateBirth: travelCompanionForm.control('dateBirth').value,
        age: travelCompanionForm.control('age').value,
        sex: travelCompanionForm.control('sex').value,
        addressArea: travelCompanionForm.control('addressArea').value,
        numberPassport: travelCompanionForm.control('numberPassport').value,
        travelInfo: compationTravelInfo,
        travelRemarks: travelCompanionForm.control('travelRemarks').value,
        visaWithdrawalTarget:
            travelCompanionForm.control('visaWithdrawalTarget').value,
        reason: travelCompanionForm.control('remarks').value,
        vasaInfo: compationVisaInfo,
        ticket: ticket,
        ticketBack: ticketBack,
        boardingPass: boardingPass,
        certificateOfEligibility:
            travelCompanionForm.control('certificateOfEligibility').value,
        certificateOfEligibilityFileName: certificateOfEligibilityFileName,
      );

      //necessaryInJapan
      var formNequiredInJapan =
          formGroup.control('necessaryInJapan') as FormGroup;
      List<VisaInfoRequest> neceessaryVisaInfo = [];

      formNequiredInJapan.control('visaInfo').value.forEach(
        (e) async {
          String? letterOfGuaranteeFileSelect;
          if (e['letterOfGuaranteeFileSelect'] != null) {
            FileSelect docFile = e['letterOfGuaranteeFileSelect'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                letterOfGuaranteeFileSelect = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              letterOfGuaranteeFileSelect = docFile.url;
            }
          }
          String? passportFileSelect;
          if (e['passportFileSelect'] != null) {
            FileSelect docFile = e['passportFileSelect'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                passportFileSelect = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              passportFileSelect = docFile.url;
            }
          }

          VisaInfoRequest(
            passportDate: e['passportDate'],
            passportFileSelect: passportFileSelect,
            letterOfGuaranteeDate: e['letterOfGuaranteeDate'],
            letterOfGuaranteeFileSelect: letterOfGuaranteeFileSelect,
            sendBy: e['sendBy'],
            byEMS: e['byEMS'],
            byFedex: e['byFedex'],
            byothers: e['byothers'],
          );
        },
      );

      List<ScheduleRequest>? neceessarySchedule = [];

      formNequiredInJapan.control('schedule').value.forEach((e) {
        neceessarySchedule.add(
          ScheduleRequest(
            treatmentSchedule: e['treatmentSchedule'],
            treatmentScheduleFileSelect: e['treatmentScheduleFileSelect'],
          ),
        );
      });

      String? necessaryStatementOfReasonsFileSelect;
      if (formNequiredInJapan.control('statementOfReasonsFileSelect').value !=
          null) {
        FileSelect docFile =
            formNequiredInJapan.control('statementOfReasonsFileSelect').value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            necessaryStatementOfReasonsFileSelect = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          necessaryStatementOfReasonsFileSelect = docFile.url;
        }
      }

      String? necessaryTravelCompanionListFileSelect;
      if (formNequiredInJapan.control('travelCompanionListFileSelect').value !=
          null) {
        FileSelect docFile =
            formNequiredInJapan.control('travelCompanionListFileSelect').value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            necessaryTravelCompanionListFileSelect = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          necessaryTravelCompanionListFileSelect = docFile.url;
        }
      }

      MedicalVisaNecessaryInJapanRequest necessaryRequiredInJapan =
          MedicalVisaNecessaryInJapanRequest(
        visaInfo: neceessaryVisaInfo,
        schedule: null,
        statementOfReasonsDate:
            formRequiredInJapan.control('statementOfReasonsDate').value,
        statementOfReasonsDateFileName: necessaryStatementOfReasonsFileSelect,
        travelCompanionListDate:
            formRequiredInJapan.control('travelCompanionListDate').value,
        travelCompanionListFileName: necessaryTravelCompanionListFileSelect,
      );

      //GettingVisaInfoRequestFinal

      var afterGettingVisaFinalForm =
          formGroup.control('afterGettingVisa') as FormGroup;
      List<GettingVisaInfoRequest>? gettingVisaFinalInfo = [];

      afterGettingVisaFinalForm.control('vasaInfo').value.forEach(
        (e) async {
          String? visaPageFileName;
          if (e['visaPageFileName'] != null) {
            FileSelect docFile = e['visaPageFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                visaPageFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              visaPageFileName = docFile.url;
            }
          }

          String? landingPermitFileName;
          if (e['landingPermitFileName'] != null) {
            FileSelect docFile = e['landingPermitFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                landingPermitFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              landingPermitFileName = docFile.url;
            }
          }
          gettingVisaFinalInfo.add(GettingVisaInfoRequest(
            visaPage: e['visaPage'],
            visaPageFileName: visaPageFileName,
            landingPermit: e['landingPermit'],
            landingPermitFileName: landingPermitFileName,
          ));
        },
      );

      List<TicketRequest>? ticketFinal = [];

      afterGettingVisaFinalForm.control('ticket').value.forEach(
        (e) async {
          String? planeTicketForYourVisitToJapanFileName;
          if (e['planeTicketForYourVisitToJapanFileName'] != null) {
            FileSelect docFile = e['planeTicketForYourVisitToJapanFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                planeTicketForYourVisitToJapanFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              planeTicketForYourVisitToJapanFileName = docFile.url;
            }
          }
          ticketFinal.add(
            TicketRequest(
              planeTicketForYourVisitToJapan:
                  e['planeTicketForYourVisitToJapan'],
              planeTicketForYourVisitToJapanFileName:
                  planeTicketForYourVisitToJapanFileName,
            ),
          );
        },
      );

      List<TicketBackRequest>? ticketBackFinal = [];

      afterGettingVisaFinalForm.control('ticketBack').value.forEach(
        (e) async {
          String? returnFlightTicketFileName;
          if (e['returnFlightTicketFileName'] != null) {
            FileSelect docFile = e['returnFlightTicketFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                returnFlightTicketFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              returnFlightTicketFileName = docFile.url;
            }
          }
          ticketBackFinal.add(
            TicketBackRequest(
              returnFlightTicket: e['returnFlightTicket'],
              returnFlightTicketFileName: returnFlightTicketFileName,
            ),
          );
        },
      );

      List<BoardingPassRequest>? boardingPassFinal = [];

      afterGettingVisaFinalForm.control('boardingPass').value.forEach(
        (e) async {
          String? boardingPassForReturnFlightFileName;
          if (e['boardingPassForReturnFlightFileName'] != null) {
            FileSelect docFile = e['boardingPassForReturnFlightFileName'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  base64Image,
                  docFile.filename!,
                );
                boardingPassForReturnFlightFileName = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              boardingPassForReturnFlightFileName = docFile.url;
            }
          }
          boardingPassFinal.add(BoardingPassRequest(
            boardingPassForReturnFlight: e['boardingPassForReturnFlight'],
            boardingPassForReturnFlightFileName:
                boardingPassForReturnFlightFileName,
          ));
        },
      );

      String? certificateOfEligibilityFileNameFinal;
      if (afterGettingVisaFinalForm
              .control('certificateOfEligibilityFileName')
              .value !=
          null) {
        FileSelect docFile = afterGettingVisaForm
            .control('certificateOfEligibilityFileName')
            .value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            certificateOfEligibilityFileNameFinal = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          certificateOfEligibilityFileNameFinal = docFile.url;
        }
      }

      MedicalAfterGettingVisaFinalRequest afterGettingVisaFinal =
          MedicalAfterGettingVisaFinalRequest(
        vasaInfo: gettingVisaInfo,
        ticket: ticket,
        ticketBack: ticketBack,
        certificateOfEligibility:
            afterGettingVisaForm.control('certificateOfEligibility').value,
        certificateOfEligibilityFileName: certificateOfEligibilityFileNameFinal,
      );

      final response = await patientRepository.postMedicalRecordVisa(
        MedicalRecordVisaRequest(
          medicalRecord: formGroup.control('medicalRecord').value,
          personal: personal,
          stayPeriod: stayPeriod,
          requiredInJapan: requiredInJapan,
          visaWithdrawal: visaWithdrawal,
          afterGettingVisa: afterGettingVisa,
          travelCompanion: travelCompanion,
          necessaryInJapan: necessaryRequiredInJapan,
          afterGettingVisaFinal: afterGettingVisaFinal,
        ),
      );
      logger.d(personal.toList());
      submitMedicalRecordVisaData.value = AsyncData(data: response);
      medicalRecordVisaData.value = AsyncData(data: response);
    } catch (e) {
      logger.d('Error ${e.toString()}');
      submitMedicalRecordVisaData.value = AsyncData(error: e);
    }
  }
}
