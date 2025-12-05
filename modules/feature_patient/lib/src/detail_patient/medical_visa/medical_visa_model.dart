// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
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
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        logger.d('MedicalRecordVisaData not found (404), treating as new entry.');
        medicalRecordVisaData.value = const AsyncData(data: null);
      } else {
        logger.d(e);
        medicalRecordVisaData.value = AsyncData(error: e);
      }
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
    if (response.personal?.isNotEmpty == true) {
      personalForm.clear();
      personalForm.reset();
      for (MedicalVisaPersonalResponse elements in response.personal ?? []) {
        personalForm.add(
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
              'accompanyingPersonsNumber': FormControl<String>(
                value: elements.accompanyingPersonsNumber,
              ),
              'visaIssuingOverseasEstablishments': FormControl<String>(
                value: elements.visaIssuingOverseasEstablishments,
              ),
              'remarks': FormControl<String>(
                value: elements.remarks,
              ),
              'visaPageFileName': FormControl<FileSelect>(
                value: elements.visaPageFileName != null
                    ? FileSelect(
                        url: elements.visaPageFileName,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }

    FormArray stayPeriodForm = formGroup.control('stayPeriod') as FormArray;
    if (response.stayPeriod?.isNotEmpty == true) {
      stayPeriodForm.clear();
      stayPeriodForm.reset();
      for (MedicalVisaStayPeriodResponse element in response.stayPeriod ?? []) {
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
                value: element.stayEndDate,
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
    }

    // end insert data to form personal

    FormGroup requiredInJapanForm =
        formGroup.control('requiredInJapan') as FormGroup;
    FormArray requiredInJapanVisaInfo =
        requiredInJapanForm.control('visaInfo') as FormArray;
    FormArray requiredInJapanSchedule =
        requiredInJapanForm.control('schedule') as FormArray;
    if (response.requiredInJapan?.visaInfo?.isNotEmpty == true) {
      requiredInJapanVisaInfo.clear();
      requiredInJapanVisaInfo.reset();
      for (VisaInfo element in response.requiredInJapan?.visaInfo ?? []) {
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
              'passportFileSelect': FormControl<FileSelect>(
                value: element.passportFileSelect != null
                    ? FileSelect(
                        url: element.passportFileSelect,
                      )
                    : null,
              ),
              'letterOfGuaranteeDate': FormControl<DateTime>(
                value: element.letterOfGuaranteeDate,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'letterOfGuaranteeFileSelect': FormControl<FileSelect>(
                value: element.letterOfGuaranteeFileSelect != null
                    ? FileSelect(
                        url: element.letterOfGuaranteeFileSelect,
                      )
                    : null,
              ),
              'sendBy': FormControl<String>(value: element.sendBy),
              'byEMS': FormControl<bool>(value: element.byEMS),
              'byFedex': FormControl<bool>(value: element.byFedex),
              'byOthers': FormControl<bool>(value: element.byOthers),
              'byOthersRemarks': FormControl<String>(value: element.byOthersRemarks ?? ''),
            },
          ),
        );
      }
    }
    if (response.requiredInJapan?.schedule?.isNotEmpty == true) {
      requiredInJapanSchedule.clear();
      requiredInJapanSchedule.reset();
      for (Schedule element in response.requiredInJapan?.schedule ?? []) {
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
              'treatmentScheduleFileSelect': FormControl<FileSelect>(
                value: element.treatmentScheduleFileSelect != null
                    ? FileSelect(
                        url: element.treatmentScheduleFileSelect,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }

    requiredInJapanForm.control('statementOfReasonsFileSelect').value =
        response.requiredInJapan?.statementOfReasonsFileSelect != null
            ? FileSelect(
                url: response.requiredInJapan?.statementOfReasonsFileSelect,
              )
            : null;
    requiredInJapanForm.control('statementOfReasonsDate').value =
        response.requiredInJapan?.statementOfReasonsDate;
    requiredInJapanForm.control('statementOfReasonsFileSelect').value =
        response.requiredInJapan?.statementOfReasonsFileSelect != null
            ? FileSelect(
                url: response.requiredInJapan?.statementOfReasonsFileSelect,
              )
            : null;

    requiredInJapanForm.control('travelCompanionListDate').value =
        response.requiredInJapan?.travelCompanionListDate;
    requiredInJapanForm.control('travelCompanionListFileSelect').value =
        response.requiredInJapan?.travelCompanionListFileSelect != null
            ? FileSelect(
                url: response.requiredInJapan?.travelCompanionListFileSelect,
              )
            : null;

    // 既存の3項目をotherApplicationDocumentsに統合
    FormArray otherApplicationDocuments =
        requiredInJapanForm.control('otherApplicationDocuments') as FormArray;
    otherApplicationDocuments.clear();
    otherApplicationDocuments.reset();
    
    // 治療予定表を追加
    if (response.requiredInJapan?.schedule?.isNotEmpty == true) {
      for (Schedule element in response.requiredInJapan?.schedule ?? []) {
        otherApplicationDocuments.add(
          FormGroup(
            {
              'date': FormControl<DateTime>(
                value: element.treatmentSchedule,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'fileSelect': FormControl<FileSelect>(
                value: element.treatmentScheduleFileSelect != null
                    ? FileSelect(
                        url: element.treatmentScheduleFileSelect,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }
    
    // 理由書を追加
    if (response.requiredInJapan?.statementOfReasonsDate != null ||
        response.requiredInJapan?.statementOfReasonsFileSelect != null) {
      otherApplicationDocuments.add(
        FormGroup(
          {
            'date': FormControl<DateTime>(
              value: response.requiredInJapan?.statementOfReasonsDate,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'fileSelect': FormControl<FileSelect>(
              value: response.requiredInJapan?.statementOfReasonsFileSelect != null
                  ? FileSelect(
                      url: response.requiredInJapan?.statementOfReasonsFileSelect,
                    )
                  : null,
            ),
          },
        ),
      );
    }
    
    // 同行者リストを追加
    if (response.requiredInJapan?.travelCompanionListDate != null ||
        response.requiredInJapan?.travelCompanionListFileSelect != null) {
      otherApplicationDocuments.add(
        FormGroup(
          {
            'date': FormControl<DateTime>(
              value: response.requiredInJapan?.travelCompanionListDate,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'fileSelect': FormControl<FileSelect>(
              value: response.requiredInJapan?.travelCompanionListFileSelect != null
                  ? FileSelect(
                      url: response.requiredInJapan?.travelCompanionListFileSelect,
                    )
                  : null,
            ),
          },
        ),
      );
    }

    // paymentStatusをpersonalからrequiredInJapanに移動
    String? paymentStatus;
    if (response.personal?.isNotEmpty == true) {
      paymentStatus = response.personal?.first.paymentStatus;
    }
    requiredInJapanForm.control('paymentStatus').value = paymentStatus ?? '';

    FormArray requiredInJapanTravelInfo =
        requiredInJapanForm.control('travelInfo') as FormArray;
    if (response.requiredInJapan?.travelInfo?.isNotEmpty == true) {
      requiredInJapanTravelInfo.clear();
      requiredInJapanTravelInfo.reset();
      for (TravelInfo element in response.requiredInJapan?.travelInfo ?? []) {
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
              'landingPermitDate': FormControl<DateTime>(
                value: element.landingPermitDate,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'landingPermitFileSelect': FormControl<FileSelect>(
                value: element.landingPermitFileSelect != null
                    ? FileSelect(
                        url: element.landingPermitFileSelect,
                      )
                    : null,
              ),
              'returnFlightTicketDate': FormControl<DateTime>(
                value: element.returnFlightTicketDate,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'returnFlightTicketFileSelect': FormControl<FileSelect>(
                value: element.returnFlightTicketFileSelect != null
                    ? FileSelect(
                        url: element.returnFlightTicketFileSelect,
                      )
                    : null,
              ),

              // 入国 hand in
              'departureIn': FormControl<String>(value: element.departureIn),
              'arrivalIn': FormControl<String>(value: element.arrivalIn),
              'flightNumberIn':
                  FormControl<String>(value: element.flightNumberIn),
              'departureTimeIn':
                  FormControl<String>(value: element.departureIn),
              'arrivalTimeIn':
                  FormControl<String>(value: element.arrivalTimeIn),

              // 出国 hand out
              'departureOut': FormControl<String>(value: element.departureOut),
              'arrivalOut': FormControl<String>(value: element.arrivalOut),
              'flightNumberOut':
                  FormControl<String>(value: element.flightNumberOut),
              'departureTimeOut':
                  FormControl<String>(value: element.departureTimeOut),
              'arrivalTimeOut':
                  FormControl<String>(value: element.arrivalTimeOut),
              'seatNumberOut':
                  FormControl<String>(value: element.seatNumberOut),

              'remarks': FormControl<String>(value: element.remarks),
            },
          ),
        );
      }
    }

    FormGroup requiredInJapanVisaWithdrawal =
        formGroup.control('visaWithdrawal') as FormGroup;
    requiredInJapanVisaWithdrawal.control('subjectVisaWithdrawal').value =
        response.visaWithdrawal?.subjectVisaWithdrawal;
    requiredInJapanVisaWithdrawal.control('deathOrOccurrenceEventDate').value =
        response.visaWithdrawal?.deathOrOccurrenceEventDate;
    requiredInJapanVisaWithdrawal.control('remarks').value =
        response.visaWithdrawal?.remarks;

    FormGroup requiredInJapanAfterGettingVisa =
        formGroup.control('afterGettingVisa') as FormGroup;
    FormArray afterGettingVisaVasaInfo =
        requiredInJapanAfterGettingVisa.control('vasaInfo') as FormArray;
    if (response.afterGettingVisa?.vasaInfo?.isNotEmpty == true) {
      afterGettingVisaVasaInfo.clear();
      afterGettingVisaVasaInfo.reset();
      for (VasaInfo element in response.afterGettingVisa?.vasaInfo ?? []) {
        afterGettingVisaVasaInfo.add(
          FormGroup({
            'landingPermit': FormControl<DateTime>(
              value: element.landingPermit,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'landingPermitFileName': FormControl<FileSelect>(
              value: element.landingPermitFileName != null
                  ? FileSelect(
                      url: element.landingPermitFileName,
                    )
                  : null,
            ),
          }),
        );
      }
    }

    FormArray afterGettingVisaTicket =
        requiredInJapanAfterGettingVisa.control('ticket') as FormArray;
    if (response.afterGettingVisa?.ticket?.isNotEmpty == true) {
      afterGettingVisaTicket.clear();
      afterGettingVisaTicket.reset();
      for (Ticket element in response.afterGettingVisa?.ticket ?? []) {
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
            'planeTicketForYourVisitToJapanFileName': FormControl<FileSelect>(
              value: element.planeTicketForYourVisitToJapanFileName != null
                  ? FileSelect(
                      url: element.planeTicketForYourVisitToJapanFileName,
                    )
                  : null,
            ),
          }),
        );
      }
    }

    FormArray afterGettingVisaTicketBack =
        requiredInJapanAfterGettingVisa.control('ticketBack') as FormArray;
    if (response.afterGettingVisa?.ticketBack?.isNotEmpty == true) {
      afterGettingVisaTicketBack.clear();
      afterGettingVisaTicketBack.reset();
      for (TicketBack element in response.afterGettingVisa?.ticketBack ?? []) {
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
              'returnFlightTicketFileName': FormControl<FileSelect>(
                value: element.returnFlightTicketFileName != null
                    ? FileSelect(
                        url: element.returnFlightTicketFileName,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }

    FormArray afterGettingVisaBoardingPass =
        requiredInJapanAfterGettingVisa.control('boardingPass') as FormArray;
    if (response.afterGettingVisa?.boardingPass?.isNotEmpty == true) {
      afterGettingVisaBoardingPass.clear();
      afterGettingVisaBoardingPass.reset();
      for (BoardingPass element
          in response.afterGettingVisa?.boardingPass ?? []) {
        afterGettingVisaBoardingPass.add(
          FormGroup(
            {
              'boardingPassForReturnFlight': FormControl<DateTime>(
                value: element.boardingPassForReturnFlight,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'boardingPassForReturnFlightFileName': FormControl<FileSelect>(
                value: element.boardingPassForReturnFlightFileName != null
                    ? FileSelect(
                        url: element.boardingPassForReturnFlightFileName,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }
    requiredInJapanAfterGettingVisa.control('certificateOfEligibility').value =
        response.afterGettingVisa?.certificateOfEligibility;

    requiredInJapanAfterGettingVisa
        .control('certificateOfEligibilityFileName')
        .value = response.afterGettingVisa?.certificateOfEligibilityFileName !=
            null
        ? FileSelect(
            url: response.afterGettingVisa?.certificateOfEligibilityFileName ??
                '',
          )
        : null;

    FormGroup travelCompanionForm =
        formGroup.control('travelCompanion') as FormGroup;
    travelCompanionForm.control('nameRomaji').value =
        response.travelCompanion?.nameRomaji;
    travelCompanionForm.control('dateBirth').value =
        response.travelCompanion?.dateBirth;
    travelCompanionForm.control('age').value = response.travelCompanion?.age;
    travelCompanionForm.control('sex').value = response.travelCompanion?.sex;
    travelCompanionForm.control('addressArea').value =
        response.travelCompanion?.addressArea;
    travelCompanionForm.control('numberPassport').value =
        response.travelCompanion?.numberPassport;
    logger.d('Name = ${response.travelCompanion?.nameRomaji}');

    FormArray travelCompanionTravelInfo =
        travelCompanionForm.control('travelInfo') as FormArray;
    if (response.travelCompanion?.travelInfo?.isNotEmpty == true) {
      travelCompanionTravelInfo.clear();
      travelCompanionTravelInfo.reset();
      for (TravelInfo element in response.travelCompanion?.travelInfo ?? []) {
        travelCompanionTravelInfo.add(
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
              'landingPermitDate': FormControl<DateTime>(
                value: element.landingPermitDate,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'landingPermitFileSelect': FormControl<FileSelect>(
                value: element.landingPermitFileSelect != null
                    ? FileSelect(
                        url: element.landingPermitFileSelect,
                      )
                    : null,
              ),
              'returnFlightTicketDate': FormControl<DateTime>(
                value: element.returnFlightTicketDate,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'returnFlightTicketFileSelect': FormControl<FileSelect>(
                value: element.returnFlightTicketFileSelect != null
                    ? FileSelect(
                        url: element.returnFlightTicketFileSelect,
                      )
                    : null,
              ),

              // 入国 hand in
              'departureIn': FormControl<String>(value: element.departureIn),
              'arrivalIn': FormControl<String>(value: element.arrivalIn),
              'flightNumberIn':
                  FormControl<String>(value: element.flightNumberIn),
              'departureTimeIn':
                  FormControl<String>(value: element.departureIn),
              'arrivalTimeIn':
                  FormControl<String>(value: element.arrivalTimeIn),

              // 出国 hand out
              'departureOut': FormControl<String>(value: element.departureOut),
              'arrivalOut': FormControl<String>(value: element.arrivalOut),
              'flightNumberOut':
                  FormControl<String>(value: element.flightNumberOut),
              'departureTimeOut':
                  FormControl<String>(value: element.departureTimeOut),
              'arrivalTimeOut':
                  FormControl<String>(value: element.arrivalTimeOut),
              'seatNumberOut':
                  FormControl<String>(value: element.seatNumberOut),

              'remarks': FormControl<String>(value: element.remarks),
            },
          ),
        );
      }
    }

    travelCompanionForm.control('travelRemarks').value =
        response.travelCompanion?.travelRemarks;
    travelCompanionForm.control('visaWithdrawalTarget').value =
        response.travelCompanion?.visaWithdrawalTarget;
    travelCompanionForm.control('reason').value =
        response.travelCompanion?.reason;
    travelCompanionForm.control('remarks').value =
        response.travelCompanion?.remarks;
    FormArray travelCompanionFormVasaInfo =
        travelCompanionForm.control('vasaInfo') as FormArray;
    if (response.travelCompanion?.vasaInfo?.isNotEmpty == true) {
      travelCompanionFormVasaInfo.clear();
      travelCompanionFormVasaInfo.reset();
      for (VasaInfo element in response.travelCompanion?.vasaInfo ?? []) {
        travelCompanionFormVasaInfo.add(
          FormGroup({
            'visaPage': FormControl<DateTime>(
              value: element.visaPage,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'visaPageFileName': FormControl<FileSelect>(
              value: element.visaPageFileName != null
                  ? FileSelect(
                      url: element.visaPageFileName,
                    )
                  : null,
            ),
            'landingPermit': FormControl<DateTime>(
              value: element.landingPermit,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'landingPermitFileName': FormControl<FileSelect>(
              value: element.landingPermitFileName != null
                  ? FileSelect(
                      url: element.landingPermitFileName,
                    )
                  : null,
            ),
          }),
        );
      }
    }

    FormArray travelCompanionFormTicket =
        travelCompanionForm.control('ticket') as FormArray;
    if (response.travelCompanion?.ticket?.isNotEmpty == true) {
      travelCompanionFormTicket.clear();
      travelCompanionFormTicket.reset();
      for (Ticket element in response.travelCompanion?.ticket ?? []) {
        travelCompanionFormTicket.add(
          FormGroup({
            'planeTicketForYourVisitToJapan': FormControl<DateTime>(
              value: element.planeTicketForYourVisitToJapan,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'planeTicketForYourVisitToJapanFileName': FormControl<FileSelect>(
              value: element.planeTicketForYourVisitToJapanFileName != null
                  ? FileSelect(
                      url: element.planeTicketForYourVisitToJapanFileName,
                    )
                  : null,
            ),
          }),
        );
      }
    }

    FormArray travelCompanionFormTicketBack =
        travelCompanionForm.control('ticketBack') as FormArray;
    if (response.travelCompanion?.ticketBack?.isNotEmpty == true) {
      travelCompanionFormTicketBack.clear();
      travelCompanionFormTicketBack.reset();
      for (TicketBack element in response.travelCompanion?.ticketBack ?? []) {
        travelCompanionFormTicketBack.add(
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
              'returnFlightTicketFileName': FormControl<FileSelect>(
                value: element.returnFlightTicketFileName != null
                    ? FileSelect(
                        url: element.returnFlightTicketFileName,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }

    FormArray travelCompanionFormBoardingPass =
        travelCompanionForm.control('boardingPass') as FormArray;
    if (response.travelCompanion?.boardingPass?.isNotEmpty == true) {
      travelCompanionFormBoardingPass.clear();
      travelCompanionFormBoardingPass.reset();
      for (BoardingPass element
          in response.travelCompanion?.boardingPass ?? []) {
        travelCompanionFormBoardingPass.add(
          FormGroup({
            'boardingPassForReturnFlight': FormControl<DateTime>(
              value: element.boardingPassForReturnFlight,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'boardingPassForReturnFlightFileName': FormControl<FileSelect>(
              value: element.boardingPassForReturnFlightFileName != null
                  ? FileSelect(
                      url: element.boardingPassForReturnFlightFileName,
                    )
                  : null,
            ),
          }),
        );
      }
    }

    travelCompanionForm.control('certificateOfEligibility').value =
        response.travelCompanion?.certificateOfEligibility;
    travelCompanionForm.control('certificateOfEligibilityFileName').value =
        response.travelCompanion?.certificateOfEligibilityFileName != null
            ? FileSelect(
                url: response.travelCompanion?.certificateOfEligibilityFileName,
              )
            : null;

    FormGroup necessaryInJapanForm =
        formGroup.control('necessaryInJapan') as FormGroup;
    FormArray necessaryInJapanFormVisaInfor =
        necessaryInJapanForm.control('visaInfo') as FormArray;
    if (response.necessaryInJapan?.visaInfo?.isNotEmpty == true) {
      necessaryInJapanFormVisaInfor.clear();
      necessaryInJapanFormVisaInfor.reset();
      for (VisaInfo element in response.necessaryInJapan?.visaInfo ?? []) {
        necessaryInJapanFormVisaInfor.add(
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
              'passportFileSelect': FormControl<FileSelect>(
                value: element.passportFileSelect != null
                    ? FileSelect(
                        url: element.passportFileSelect,
                      )
                    : null,
              ),
              'letterOfGuaranteeDate': FormControl<DateTime>(
                value: element.letterOfGuaranteeDate,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'letterOfGuaranteeFileSelect': FormControl<FileSelect>(
                value: element.letterOfGuaranteeFileSelect != null
                    ? FileSelect(
                        url: element.letterOfGuaranteeFileSelect,
                      )
                    : null,
              ),
              'sendBy': FormControl<String>(value: element.sendBy),
              'byEMS': FormControl<bool>(value: element.byEMS),
              'byFedex': FormControl<bool>(value: element.byFedex),
              'byOthers': FormControl<bool>(value: element.byOthers),
              'byOthersRemarks': FormControl<String>(value: element.byOthersRemarks ?? ''),
            },
          ),
        );
      }
    }

    FormArray necessaryInJapanFormSchedule =
        necessaryInJapanForm.control('schedule') as FormArray;
    if (response.necessaryInJapan?.schedule?.isNotEmpty == true) {
      necessaryInJapanFormSchedule.clear();
      necessaryInJapanFormSchedule.reset();
      for (Schedule element in response.necessaryInJapan?.schedule ?? []) {
        necessaryInJapanFormSchedule.add(
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
              'treatmentScheduleFileSelect': FormControl<FileSelect>(
                value: element.treatmentScheduleFileSelect != null
                    ? FileSelect(
                        url: element.treatmentScheduleFileSelect,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }

    necessaryInJapanForm.control('statementOfReasonsDate').value =
        response.necessaryInJapan?.statementOfReasonsDate;
    necessaryInJapanForm.control('travelCompanionListDate').value =
        response.necessaryInJapan?.travelCompanionListDate;

    // 既存の3項目をotherApplicationDocumentsに統合
    FormArray necessaryOtherApplicationDocuments =
        necessaryInJapanForm.control('otherApplicationDocuments') as FormArray;
    necessaryOtherApplicationDocuments.clear();
    necessaryOtherApplicationDocuments.reset();
    
    // 治療予定表を追加
    if (response.necessaryInJapan?.schedule?.isNotEmpty == true) {
      for (Schedule element in response.necessaryInJapan?.schedule ?? []) {
        necessaryOtherApplicationDocuments.add(
          FormGroup(
            {
              'date': FormControl<DateTime>(
                value: element.treatmentSchedule,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'fileSelect': FormControl<FileSelect>(
                value: element.treatmentScheduleFileSelect != null
                    ? FileSelect(
                        url: element.treatmentScheduleFileSelect,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }
    
    // 理由書を追加（日付のみ）
    if (response.necessaryInJapan?.statementOfReasonsDate != null) {
      necessaryOtherApplicationDocuments.add(
        FormGroup(
          {
            'date': FormControl<DateTime>(
              value: response.necessaryInJapan?.statementOfReasonsDate,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'fileSelect': FormControl<FileSelect>(),
          },
        ),
      );
    }
    
    // 同行者リストを追加（日付のみ）
    if (response.necessaryInJapan?.travelCompanionListDate != null) {
      necessaryOtherApplicationDocuments.add(
        FormGroup(
          {
            'date': FormControl<DateTime>(
              value: response.necessaryInJapan?.travelCompanionListDate,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'fileSelect': FormControl<FileSelect>(),
          },
        ),
      );
    }

    FormGroup afterGettingVisaFinalForm =
        formGroup.control('afterGettingVisaFinal') as FormGroup;
    FormArray afterGettingVisaFinalFormVisaInfo =
        afterGettingVisaFinalForm.control('vasaInfo') as FormArray;
    if (response.afterGettingVisaFinal?.vasaInfo?.isNotEmpty == true) {
      afterGettingVisaFinalFormVisaInfo.clear();
      afterGettingVisaFinalFormVisaInfo.reset();
      for (GettingVisaInfoRequest element
          in response.afterGettingVisaFinal?.vasaInfo ?? []) {
        afterGettingVisaFinalFormVisaInfo.add(
          FormGroup(
            {
              'visaPage': FormControl<DateTime>(
                value: element.visaPage,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'visaPageFileName': FormControl<FileSelect>(
                value: element.visaPageFileName != null
                    ? FileSelect(
                        url: element.visaPageFileName,
                      )
                    : null,
              ),
              'landingPermit': FormControl<DateTime>(
                value: element.landingPermit,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'landingPermitFileName': FormControl<FileSelect>(
                value: element.landingPermitFileName != null
                    ? FileSelect(
                        url: element.landingPermitFileName,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }

    FormArray afterGettingVisaFinalFormTicket =
        afterGettingVisaFinalForm.control('ticket') as FormArray;
    if (response.afterGettingVisaFinal?.ticket?.isNotEmpty == true) {
      afterGettingVisaFinalFormTicket.clear();
      afterGettingVisaFinalFormTicket.reset();
      for (TicketRequest element
          in response.afterGettingVisaFinal?.ticket ?? []) {
        afterGettingVisaFinalFormTicket.add(
          FormGroup(
            {
              'planeTicketForYourVisitToJapan': FormControl<DateTime>(
                value: element.planeTicketForYourVisitToJapan,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'planeTicketForYourVisitToJapanFileName': FormControl<FileSelect>(
                value: element.planeTicketForYourVisitToJapanFileName != null
                    ? FileSelect(
                        url: element.planeTicketForYourVisitToJapanFileName,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }

    FormArray afterGettingVisaFinalFormTicketBack =
        afterGettingVisaFinalForm.control('ticketBack') as FormArray;
    if (response.afterGettingVisaFinal?.ticketBack?.isNotEmpty == true) {
      afterGettingVisaFinalFormTicketBack.clear();
      afterGettingVisaFinalFormTicketBack.reset();
      for (TicketBackRequest element
          in response.afterGettingVisaFinal?.ticketBack ?? []) {
        afterGettingVisaFinalFormTicketBack.add(
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
              'returnFlightTicketFileName': FormControl<FileSelect>(
                value: element.returnFlightTicketFileName != null
                    ? FileSelect(
                        url: element.returnFlightTicketFileName,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }

    FormArray afterGettingVisaFinalFormBoardingPass =
        afterGettingVisaFinalForm.control('boardingPass') as FormArray;
    if (response.afterGettingVisaFinal?.boardingPass?.isNotEmpty == true) {
      afterGettingVisaFinalFormBoardingPass.clear();
      afterGettingVisaFinalFormBoardingPass.reset();
      for (BoardingPassRequest element
          in response.afterGettingVisaFinal?.boardingPass ?? []) {
        afterGettingVisaFinalFormBoardingPass.add(
          FormGroup(
            {
              'boardingPassForReturnFlight': FormControl<DateTime>(
                value: element.boardingPassForReturnFlight,
                validators: [
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ),
              'boardingPassForReturnFlightFileName': FormControl<FileSelect>(
                value: element.boardingPassForReturnFlightFileName != null
                    ? FileSelect(
                        url: element.boardingPassForReturnFlightFileName,
                      )
                    : null,
              ),
            },
          ),
        );
      }
    }

    afterGettingVisaFinalForm.control('certificateOfEligibility').value =
        response.afterGettingVisaFinal?.certificateOfEligibility;
  }

  ValueNotifier<AsyncData<MedicalRecordVisaResponse>>
      submitMedicalRecordVisaData = ValueNotifier(const AsyncData());

  Future<void> submitMedicalRecordVisa(FormGroup formGroup) async {
    try {
      submitMedicalRecordVisaData.value = const AsyncData(loading: true);
      // personal

      List<MedicalVisaPersonalRequest>? personal = [];

      for (dynamic e in formGroup.control('personal').value) {
        String? visaPageFileName;
        if (e['visaPageFileName'] != null) {
          FileSelect docFile = e['visaPageFileName'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              visaPageFileName = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            visaPageFileName = docFile.url;
          }
        }
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
            visaPageFileName: visaPageFileName,
          ),
        );
        logger.d('Data ${e['medicalVisa']}');
      }

      logger.d('Data2 ${personal.toList()}');

      //stayPeriod
      List<MedicalVisaStayPeriodRequest>? stayPeriod = [];
      formGroup.control('stayPeriod').value.forEach(
        (e) {
          stayPeriod.add(
            MedicalVisaStayPeriodRequest(
              stayStartingDatePersonalReference:
                  e['stayStartingDatePersonalReference'],
              stayEndDate: e['stayEndDate'],
            ),
          );
        },
      );

      //requiredInJapan
      var formRequiredInJapan =
          formGroup.control('requiredInJapan') as FormGroup;
      List<VisaInfoRequest>? visaInfo = [];

      for (dynamic element in formRequiredInJapan.control('visaInfo').value) {
        logger.d('Data visaInfo ${element['passportFileSelect']}');
        try {
          String? passportFileSelect;
          if (element['passportFileSelect'] != null) {
            FileSelect docFile = element['passportFileSelect'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  FileUploadRequest(
                    file: base64Image,
                    filename: docFile.filename!,
                  ),
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
          if (element['letterOfGuaranteeFileSelect'] != null) {
            FileSelect docFile = element['letterOfGuaranteeFileSelect'];
            if (docFile.file != null) {
              try {
                String base64Image = base64Encode(docFile.file!);
                FileResponse fileData =
                    await patientRepository.uploadFileBase64(
                  FileUploadRequest(
                    file: base64Image,
                    filename: docFile.filename!,
                  ),
                );
                letterOfGuaranteeFileSelect = fileData.filename;
              } catch (e) {
                logger.e(e);
              }
            } else {
              letterOfGuaranteeFileSelect = docFile.url;
            }
          }

          visaInfo.add(
            VisaInfoRequest(
              passportDate: element['passportDate'],
              passportFileSelect: passportFileSelect,
              letterOfGuaranteeDate: element['letterOfGuaranteeDate'],
              letterOfGuaranteeFileSelect: letterOfGuaranteeFileSelect,
              sendBy: element['sendBy'],
              byEMS: element['byEMS'],
              byFedex: element['byFedex'],
              byOthers: element['byOthers'],
              byOthersRemarks: element['byOthersRemarks'],
            ),
          );
          logger.d('Data ${passportFileSelect.toString()}');
          logger.d('All ${visaInfo.toList()}');
        } catch (e) {
          logger.e('Error while processing visaInfo: ${e.toString()}');
        }
      }

      // otherApplicationDocumentsから既存の3項目にマッピング
      List<ScheduleRequest>? schedule = [];
      String? statementOfReasonsFileSelect;
      DateTime? statementOfReasonsDate;
      String? travelCompanionListFileSelect;
      DateTime? travelCompanionListDate;
      
      final otherApplicationDocuments = formRequiredInJapan.control('otherApplicationDocuments').value as List<dynamic>?;
      if (otherApplicationDocuments != null && otherApplicationDocuments.isNotEmpty) {
        // 最初の項目を治療予定表として扱う
        if (otherApplicationDocuments.length > 0) {
          final firstDoc = otherApplicationDocuments[0];
        String? treatmentScheduleFileSelect;
          if (firstDoc['fileSelect'] != null) {
            FileSelect docFile = firstDoc['fileSelect'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              treatmentScheduleFileSelect = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            treatmentScheduleFileSelect = docFile.url;
          }
        }
        schedule.add(
          ScheduleRequest(
              treatmentSchedule: firstDoc['date'],
            treatmentScheduleFileSelect: treatmentScheduleFileSelect,
          ),
        );
      }

        // 2番目の項目を理由書として扱う
        if (otherApplicationDocuments.length > 1) {
          final secondDoc = otherApplicationDocuments[1];
          statementOfReasonsDate = secondDoc['date'];
          if (secondDoc['fileSelect'] != null) {
            FileSelect docFile = secondDoc['fileSelect'];
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              FileUploadRequest(
                file: base64Image,
                filename: docFile.filename!,
              ),
            );
            statementOfReasonsFileSelect = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          statementOfReasonsFileSelect = docFile.url;
        }
          }
        }
        
        // 3番目の項目を同行者リストとして扱う
        if (otherApplicationDocuments.length > 2) {
          final thirdDoc = otherApplicationDocuments[2];
          travelCompanionListDate = thirdDoc['date'];
          if (thirdDoc['fileSelect'] != null) {
            FileSelect docFile = thirdDoc['fileSelect'];
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              FileUploadRequest(
                file: base64Image,
                filename: docFile.filename!,
              ),
            );
            travelCompanionListFileSelect = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          travelCompanionListFileSelect = docFile.url;
            }
          }
        }
      }
      List<TravelInfoRequest>? travelInfo = [];

      for (dynamic e in formRequiredInJapan.control('travelInfo').value) {
        String? landingPermitFileSelect;
        if (e['landingPermitFileSelect'] != null) {
          FileSelect docFile = e['landingPermitFileSelect'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              landingPermitFileSelect = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            landingPermitFileSelect = docFile.url;
          }
        }
        
        String? returnFlightTicketFileSelect;
        if (e['returnFlightTicketFileSelect'] != null) {
          FileSelect docFile = e['returnFlightTicketFileSelect'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              returnFlightTicketFileSelect = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            returnFlightTicketFileSelect = docFile.url;
          }
        }
        
        travelInfo.add(
          TravelInfoRequest(
            landingPermissionDate: e['landingPermissionDate'],
            visaValidityPeriodExpirationDate:
                e['visaValidityPeriodExpirationDate'],
            dateOfEntryIntoJapan: e['dateOfEntryIntoJapan'],
            departureDateFromJapan: e['departureDateFromJapan'],
            landingPermitDate: e['landingPermitDate'],
            landingPermitFileSelect: landingPermitFileSelect,
            returnFlightTicketDate: e['returnFlightTicketDate'],
            returnFlightTicketFileSelect: returnFlightTicketFileSelect,
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
      }

      logger.d('Data first ${visaInfo.first.toJson()}');
      RequiredInJapan requiredInJapan = RequiredInJapan(
        visaInfo: visaInfo,
        schedule: schedule,
        statementOfReasonsDate: statementOfReasonsDate,
        statementOfReasonsFileSelect: statementOfReasonsFileSelect,
        travelCompanionListDate: travelCompanionListDate,
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

      for (dynamic e in afterGettingVisaForm.control('vasaInfo').value) {
        String? landingPermitFileName;
        if (e['landingPermitFileName'] != null) {
          FileSelect docFile = e['landingPermitFileName'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              landingPermitFileName = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            landingPermitFileName = docFile.url;
          }
        }
        gettingVisaInfo.add(
          GettingVisaInfoRequest(
            visaPage: null,
            visaPageFileName: null,
            landingPermit: e['landingPermit'],
            landingPermitFileName: landingPermitFileName,
          ),
        );
      }

      List<TicketRequest>? ticket = [];

      for (dynamic e in afterGettingVisaForm.control('ticket').value) {
        String? planeTicketForYourVisitToJapanFileName;
        if (e['planeTicketForYourVisitToJapanFileName'] != null) {
          FileSelect docFile = e['planeTicketForYourVisitToJapanFileName'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
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
            planeTicketForYourVisitToJapan: e['planeTicketForYourVisitToJapan'],
            planeTicketForYourVisitToJapanFileName:
                planeTicketForYourVisitToJapanFileName,
          ),
        );
      }

      List<TicketBackRequest>? ticketBack = [];

      for (dynamic e in afterGettingVisaForm.control('ticketBack').value) {
        String? returnFlightTicketFileName;
        if (e['returnFlightTicketFileName'] != null) {
          FileSelect docFile = e['returnFlightTicketFileName'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
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
      }

      List<BoardingPassRequest>? boardingPass = [];

      for (dynamic e in afterGettingVisaForm.control('boardingPass').value) {
        String? boardingPassForReturnFlightFileName;
        if (e['boardingPassForReturnFlightFileName'] != null) {
          FileSelect docFile = e['boardingPassForReturnFlightFileName'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              boardingPassForReturnFlightFileName = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            boardingPassForReturnFlightFileName = docFile.url;
          }
        }
        boardingPass.add(
          BoardingPassRequest(
            boardingPassForReturnFlight: e['boardingPassForReturnFlight'],
            boardingPassForReturnFlightFileName:
                boardingPassForReturnFlightFileName,
          ),
        );
      }

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
              FileUploadRequest(
                file: base64Image,
                filename: docFile.filename!,
              ),
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
        boardingPass: boardingPass,
        certificateOfEligibility:
            afterGettingVisaForm.control('certificateOfEligibility').value,
        certificateOfEligibilityFileName: certificateOfEligibilityFileName,
      );

      //travelCompanion
      var travelCompanionForm =
          formGroup.control('travelCompanion') as FormGroup;
      List<TravelInfoRequest>? compationTravelInfo = [];

      for (dynamic e in travelCompanionForm.control('travelInfo').value) {
        String? landingPermitFileSelect;
        if (e['landingPermitFileSelect'] != null) {
          FileSelect docFile = e['landingPermitFileSelect'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              landingPermitFileSelect = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            landingPermitFileSelect = docFile.url;
          }
        }
        
        String? returnFlightTicketFileSelect;
        if (e['returnFlightTicketFileSelect'] != null) {
          FileSelect docFile = e['returnFlightTicketFileSelect'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              returnFlightTicketFileSelect = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            returnFlightTicketFileSelect = docFile.url;
          }
        }
        
        compationTravelInfo.add(
          TravelInfoRequest(
            landingPermissionDate: e['landingPermissionDate'],
            visaValidityPeriodExpirationDate:
                e['visaValidityPeriodExpirationDate'],
            dateOfEntryIntoJapan: e['dateOfEntryIntoJapan'],
            departureDateFromJapan: e['departureDateFromJapan'],
            landingPermitDate: e['landingPermitDate'],
            landingPermitFileSelect: landingPermitFileSelect,
            returnFlightTicketDate: e['returnFlightTicketDate'],
            returnFlightTicketFileSelect: returnFlightTicketFileSelect,
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
      }

      List<GettingVisaInfoRequest>? compationVisaInfo = [];

      for (dynamic e in travelCompanionForm.control('vasaInfo').value) {
        String? visaPageFileName;
        if (e['visaPageFileName'] != null) {
          FileSelect docFile = e['visaPageFileName'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
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
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              landingPermitFileName = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            landingPermitFileName = docFile.url;
          }
        }
        compationVisaInfo.add(
          GettingVisaInfoRequest(
            visaPage: e['visaPage'],
            visaPageFileName: visaPageFileName,
            landingPermit: e['landingPermit'],
            landingPermitFileName: landingPermitFileName,
          ),
        );
      }

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
        reason: travelCompanionForm.control('reason').value,
        remarks: travelCompanionForm.control('remarks').value,
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

      for (dynamic e in formNequiredInJapan.control('visaInfo').value) {
        String? letterOfGuaranteeFileSelect;
        if (e['letterOfGuaranteeFileSelect'] != null) {
          FileSelect docFile = e['letterOfGuaranteeFileSelect'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
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
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              passportFileSelect = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            passportFileSelect = docFile.url;
          }
        }
        neceessaryVisaInfo.add(
          VisaInfoRequest(
            passportDate: e['passportDate'],
            passportFileSelect: passportFileSelect,
            letterOfGuaranteeDate: e['letterOfGuaranteeDate'],
            letterOfGuaranteeFileSelect: letterOfGuaranteeFileSelect,
            sendBy: e['sendBy'],
            byEMS: e['byEMS'],
            byFedex: e['byFedex'],
            byOthers: e['byOthers'],
            byOthersRemarks: e['byOthersRemarks'],
          ),
        );
      }

      // otherApplicationDocumentsから既存の3項目にマッピング
      List<ScheduleRequest> neceessarySchedule = [];
      String? necessaryStatementOfReasonsFileSelect;
      DateTime? necessaryStatementOfReasonsDate;
      String? necessaryTravelCompanionListFileSelect;
      DateTime? necessaryTravelCompanionListDate;
      
      final necessaryOtherApplicationDocuments = formNequiredInJapan.control('otherApplicationDocuments').value as List<dynamic>?;
      if (necessaryOtherApplicationDocuments != null && necessaryOtherApplicationDocuments.isNotEmpty) {
        // 最初の項目を治療予定表として扱う
        if (necessaryOtherApplicationDocuments.length > 0) {
          final firstDoc = necessaryOtherApplicationDocuments[0];
        String? treatmentScheduleFileSelect;
          if (firstDoc['fileSelect'] != null) {
            FileSelect docFile = firstDoc['fileSelect'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              treatmentScheduleFileSelect = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            treatmentScheduleFileSelect = docFile.url;
          }
        }
        neceessarySchedule.add(
          ScheduleRequest(
              treatmentSchedule: firstDoc['date'],
            treatmentScheduleFileSelect: treatmentScheduleFileSelect,
          ),
        );
      }

        // 2番目の項目を理由書として扱う
        if (necessaryOtherApplicationDocuments.length > 1) {
          final secondDoc = necessaryOtherApplicationDocuments[1];
          necessaryStatementOfReasonsDate = secondDoc['date'];
          if (secondDoc['fileSelect'] != null) {
            FileSelect docFile = secondDoc['fileSelect'];
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              FileUploadRequest(
                file: base64Image,
                filename: docFile.filename!,
              ),
            );
            necessaryStatementOfReasonsFileSelect = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          necessaryStatementOfReasonsFileSelect = docFile.url;
        }
          }
      }

        // 3番目の項目を同行者リストとして扱う
        if (necessaryOtherApplicationDocuments.length > 2) {
          final thirdDoc = necessaryOtherApplicationDocuments[2];
          necessaryTravelCompanionListDate = thirdDoc['date'];
          if (thirdDoc['fileSelect'] != null) {
            FileSelect docFile = thirdDoc['fileSelect'];
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await patientRepository.uploadFileBase64(
              FileUploadRequest(
                file: base64Image,
                filename: docFile.filename!,
              ),
            );
            necessaryTravelCompanionListFileSelect = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          necessaryTravelCompanionListFileSelect = docFile.url;
            }
          }
        }
      }

      MedicalVisaNecessaryInJapanRequest necessaryRequiredInJapan =
          MedicalVisaNecessaryInJapanRequest(
        visaInfo: neceessaryVisaInfo,
        schedule: neceessarySchedule,
        statementOfReasonsDate: necessaryStatementOfReasonsDate,
        statementOfReasonsDateFileName: necessaryStatementOfReasonsFileSelect,
        travelCompanionListDate: necessaryTravelCompanionListDate,
        travelCompanionListFileName: necessaryTravelCompanionListFileSelect,
      );

      //GettingVisaInfoRequestFinal

      var afterGettingVisaFinalForm =
          formGroup.control('afterGettingVisa') as FormGroup;
      List<GettingVisaInfoRequest>? gettingVisaFinalInfo = [];

      for (dynamic e in afterGettingVisaFinalForm.control('vasaInfo').value) {
        String? visaPageFileName;
        if (e['visaPageFileName'] != null) {
          FileSelect docFile = e['visaPageFileName'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
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
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              landingPermitFileName = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            landingPermitFileName = docFile.url;
          }
        }
        gettingVisaFinalInfo.add(
          GettingVisaInfoRequest(
            visaPage: e['visaPage'],
            visaPageFileName: visaPageFileName,
            landingPermit: e['landingPermit'],
            landingPermitFileName: landingPermitFileName,
          ),
        );
      }

      List<TicketRequest>? ticketFinal = [];

      for (dynamic e in afterGettingVisaFinalForm.control('ticket').value) {
        String? planeTicketForYourVisitToJapanFileName;
        if (e['planeTicketForYourVisitToJapanFileName'] != null) {
          FileSelect docFile = e['planeTicketForYourVisitToJapanFileName'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
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
            planeTicketForYourVisitToJapan: e['planeTicketForYourVisitToJapan'],
            planeTicketForYourVisitToJapanFileName:
                planeTicketForYourVisitToJapanFileName,
          ),
        );
      }

      List<TicketBackRequest>? ticketBackFinal = [];

      for (dynamic e in afterGettingVisaFinalForm.control('ticketBack').value) {
        String? returnFlightTicketFileName;
        if (e['returnFlightTicketFileName'] != null) {
          FileSelect docFile = e['returnFlightTicketFileName'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
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
      }

      List<BoardingPassRequest>? boardingPassFinal = [];

      for (dynamic e
          in afterGettingVisaFinalForm.control('boardingPass').value) {
        String? boardingPassForReturnFlightFileName;
        if (e['boardingPassForReturnFlightFileName'] != null) {
          FileSelect docFile = e['boardingPassForReturnFlightFileName'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await patientRepository.uploadFileBase64(
                FileUploadRequest(
                  file: base64Image,
                  filename: docFile.filename!,
                ),
              );
              boardingPassForReturnFlightFileName = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            boardingPassForReturnFlightFileName = docFile.url;
          }
        }
        boardingPassFinal.add(
          BoardingPassRequest(
            boardingPassForReturnFlight: e['boardingPassForReturnFlight'],
            boardingPassForReturnFlightFileName:
                boardingPassForReturnFlightFileName,
          ),
        );
      }

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
              FileUploadRequest(
                file: base64Image,
                filename: docFile.filename!,
              ),
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
        boardingPass: boardingPassFinal,
        certificateOfEligibility:
            afterGettingVisaForm.control('certificateOfEligibility').value,
        certificateOfEligibilityFileName: certificateOfEligibilityFileNameFinal,
      );
      MedicalRecordVisaRequest request = MedicalRecordVisaRequest(
        medicalRecord: formGroup.control('medicalRecord').value,
        personal: personal,
        stayPeriod: stayPeriod,
        requiredInJapan: requiredInJapan,
        visaWithdrawal: visaWithdrawal,
        afterGettingVisa: afterGettingVisa,
        travelCompanion: travelCompanion,
        necessaryInJapan: necessaryRequiredInJapan,
        afterGettingVisaFinal: afterGettingVisaFinal,
      );
      if (formGroup.control('_id').value != null) {
        final response = await patientRepository.putMedicalRecordVisa(
            formGroup.control('_id').value, request);
        submitMedicalRecordVisaData.value = AsyncData(data: response);
        medicalRecordVisaData.value = AsyncData(data: response);
      } else {
        final response = await patientRepository.postMedicalRecordVisa(request);
        submitMedicalRecordVisaData.value = AsyncData(data: response);
        medicalRecordVisaData.value = AsyncData(data: response);
      }
    } catch (e) {
      logger.d('Error ${e.toString()}');
      submitMedicalRecordVisaData.value = AsyncData(error: e);
    }
  }

  Future<void> generateWithdrawalApplication(FormGroup formGroup) async {
    try {
      final pdfBytes = await _generateWithdrawalApplicationPdf(formGroup);
      if (pdfBytes != null) {
        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdfBytes,
        );
      } else {
        snackBarWidget(
          message: '取下申立書の生成に失敗しました',
          backgroundColor: Colors.red,
          prefixIcon: const Icon(Icons.error, color: Colors.white),
        );
      }
    } catch (e) {
      logger.e(e);
      snackBarWidget(
        message: '取下申立書の生成に失敗しました',
        backgroundColor: Colors.red,
        prefixIcon: const Icon(Icons.error, color: Colors.white),
      );
    }
  }

  Future<void> generateDepartureReport(FormGroup formGroup) async {
    try {
      final pdfBytes = await _generateDepartureReportPdf(formGroup);
      if (pdfBytes != null) {
        await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdfBytes,
        );
      } else {
        snackBarWidget(
          message: '出国報告書の生成に失敗しました',
          backgroundColor: Colors.red,
          prefixIcon: const Icon(Icons.error, color: Colors.white),
        );
      }
    } catch (e) {
      logger.e(e);
      snackBarWidget(
        message: '出国報告書の生成に失敗しました',
        backgroundColor: Colors.red,
        prefixIcon: const Icon(Icons.error, color: Colors.white),
      );
    }
  }

  Future<Uint8List?> _generateWithdrawalApplicationPdf(
      FormGroup formGroup) async {
    try {
      final pdf = pw.Document();

      // Load Japanese font
      final fontData = (await rootBundle.load('assets/fonts/NotoSans_JP.ttf'))
          .buffer
          .asUint8List();
      final ttf = pw.Font.ttf(fontData.buffer.asByteData());

      // Get form data
      final visaWithdrawalForm =
          formGroup.control('visaWithdrawal') as FormGroup;
      final subjectVisaWithdrawal =
          visaWithdrawalForm.control('subjectVisaWithdrawal').value ?? false;
      final deathOrOccurrenceEventDate =
          visaWithdrawalForm.control('deathOrOccurrenceEventDate').value;
      final remarks = visaWithdrawalForm.control('remarks').value ?? '';

      pdf.addPage(
        pw.MultiPage(
          margin: const pw.EdgeInsets.all(40),
          theme: pw.ThemeData(
            defaultTextStyle: pw.TextStyle(
              font: ttf,
              fontSize: 12,
            ),
          ),
          build: (context) => [
            pw.Header(
              level: 0,
              child: pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  '取下申立書',
                  style: pw.TextStyle(
                    font: ttf,
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
            pw.SizedBox(height: 30),
            pw.Text(
              '取下対象: ${subjectVisaWithdrawal ? 'あり' : 'なし'}',
              style: pw.TextStyle(font: ttf, fontSize: 14),
            ),
            if (deathOrOccurrenceEventDate != null) ...[
              pw.SizedBox(height: 10),
              pw.Text(
                '死亡・発生事象日: ${Dates.formShortDate(deathOrOccurrenceEventDate)}',
                style: pw.TextStyle(font: ttf, fontSize: 14),
              ),
            ],
            if (remarks.isNotEmpty) ...[
              pw.SizedBox(height: 10),
              pw.Text(
                '備考: $remarks',
                style: pw.TextStyle(font: ttf, fontSize: 14),
              ),
            ],
            pw.SizedBox(height: 20),
            pw.Text(
              '発行日: ${Dates.formShortDate(DateTime.now())}',
              style: pw.TextStyle(font: ttf, fontSize: 12),
            ),
          ],
        ),
      );

      return await pdf.save();
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<Uint8List?> _generateDepartureReportPdf(FormGroup formGroup) async {
    try {
      final pdf = pw.Document();

      // Load Japanese font
      final fontData = (await rootBundle.load('assets/fonts/NotoSans_JP.ttf'))
          .buffer
          .asUint8List();
      final ttf = pw.Font.ttf(fontData.buffer.asByteData());

      // Get travel info from form
      final requiredInJapanForm =
          formGroup.control('requiredInJapan') as FormGroup;
      final travelInfoArray =
          requiredInJapanForm.control('travelInfo') as FormArray;

      List<Map<String, dynamic>> travelInfoList = [];
      final travelInfoValue = travelInfoArray.value;
      if (travelInfoValue != null) {
        for (var item in travelInfoValue) {
          travelInfoList.add({
            'departureDateFromJapan': item['departureDateFromJapan'],
            'departureOut': item['departureOut'] ?? '',
            'arrivalOut': item['arrivalOut'] ?? '',
            'flightNumberOut': item['flightNumberOut'] ?? '',
            'departureTimeOut': item['departureTimeOut'] ?? '',
            'arrivalTimeOut': item['arrivalTimeOut'] ?? '',
            'seatNumberOut': item['seatNumberOut'] ?? '',
          });
        }
      }

      pdf.addPage(
        pw.MultiPage(
          margin: const pw.EdgeInsets.all(40),
          theme: pw.ThemeData(
            defaultTextStyle: pw.TextStyle(
              font: ttf,
              fontSize: 12,
            ),
          ),
          build: (context) => [
            pw.Header(
              level: 0,
              child: pw.Align(
                alignment: pw.Alignment.center,
                child: pw.Text(
                  '出国報告書',
                  style: pw.TextStyle(
                    font: ttf,
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
            pw.SizedBox(height: 30),
            if (travelInfoList.isEmpty)
              pw.Text(
                '出国情報が登録されていません',
                style: pw.TextStyle(font: ttf, fontSize: 14),
              )
            else
              ...travelInfoList.map((info) => pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      if (info['departureDateFromJapan'] != null)
                        pw.Text(
                          '出国日: ${Dates.formShortDate(info['departureDateFromJapan'])}',
                          style: pw.TextStyle(font: ttf, fontSize: 14),
                        ),
                      if (info['departureOut'] != null &&
                          info['departureOut'].toString().isNotEmpty)
                        pw.Text(
                          '出発地: ${info['departureOut']}',
                          style: pw.TextStyle(font: ttf, fontSize: 14),
                        ),
                      if (info['arrivalOut'] != null &&
                          info['arrivalOut'].toString().isNotEmpty)
                        pw.Text(
                          '到着地: ${info['arrivalOut']}',
                          style: pw.TextStyle(font: ttf, fontSize: 14),
                        ),
                      if (info['flightNumberOut'] != null &&
                          info['flightNumberOut'].toString().isNotEmpty)
                        pw.Text(
                          '便名: ${info['flightNumberOut']}',
                          style: pw.TextStyle(font: ttf, fontSize: 14),
                        ),
                      if (info['departureTimeOut'] != null &&
                          info['departureTimeOut'].toString().isNotEmpty)
                        pw.Text(
                          '出発時刻: ${info['departureTimeOut']}',
                          style: pw.TextStyle(font: ttf, fontSize: 14),
                        ),
                      if (info['arrivalTimeOut'] != null &&
                          info['arrivalTimeOut'].toString().isNotEmpty)
                        pw.Text(
                          '到着時刻: ${info['arrivalTimeOut']}',
                          style: pw.TextStyle(font: ttf, fontSize: 14),
                        ),
                      if (info['seatNumberOut'] != null &&
                          info['seatNumberOut'].toString().isNotEmpty)
                        pw.Text(
                          '座席番号: ${info['seatNumberOut']}',
                          style: pw.TextStyle(font: ttf, fontSize: 14),
                        ),
                      pw.SizedBox(height: 20),
                    ],
                  )),
            pw.SizedBox(height: 20),
            pw.Text(
              '発行日: ${Dates.formShortDate(DateTime.now())}',
              style: pw.TextStyle(font: ttf, fontSize: 12),
            ),
          ],
        ),
      );

      return await pdf.save();
    } catch (e) {
      logger.e(e);
      return null;
    }
  }
}
