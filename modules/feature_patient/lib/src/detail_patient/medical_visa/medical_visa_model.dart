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
  Future<void> fetchMedicalRecordVisa(FormGroup formGroup) async {
    try {
      medicalRecordVisaData.value = const AsyncData(loading: true);
      final response = await patientRepository.getMedicalRecordVisa();
      insertData(formGroup, response);
      medicalRecordVisaData.value = AsyncData(data: response);
      logger.d(response.toJson());
    } catch (e) {
      logger.d(e);
      medicalRecordVisaData.value = AsyncData(error: e);
    }
  }

  void insertData(FormGroup formGroup, MedicalRecordVisaResponse response) {
    for (var elements in response.personal!) {
      FormGroup(
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
          'accompanyingPersonsNumber':
              FormControl<String>(value: elements.accompanyingPersonsNumber),
          'visaIssuingOverseasEstablishments': FormControl<String>(
              value: elements.visaIssuingOverseasEstablishments),
          'remarks': FormControl<String>(value: elements.remarks),
          'paymentStatus': FormControl<String>(value: elements.paymentStatus),
        },
      );
    }
    formGroup.control('personal').value.forEach((e) {});
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

      // String? letterOfGuaranteeFileSelect;
      // if (formRequiredInJapan.control('letterOfGuaranteeFileSelect').value !=
      //     null) {
      //   FileSelect docFile =
      //       formRequiredInJapan.control('letterOfGuaranteeFileSelect').value;
      //   if (docFile.file != null) {
      //     try {
      //       String base64Image = base64Encode(docFile.file!);
      //       FileResponse fileData = await patientRepository.uploadFileBase64(
      //         base64Image,
      //         docFile.filename!,
      //       );
      //       letterOfGuaranteeFileSelect = fileData.filename;
      //     } catch (e) {
      //       logger.e(e);
      //     }
      //   } else {
      //     letterOfGuaranteeFileSelect = docFile.url;
      //   }
      // }
      formRequiredInJapan.control('visaInfo').value.forEach(
        (e) {
          VisaInfoRequest(
            passportDate: e['passportDate'],
            passportFileSelect: 'test',
            letterOfGuaranteeDate: e['letterOfGuaranteeDate'],
            letterOfGuaranteeFileSelect: 'test',
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

      // String? visaPageFileName;
      // if (afterGettingVisaForm.control('visaPageFileName').value != null) {
      //   FileSelect docFile =
      //       afterGettingVisaForm.control('visaPageFileName').value;
      //   if (docFile.file != null) {
      //     try {
      //       String base64Image = base64Encode(docFile.file!);
      //       FileResponse fileData = await patientRepository.uploadFileBase64(
      //         base64Image,
      //         docFile.filename!,
      //       );
      //       visaPageFileName = fileData.filename;
      //     } catch (e) {
      //       logger.e(e);
      //     }
      //   } else {
      //     visaPageFileName = docFile.url;
      //   }
      // }

      // String? landingPermitFileName;
      // if (afterGettingVisaForm.control('landingPermitFileName').value !=
      //     null) {
      //   FileSelect docFile =
      //       afterGettingVisaForm.control('landingPermitFileName').value;
      //   if (docFile.file != null) {
      //     try {
      //       String base64Image = base64Encode(docFile.file!);
      //       FileResponse fileData = await patientRepository.uploadFileBase64(
      //         base64Image,
      //         docFile.filename!,
      //       );
      //       landingPermitFileName = fileData.filename;
      //     } catch (e) {
      //       logger.e(e);
      //     }
      //   } else {
      //     landingPermitFileName = docFile.url;
      //   }
      // }
      afterGettingVisaForm.control('vasaInfo').value.forEach(
        (e) {
          gettingVisaInfo.add(GettingVisaInfoRequest(
            visaPage: e['visaPage'],
            visaPageFileName: 'test',
            landingPermit: e['landingPermit'],
            landingPermitFileName: 'test',
          ));
        },
      );

      List<TicketRequest>? ticket = [];

      // String? planeTicketForYourVisitToJapanFileName;
      // if (afterGettingVisaForm
      //         .control('planeTicketForYourVisitToJapanFileName')
      //         .value !=
      //     null) {
      //   FileSelect docFile = afterGettingVisaForm
      //       .control('planeTicketForYourVisitToJapanFileName')
      //       .value;
      //   if (docFile.file != null) {
      //     try {
      //       String base64Image = base64Encode(docFile.file!);
      //       FileResponse fileData = await patientRepository.uploadFileBase64(
      //         base64Image,
      //         docFile.filename!,
      //       );
      //       planeTicketForYourVisitToJapanFileName = fileData.filename;
      //     } catch (e) {
      //       logger.e(e);
      //     }
      //   } else {
      //     planeTicketForYourVisitToJapanFileName = docFile.url;
      //   }
      // }
      afterGettingVisaForm.control('ticket').value.forEach(
        (e) {
          ticket.add(
            TicketRequest(
              planeTicketForYourVisitToJapan:
                  e['planeTicketForYourVisitToJapan'],
              planeTicketForYourVisitToJapanFileName: 'test',
            ),
          );
        },
      );

      List<TicketBackRequest>? ticketBack = [];

      // String? returnFlightTicketFileName;
      // if (afterGettingVisaForm.control('returnFlightTicketFileName').value !=
      //     null) {
      //   FileSelect docFile =
      //       afterGettingVisaForm.control('returnFlightTicketFileName').value;
      //   if (docFile.file != null) {
      //     try {
      //       String base64Image = base64Encode(docFile.file!);
      //       FileResponse fileData = await patientRepository.uploadFileBase64(
      //         base64Image,
      //         docFile.filename!,
      //       );
      //       returnFlightTicketFileName = fileData.filename;
      //     } catch (e) {
      //       logger.e(e);
      //     }
      //   } else {
      //     returnFlightTicketFileName = docFile.url;
      //   }
      // }
      afterGettingVisaForm.control('ticketBack').value.forEach(
        (e) {
          ticketBack.add(
            TicketBackRequest(
              returnFlightTicket: e['returnFlightTicket'],
              returnFlightTicketFileName: 'test',
            ),
          );
        },
      );

      List<BoardingPassRequest>? boardingPass = [];

      // String? boardingPassForReturnFlightFileName;
      // if (afterGettingVisaForm
      //         .control('boardingPassForReturnFlightFileName')
      //         .value !=
      //     null) {
      //   FileSelect docFile = afterGettingVisaForm
      //       .control('boardingPassForReturnFlightFileName')
      //       .value;
      //   if (docFile.file != null) {
      //     try {
      //       String base64Image = base64Encode(docFile.file!);
      //       FileResponse fileData = await patientRepository.uploadFileBase64(
      //         base64Image,
      //         docFile.filename!,
      //       );
      //       boardingPassForReturnFlightFileName = fileData.filename;
      //     } catch (e) {
      //       logger.e(e);
      //     }
      //   } else {
      //     boardingPassForReturnFlightFileName = docFile.url;
      //   }
      // }
      afterGettingVisaForm.control('boardingPass').value.forEach(
        (e) {
          boardingPass.add(BoardingPassRequest(
            boardingPassForReturnFlight: e['boardingPassForReturnFlight'],
            boardingPassForReturnFlightFileName: 'test',
          ));
        },
      );

      // String? certificateOfEligibilityFileName;
      // if (afterGettingVisaForm
      //         .control('certificateOfEligibilityFileName')
      //         .value !=
      //     null) {
      //   FileSelect docFile = afterGettingVisaForm
      //       .control('certificateOfEligibilityFileName')
      //       .value;
      //   if (docFile.file != null) {
      //     try {
      //       String base64Image = base64Encode(docFile.file!);
      //       FileResponse fileData = await patientRepository.uploadFileBase64(
      //         base64Image,
      //         docFile.filename!,
      //       );
      //       certificateOfEligibilityFileName = fileData.filename;
      //     } catch (e) {
      //       logger.e(e);
      //     }
      //   } else {
      //     certificateOfEligibilityFileName = docFile.url;
      //   }
      // }

      AfterGettingVisaRequest afterGettingVisa = AfterGettingVisaRequest(
        vasaInfo: gettingVisaInfo,
        ticket: ticket,
        ticketBack: ticketBack,
        certificateOfEligibility:
            afterGettingVisaForm.control('certificateOfEligibility').value,
        certificateOfEligibilityFileName: 'test',
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

      // String? visaPageFileName;
      // if (travelCompanionForm.control('visaPageFileName').value != null) {
      //   FileSelect docFile =
      //       travelCompanionForm.control('visaPageFileName').value;
      //   if (docFile.file != null) {
      //     try {
      //       String base64Image = base64Encode(docFile.file!);
      //       FileResponse fileData = await patientRepository.uploadFileBase64(
      //         base64Image,
      //         docFile.filename!,
      //       );
      //       visaPageFileName = fileData.filename;
      //     } catch (e) {
      //       logger.e(e);
      //     }
      //   } else {
      //     visaPageFileName = docFile.url;
      //   }
      // }

      // String? landingPermitFileName;
      // if (travelCompanionForm.control('landingPermitFileName').value != null) {
      //   FileSelect docFile =
      //       travelCompanionForm.control('landingPermitFileName').value;
      //   if (docFile.file != null) {
      //     try {
      //       String base64Image = base64Encode(docFile.file!);
      //       FileResponse fileData = await patientRepository.uploadFileBase64(
      //         base64Image,
      //         docFile.filename!,
      //       );
      //       landingPermitFileName = fileData.filename;
      //     } catch (e) {
      //       logger.e(e);
      //     }
      //   } else {
      //     landingPermitFileName = docFile.url;
      //   }
      // }
      travelCompanionForm.control('vasaInfo').value.forEach(
        (e) {
          compationVisaInfo.add(GettingVisaInfoRequest(
            visaPage: e['visaPage'],
            visaPageFileName: 'test.png',
            landingPermit: e['landingPermit'],
            landingPermitFileName: 'test.png',
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
        certificateOfEligibilityFileName: 'test.png',
      );

      final response = await patientRepository.postMedicalRecordVisa(
        MedicalRecordVisaRequest(
          personal: personal,
          stayPeriod: stayPeriod,
          requiredInJapan: requiredInJapan,
          visaWithdrawal: visaWithdrawal,
          afterGettingVisa: afterGettingVisa,
          travelCompanion: travelCompanion,
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
