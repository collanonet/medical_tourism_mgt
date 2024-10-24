// Flutter imports:
import 'dart:convert';

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

  Future<void> fetchData(FormGroup formGroup) async {
    try {
      await fetchMedicalVisaPersonal(
          formGroup.control('personal') as FormArray);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<List<MedicalVisaPersonalResponse>>> personalData =
      ValueNotifier(const AsyncData());
  Future<void> fetchMedicalVisaPersonal(FormArray formArray) async {
    try {
      personalData.value = const AsyncData(loading: true);
      final response = await patientRepository.getMedicalVisaPersonal();
      insertPersonal(formArray, response);
      personalData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      personalData.value = AsyncData(error: e);
    }
  }

  void insertPersonal(
      FormArray formArray, List<MedicalVisaPersonalResponse> elements) {
    if (elements.isNotEmpty) {
      formArray.clear();
      for (var element in elements) {
        formArray.add(
          FormGroup(
            {
              'medicalVisa': FormControl<String>(value: element.medicalVisa),
              'applicationDate': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
                value: element.applicationDate,
              ),
              'issueDate': FormControl<DateTime>(validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ], value: element.issueDate),
              'expirationDate': FormControl<DateTime>(
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
                value: element.expirationDate,
              ),
              'accompanyingPersonsNumber':
                  FormControl<String>(value: element.accompanyingPersonsNumber),
              'visaIssuingOverseasEstablishments': FormControl<String>(
                  value: element.visaIssuingOverseasEstablishments),
              'remarks': FormControl<String>(value: element.remarks),
              'paymentStatus':
                  FormControl<String>(value: element.paymentStatus),
            },
          ),
        );
      }
    }
  }

  ValueNotifier<AsyncData<List<MedicalVisaStayPeriodResponse>>> stayPeriodData =
      ValueNotifier(const AsyncData());
  Future<void> fetchMedicalVisaStayPeriod() async {
    try {
      stayPeriodData.value = const AsyncData(loading: true);
      final response = await patientRepository.getMedicalVisaStayPeriod();
      stayPeriodData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      stayPeriodData.value = AsyncData(error: e);
    }
  }

  void insertStayPeriod(
      FormArray formArray, List<MedicalVisaStayPeriodResponse> elements) {
    try {
      if (elements.isNotEmpty) {
        formArray.clear();
        for (var element in elements) {
          formArray.add(
            FormGroup(
              {
                'stayStartingDatePersonalReference': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                  value: element.stayStartingDatePersonalReference,
                ),
                'stayEndDate': FormControl<DateTime>(
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                  value: element.stayEndDate,
                ),
              },
            ),
          );
        }
      }
    } catch (e) {
      logger.e(e);
    }
  }

  ValueNotifier<AsyncData<MedicalVisaRequiredInJapanResponse>>
      requiredInJapanData = ValueNotifier(const AsyncData());
  Future<void> fetchMedicalRequiredInJapan() async {
    try {
      requiredInJapanData.value = const AsyncData(loading: true);
      final response = await patientRepository.getMedicalRequiredInJapan();
      requiredInJapanData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      requiredInJapanData.value = AsyncData(error: e);
    }
  }

  void insertRequiredInJapan(
      FormGroup formGroup, MedicalVisaRequiredInJapanResponse response) {
    try {} catch (e) {
      logger.e(e);
    }
  }

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());
  Future<void> submitMedicalVisa(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      await submitMedicalVisaPersonal(formGroup);
      await submitStayPeriod(formGroup);
      await submitRequiredInJapan(formGroup.control('requiredInJapan') as FormGroup);
      await submitMedicalVisa(formGroup.control('visaWithdrawal') as FormGroup);
      await submitAfterGettingVisa(formGroup.control('afterGettingVisa') as FormGroup);
      await submitTravelCompanion(formGroup.control('travel_companion') as FormGroup);
      await submitNecessary(formGroup.control('necessaryInJapan') as FormGroup);
      await submitAfterGettingVisaFinaal(formGroup.control('afterGettingVisaFinal') as FormGroup);
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<MedicalVisaPersonalResponse>> submitPersonalData =
      ValueNotifier(const AsyncData());
  Future<void> submitMedicalVisaPersonal(FormGroup formGroup) async {
    try {
      submitPersonalData.value = const AsyncData(loading: true);
      await formGroup.control('personal').value.forEach(
        (e) async {
          MedicalVisaPersonalRequest request = MedicalVisaPersonalRequest(
            medicalVisa: e['medicalVisa'],
            applicationDate: e['applicationDate'],
            issueDate: e['issueDate'],
            expirationDate: e['expirationDate'],
            accompanyingPersonsNumber: e['accompanyingPersonsNumber'],
            visaIssuingOverseasEstablishments:
                e['visaIssuingOverseasEstablishments'],
            remarks: e['remarks'],
            paymentStatus: e['paymentStatus'],
          );
          final response =
              await patientRepository.postMedicalVisaPersonal(request);
          submitPersonalData.value = AsyncData(data: response);
        },
      );
    } catch (e) {
      logger.d(e);
      submitPersonalData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<MedicalVisaStayPeriodResponse>> submitStayPeriodData =
      ValueNotifier(const AsyncData());
  Future<void> submitStayPeriod(FormGroup formGroup) async {
    try {
      submitStayPeriodData.value = const AsyncData(loading: true);
      await formGroup.control('stayPeriod').value.forEach(
        (e) async {
          MedicalVisaStayPeriodRequest request = MedicalVisaStayPeriodRequest(
            stayEndDate: e['stayEndDate'],
            stayStartingDatePersonalReference:
                e['stayStartingDatePersonalReference'],
          );
          final response =
              await patientRepository.postMedicalVisaStayPeriod(request);
          submitStayPeriodData.value = AsyncData(data: response);
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  ValueNotifier<AsyncData<MedicalVisaRequiredInJapanResponse>>
      submitRequiredInJapanData = ValueNotifier(const AsyncData());
  Future<void> submitRequiredInJapan(FormGroup formGroup) async {
    try {
      submitRequiredInJapanData.value = const AsyncData(loading: true);
      List<VisaInfoRequest>? visaInfo = [];
      if (visaInfo.isNotEmpty) {
        String? passportFileSelect;
        if (formGroup.control('passportFileSelect').value != null) {
          FileSelect docFile = formGroup.control('passportFileSelect').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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

        String? letterOfGuaranteeFileSelect;
        if (formGroup.control('letterOfGuaranteeFileSelect').value != null) {
          FileSelect docFile =
              formGroup.control('letterOfGuaranteeFileSelect').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('visaInfo').value.forEach((e) {
          visaInfo.add(
            VisaInfoRequest(
              passportDate: e['passportDate'],
              passportFileSelect: passportFileSelect,
              letterOfGuaranteeDate: e['letterOfGuaranteeDate'],
              letterOfGuaranteeFileSelect: letterOfGuaranteeFileSelect,
              sendBy: e['sendBy'],
              byEMS: e['byEMS'],
              byFedex: e['byFedex'],
              byothers: e['byothers'],
            ),
          );
        });
      }

      List<ScheduleRequest>? schedule = [];
      if (schedule.isNotEmpty) {
        formGroup.control('schedule').value.forEach((e) {
          schedule.add(
            ScheduleRequest(
              treatmentSchedule: e['treatmentSchedule'],
              treatmentScheduleFileSelect: e['treatmentScheduleFileSelect'],
            ),
          );
        });
      }
      String? statementOfReasonsFileSelect;
      if (formGroup.control('statementOfReasonsFileSelect').value != null) {
        FileSelect docFile =
            formGroup.control('statementOfReasonsFileSelect').value;
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
      if (formGroup.control('travelCompanionListFileSelect').value != null) {
        FileSelect docFile =
            formGroup.control('travelCompanionListFileSelect').value;
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
        formGroup.control('travelInfo').value.forEach((e) {
          travelInfo.add(TravelInfoRequest(
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
          ));
        });
      }

      RequiredInJapan required = RequiredInJapan(
        visaInfo: visaInfo,
        schedule: schedule,
        statementOfReasonsDate:
            formGroup.control('statementOfReasonsDate').value,
        statementOfReasonsFileSelect: statementOfReasonsFileSelect,
        travelCompanionListDate:
            formGroup.control('travelCompanionListDate').value,
        travelCompanionListFileSelect: travelCompanionListFileSelect,
        travelInfo: travelInfo,
      );
      final response =
          await patientRepository.popMedicalVisaRequiredInJapan(required);
      submitRequiredInJapanData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submitRequiredInJapanData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<MedicalVisaVisaWithdrawalResponse>>
      submitVisaWithdrawalData = ValueNotifier(const AsyncData());
  Future<void> submitVisaWithdrawal(FormGroup formGroup) async {
    try {
      submitVisaWithdrawalData.value = const AsyncData(loading: true);
      final response = await patientRepository.postMedicalVisaWithdrawal(
          MedicalVisaWithdrawalRequest(
              subjectVisaWithdrawal:
                  formGroup.control('subjectVisaWithdrawal').value,
              deathOrOccurrenceEventDate:
                  formGroup.control('deathOrOccurrenceEventDate').value,
              remarks: formGroup.control('remarks').value));
      submitVisaWithdrawalData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submitVisaWithdrawalData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<AfterGettingVisaResponse>>
      submitAfterGettingVisaData = ValueNotifier(const AsyncData());
  Future<void> submitAfterGettingVisa(FormGroup formGroup) async {
    try {
      List<GettingVisaInfoRequest>? visaInfo = [];
      if (visaInfo.isNotEmpty) {
        String? visaPageFileName;
        if (formGroup.control('visaPageFileName').value != null) {
          FileSelect docFile = formGroup.control('visaPageFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        if (formGroup.control('landingPermitFileName').value != null) {
          FileSelect docFile = formGroup.control('landingPermitFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('visaInfo').value.forEach(
          (e) {
            visaInfo.add(GettingVisaInfoRequest(
              visaPage: e['visaPage'],
              visaPageFileName: visaPageFileName,
              landingPermit: e['landingPermit'],
              landingPermitFileName: landingPermitFileName,
            ));
          },
        );
      }

      List<TicketRequest>? ticket = [];
      if (ticket.isNotEmpty) {
        String? planeTicketForYourVisitToJapanFileName;
        if (formGroup.control('planeTicketForYourVisitToJapanFileName').value !=
            null) {
          FileSelect docFile =
              formGroup.control('planeTicketForYourVisitToJapanFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('ticket').value.forEach(
          (e) {
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
      }

      List<TicketBackRequest>? ticketBack = [];
      if (ticket.isNotEmpty) {
        String? returnFlightTicketFileName;
        if (formGroup.control('returnFlightTicketFileName').value != null) {
          FileSelect docFile =
              formGroup.control('returnFlightTicketFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('ticketBack').value.forEach(
          (e) {
            ticketBack.add(
              TicketBackRequest(
                returnFlightTicket: e['returnFlightTicket'],
                returnFlightTicketFileName: returnFlightTicketFileName,
              ),
            );
          },
        );
      }

      List<BoardingPassRequest>? boardingPass = [];
      if (ticket.isNotEmpty) {
        String? boardingPassForReturnFlightFileName;
        if (formGroup.control('boardingPassForReturnFlightFileName').value !=
            null) {
          FileSelect docFile =
              formGroup.control('boardingPassForReturnFlightFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('boardingPass').value.forEach(
          (e) {
            boardingPass.add(BoardingPassRequest(
              boardingPassForReturnFlight: e['boardingPassForReturnFlight'],
              boardingPassForReturnFlightFileName:
                  boardingPassForReturnFlightFileName,
            ));
          },
        );
      }

      String? certificateOfEligibilityFileName;
      if (formGroup.control('certificateOfEligibilityFileName').value != null) {
        FileSelect docFile =
            formGroup.control('certificateOfEligibilityFileName').value;
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

      AfterGettingVisaRequest request = AfterGettingVisaRequest(
        vasaInfo: visaInfo,
        ticket: ticket,
        ticketBack: ticketBack,
        certificateOfEligibility:
            formGroup.control('certificateOfEligibility').value,
        certificateOfEligibilityFileName: certificateOfEligibilityFileName,
      );

      final response = await patientRepository.postAfterGettingVisa(request);
      submitAfterGettingVisaData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
    }
  }

  ValueNotifier<AsyncData<MedicalVisaTravelCompanionResponse>>
      submitTravelCompanionData = ValueNotifier(const AsyncData());
  Future<void> submitTravelCompanion(FormGroup formGroup) async {
    try {
      submitTravelCompanionData.value = const AsyncData(loading: true);
      List<TravelInfoRequest>? travelInfo = [];
      if (travelInfo.isNotEmpty) {
        formGroup.control('travelInfo').value.forEach(
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

      List<GettingVisaInfoRequest>? visaInfo = [];
      if (visaInfo.isNotEmpty) {
        String? visaPageFileName;
        if (formGroup.control('visaPageFileName').value != null) {
          FileSelect docFile = formGroup.control('visaPageFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        if (formGroup.control('landingPermitFileName').value != null) {
          FileSelect docFile = formGroup.control('landingPermitFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('visaInfo').value.forEach(
          (e) {
            visaInfo.add(GettingVisaInfoRequest(
              visaPage: e['visaPage'],
              visaPageFileName: visaPageFileName,
              landingPermit: e['landingPermit'],
              landingPermitFileName: landingPermitFileName,
            ));
          },
        );
      }

      List<TicketRequest>? ticket = [];
      if (ticket.isNotEmpty) {
        String? planeTicketForYourVisitToJapanFileName;
        if (formGroup.control('planeTicketForYourVisitToJapanFileName').value !=
            null) {
          FileSelect docFile =
              formGroup.control('planeTicketForYourVisitToJapanFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('ticket').value.forEach(
          (e) {
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
      }

      List<TicketBackRequest>? ticketBack = [];
      if (ticket.isNotEmpty) {
        String? returnFlightTicketFileName;
        if (formGroup.control('returnFlightTicketFileName').value != null) {
          FileSelect docFile =
              formGroup.control('returnFlightTicketFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('ticketBack').value.forEach(
          (e) {
            ticketBack.add(
              TicketBackRequest(
                returnFlightTicket: e['returnFlightTicket'],
                returnFlightTicketFileName: returnFlightTicketFileName,
              ),
            );
          },
        );
      }

      List<BoardingPassRequest>? boardingPass = [];
      if (ticket.isNotEmpty) {
        String? boardingPassForReturnFlightFileName;
        if (formGroup.control('boardingPassForReturnFlightFileName').value !=
            null) {
          FileSelect docFile =
              formGroup.control('boardingPassForReturnFlightFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('boardingPass').value.forEach(
          (e) {
            boardingPass.add(BoardingPassRequest(
              boardingPassForReturnFlight: e['boardingPassForReturnFlight'],
              boardingPassForReturnFlightFileName:
                  boardingPassForReturnFlightFileName,
            ));
          },
        );
      }

      String? certificateOfEligibilityFileName;
      if (formGroup.control('certificateOfEligibilityFileName').value != null) {
        FileSelect docFile =
            formGroup.control('certificateOfEligibilityFileName').value;
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

      final response = await patientRepository
          .postMedicalVisaTravelCompanion(MedicalVisaTravelCompanionRequest(
        nameRomaji: formGroup.control('nameRomaji').value,
        dateBirth: formGroup.control('dateBirth').value,
        age: formGroup.control('age').value,
        sex: formGroup.control('sex').value,
        addressArea: formGroup.control('addressArea').value,
        numberPassport: formGroup.control('numberPassport').value,
        travelInfo: travelInfo,
        travelRemarks: formGroup.control('travelRemarks').value,
        visaWithdrawalTarget: formGroup.control('visaWithdrawalTarget').value,
        reason: formGroup.control('remarks').value,
        vasaInfo: visaInfo,
        ticket: ticket,
        ticketBack: ticketBack,
        boardingPass: boardingPass,
        certificateOfEligibility:
            formGroup.control('certificateOfEligibility').value,
        certificateOfEligibilityFileName: certificateOfEligibilityFileName,
      ));
      submitTravelCompanionData.value = AsyncData(data: response);
    } catch (e) {
      submitTravelCompanionData.value = AsyncData(error: e.toString());
      logger.e(e);
    }
  }

  ValueNotifier<AsyncData<MedicalVisaNecessaryInJapanResponse>>
      submitNecessaryData = ValueNotifier(const AsyncData());
  Future<void> submitNecessary(FormGroup formGroup) async {
    try {
      submitNecessaryData.value = const AsyncData(loading: true);

      List<GettingVisaInfoRequest>? visaInfo = [];
      if (visaInfo.isNotEmpty) {
        String? visaPageFileName;
        if (formGroup.control('visaPageFileName').value != null) {
          FileSelect docFile = formGroup.control('visaPageFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        if (formGroup.control('landingPermitFileName').value != null) {
          FileSelect docFile = formGroup.control('landingPermitFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('visaInfo').value.forEach(
          (e) {
            visaInfo.add(GettingVisaInfoRequest(
              visaPage: e['visaPage'],
              visaPageFileName: visaPageFileName,
              landingPermit: e['landingPermit'],
              landingPermitFileName: landingPermitFileName,
            ));
          },
        );
      }

      List<ScheduleRequest>? schedule = [];
      if (schedule.isNotEmpty) {
        formGroup.control('schedule').value.forEach((e) {
          schedule.add(
            ScheduleRequest(
              treatmentSchedule: e['treatmentSchedule'],
              treatmentScheduleFileSelect: e['treatmentScheduleFileSelect'],
            ),
          );
        });
      }

      String? statementOfReasonsFileSelect;
      if (formGroup.control('statementOfReasonsFileSelect').value != null) {
        FileSelect docFile =
            formGroup.control('statementOfReasonsFileSelect').value;
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
      if (formGroup.control('travelCompanionListFileSelect').value != null) {
        FileSelect docFile =
            formGroup.control('travelCompanionListFileSelect').value;
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

      MedicalVisaNecessaryInJapanRequest request =
          MedicalVisaNecessaryInJapanRequest(
        visaInfo: visaInfo,
        schedule: null,
        travelCompanionListDate:
            formGroup.control('statementOfReasonsDate').value,
        travelCompanionListFileName: statementOfReasonsFileSelect,
        statementOfReasonsDate:
            formGroup.control('travelCompanionListDate').value,
        statementOfReasonsDateFileName: travelCompanionListFileSelect,
      );
      final response =
          await patientRepository.postMedicalVisaNecessaryInJapan(request);
      submitNecessaryData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      submitNecessaryData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<MedicalVisaAfterGettingVisaResponse>>
      submitAfterGettingVisaFinalData = ValueNotifier(const AsyncData());
  Future<void> submitAfterGettingVisaFinaal(FormGroup formGroup) async {
    try {
      submitAfterGettingVisaFinalData.value = const AsyncData(loading: true);
      List<GettingVisaInfoRequest>? visaInfo = [];
      if (visaInfo.isNotEmpty) {
        String? visaPageFileName;
        if (formGroup.control('visaPageFileName').value != null) {
          FileSelect docFile = formGroup.control('visaPageFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        if (formGroup.control('landingPermitFileName').value != null) {
          FileSelect docFile = formGroup.control('landingPermitFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('visaInfo').value.forEach(
          (e) {
            visaInfo.add(GettingVisaInfoRequest(
              visaPage: e['visaPage'],
              visaPageFileName: visaPageFileName,
              landingPermit: e['landingPermit'],
              landingPermitFileName: landingPermitFileName,
            ));
          },
        );
      }

      List<TicketRequest>? ticket = [];
      if (ticket.isNotEmpty) {
        String? planeTicketForYourVisitToJapanFileName;
        if (formGroup.control('planeTicketForYourVisitToJapanFileName').value !=
            null) {
          FileSelect docFile =
              formGroup.control('planeTicketForYourVisitToJapanFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('ticket').value.forEach(
          (e) {
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
      }

      List<TicketBackRequest>? ticketBack = [];
      if (ticket.isNotEmpty) {
        String? returnFlightTicketFileName;
        if (formGroup.control('returnFlightTicketFileName').value != null) {
          FileSelect docFile =
              formGroup.control('returnFlightTicketFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('ticketBack').value.forEach(
          (e) {
            ticketBack.add(
              TicketBackRequest(
                returnFlightTicket: e['returnFlightTicket'],
                returnFlightTicketFileName: returnFlightTicketFileName,
              ),
            );
          },
        );
      }

      List<BoardingPassRequest>? boardingPass = [];
      if (ticket.isNotEmpty) {
        String? boardingPassForReturnFlightFileName;
        if (formGroup.control('boardingPassForReturnFlightFileName').value !=
            null) {
          FileSelect docFile =
              formGroup.control('boardingPassForReturnFlightFileName').value;
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
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
        formGroup.control('boardingPass').value.forEach(
          (e) {
            boardingPass.add(BoardingPassRequest(
              boardingPassForReturnFlight: e['boardingPassForReturnFlight'],
              boardingPassForReturnFlightFileName:
                  boardingPassForReturnFlightFileName,
            ));
          },
        );
      }

      String? certificateOfEligibilityFileName;
      if (formGroup.control('certificateOfEligibilityFileName').value != null) {
        FileSelect docFile =
            formGroup.control('certificateOfEligibilityFileName').value;
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
      MedicalAfterGettingVisaFinalRequest request =
          MedicalAfterGettingVisaFinalRequest(
        vasaInfo: visaInfo,
        ticket: ticket,
        ticketBack: ticketBack,
        boardingPass: boardingPass,
        certificateOfEligibility:
            formGroup.control('certificateOfEligibility').value,
        certificateOfEligibilityFileName: certificateOfEligibilityFileName,
      );
      final response =
          await patientRepository.postAfterGettingVisaFinal(request);
      submitAfterGettingVisaFinalData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      submitAfterGettingVisaFinalData.value = AsyncData(error: e.toString());
    }
  }
}
