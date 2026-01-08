// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'detail_patient_web_reservation_form.dart';

@injectable
class DetailPatientWebReservationModel {
  DetailPatientWebReservationModel({
    required this.repository,
  }) {
    getHospitals();
    formGroup.control('hospitalSelect').valueChanges.listen((hospital) {
      if (hospital is BasicInformationHospitalResponse) {
        this.hospital.value = AsyncData(data: hospital);
        insertHospitalSchedule();
        getDoctorsByHospitalId(hospital.id);
      }
    });
  }

  final PatientRepository repository;

  FormGroup formGroup = formWebAppointment();

  ValueNotifier<AsyncData<Patient>> patient = ValueNotifier(const AsyncData());

  void getPatientById(String id) async {
    try {
      patient.value = const AsyncData(loading: true);
      final result = await repository.webBookingGetPatientById(id);
      patient.value = AsyncData(data: result);
      if (patient.value.hasData) {
        formGroup.control('patientName').value =
            '${patient.value.requireData.firstNameRomanized} ${patient.value.requireData.middleNameRomanized} ${patient.value.requireData.familyNameRomanized}';
        getBookingByPatientId(patient.value.requireData.id);
        getReservationAll();
      }
    } catch (e) {
      logger.e(e);
      patient.value = AsyncData(error: e);
    }
  }

  void searchPatient({String? search}) async {
    try {
      patient.value = const AsyncData(loading: true);
      final result = await repository.webBookingSearchPatients(search: search);
      patient.value = AsyncData(data: result.first);
      if (patient.value.hasData) {
        getBookingByPatientId(patient.value.requireData.id);
      }
    } catch (e) {
      logger.e(e);
      patient.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<TreamentResponce>> bookingByPatient =
      ValueNotifier(const AsyncData());

  void getBookingByPatientId(String patientId) async {
    try {
      bookingByPatient.value = const AsyncData(loading: true);
      final result = await repository.getBookingByPatientId(patientId);
      bookingByPatient.value = AsyncData(data: result);

      if (bookingByPatient.value.hasData) {
        formGroup.control('preferredDate1').value =
            bookingByPatient.value.requireData.desiredDate1;
        formGroup.control('preferredDate2').value =
            bookingByPatient.value.requireData.desiredDate2;
        formGroup.control('preferredDate3').value =
            bookingByPatient.value.requireData.desiredDate3;
        var noDesiredDate =
            bookingByPatient.value.requireData.desiredDate1 == null &&
                bookingByPatient.value.requireData.desiredDate2 == null &&
                bookingByPatient.value.requireData.desiredDate3 == null;
        formGroup.control('noDesiredDate').value = noDesiredDate;
        formGroup.control('remarks').value =
            bookingByPatient.value.requireData.reason;

        // 候補日が空の場合、患者の希望日を自動セットする
        FormArray candidateDate =
            formGroup.control('candidateDate') as FormArray;
        
        bool isCandidateEmpty = candidateDate.value == null || candidateDate.value!.isEmpty;
        // デフォルトの空行（1行かつpreferredDateがnull）の場合も空とみなす
        if (!isCandidateEmpty && candidateDate.value!.length == 1) {
           var first = candidateDate.value![0] as Map<String, dynamic>?;
           if (first != null && first['preferredDate'] == null) {
             isCandidateEmpty = true;
             candidateDate.clear(); // プレースホルダーを削除
           }
        }
        
        if (isCandidateEmpty) {
          var dates = [
            bookingByPatient.value.requireData.desiredDate1,
            bookingByPatient.value.requireData.desiredDate2,
            bookingByPatient.value.requireData.desiredDate3
          ];

          for (var date in dates) {
            if (date != null) {
              candidateDate.add(FormGroup({
                '_id': FormControl<String>(),
                'preferredDate': FormControl<DateTime>(
                  value: date,
                ),
                'choice': FormControl<String>(value: '午前'),
                'timePeriodFrom': FormControl<String>(validators: [
                ]),
                'timePeriodTo': FormControl<String>(validators: [
                ]),
              }));
            }
          }

          if (candidateDate.controls.isEmpty) {
             candidateDate.add(FormGroup({
              '_id': FormControl<String>(),
              'preferredDate': FormControl<DateTime>(
                validators: [
                  Validators.required,
                ],
              ), // 第一希望
              'choice': FormControl<String>(value: '午前'), // 午前, 午後, 終日
              'timePeriodFrom': FormControl<String>(
                validators: [
                  Validators.required,
                ],
              ), // 時間帯（自）
              'timePeriodTo': FormControl<String>(
                validators: [
                  Validators.required,
                ],
              ), // 時間帯（至）
            }));
          }
        }
      } else {
        formGroup.control('noDesiredDate').value = true;
      }
    } catch (e) {
      logger.e(e);
      formGroup.control('noDesiredDate').value = true;

      // 404エラーの場合は、データが存在しないだけなので、エラーとして扱わない
      if (e is DioException && e.response?.statusCode == 404) {
        bookingByPatient.value = const AsyncData(); // データなし（正常）
      } else {
        bookingByPatient.value = AsyncData(error: e); // 実際のエラー
      }
    }
  }

  ValueNotifier<AsyncData<BasicInformationHospitalResponse>> hospital =
      ValueNotifier(const AsyncData());

  ValueNotifier<AsyncData<List<BasicInformationHospitalResponse>>> hospitals =
      ValueNotifier(const AsyncData());

  void getHospitalById(String id) async {
    try {
      hospital.value = const AsyncData(loading: true);
      final result = await repository.webBookingGetHospitalById(id);
      hospital.value = AsyncData(data: result);

      if (hospital.value.hasData) {
        formGroup.control('medicalInstitutionName').value =
            hospital.value.requireData.hospitalNameKatakana;
        
        if (hospitals.value.hasData) {
          try {
            final selectedHospital = hospitals.value.requireData.firstWhere(
              (element) => element.id == hospital.value.requireData.id,
            );
            formGroup.control('hospitalSelect').value = selectedHospital;
          } catch (e) {
            logger.e('Selected hospital not found in the list: $e');
          }
        }

        insertHospitalSchedule();
        getDoctorsByHospitalId(hospital.value.requireData.id);
      }
    } catch (e) {
      logger.e(e);
      hospital.value = AsyncData(error: e);
    }
  }

  void getHospitals() async {
    try {
      hospitals.value = const AsyncData(loading: true);
      final result = await repository.webBookingSearchHospital(search: '');
      hospitals.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      hospitals.value = AsyncData(error: e);
    }
  }

  void searchHospital({String? search}) async {
    try {
      hospitals.value = const AsyncData(loading: true);
      final result = await repository.webBookingSearchHospital(search: search);
      hospitals.value = AsyncData(data: result);

      if (hospitals.value.hasData && hospitals.value.requireData.isNotEmpty) {
        // 複数の病院が検索された場合、最初の病院を選択しない
        // ユーザーが手動で選択する必要がある
      }
    } catch (e) {
      logger.e(e);
      hospitals.value = AsyncData(error: e);
    }
  }

  void selectHospital(BasicInformationHospitalResponse selectedHospital) {
    hospital.value = AsyncData(data: selectedHospital);
    formGroup.control('hospitalSelect').value = selectedHospital;
    // formGroup.control('medicalInstitutionName').value =
    //     selectedHospital.hospitalNameChinese;
    insertHospitalSchedule();
    getDoctorsByHospitalId(selectedHospital.id);
    // 検索結果リストを非表示にする
    hospitals.value = const AsyncData();
  }

  void insertHospitalSchedule({String? search}) {
    var data = hospital.value.requireData;
    formGroup.control('medicalInstitutionName').value =
        search ?? data.hospitalNameChinese;
    formGroup.control('department1').value = data.department1;
    formGroup.control('department2').value = data.department2;
    formGroup.control('shift1').value = data.shift1;
    formGroup.control('shift1End').value = data.shift1End;
    formGroup.control('shift2').value = data.shift2;
    formGroup.control('shift2End').value = data.shift2End;
    formGroup.control('shift1Mon').value = data.shift1Mon;
    formGroup.control('shift1Tue').value = data.shift1Tue;
    formGroup.control('shift1Wed').value = data.shift1Wed;
    formGroup.control('shift1Thu').value = data.shift1Thu;
    formGroup.control('shift1Fri').value = data.shift1Fri;
    formGroup.control('shift1Sat').value = data.shift1Sat;
    formGroup.control('shift1Sun').value = data.shift1Sun;
    formGroup.control('shift2Mon').value = data.shift2Mon;
    formGroup.control('shift2Tue').value = data.shift2Tue;
    formGroup.control('shift2Wed').value = data.shift2Wed;
    formGroup.control('shift2Thu').value = data.shift2Thu;
    formGroup.control('shift2Fri').value = data.shift2Fri;
    formGroup.control('shift2Sat').value = data.shift2Sat;
    formGroup.control('shift2Sun').value = data.shift2Sun;
  }

  ValueNotifier<AsyncData<List<DoctorProfileHospitalResponse>>> doctors =
      ValueNotifier(const AsyncData());

  void getDoctorsByHospitalId(String hospitalId) async {
    try {
      doctors.value = const AsyncData(loading: true);
      final result = await repository.getDoctorsByHospitalId(hospitalId);
      doctors.value = AsyncData(data: result);
      if (webBooking.value.hasData && doctors.value.hasData) {
        doctorSelected.value = AsyncData(
            data: doctors.value.requireData.firstWhere((element) =>
                element.id == webBooking.value.requireData.doctor?.id));

        if (doctorSelected.value.hasData) {
          formGroup.control('doctorName').value =
              doctorSelected.value.requireData;
        }
      }
    } catch (e) {
      logger.e(e);
      doctors.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<DoctorProfileHospitalResponse>> doctorSelected =
      ValueNotifier(const AsyncData());

  void selectDoctor(DoctorProfileHospitalResponse doctor) {
    doctorSelected.value = AsyncData(data: doctor);
  }

  ValueNotifier<AsyncData<WebBookingMedicalRecordResponse>> webBooking =
      ValueNotifier(const AsyncData());

  void getReservationById({String? id}) async {
    try {
      if (id != null) {
        webBooking.value = const AsyncData(loading: true);
        final result = await repository.webBookingGetReservationById(id);
        webBooking.value = AsyncData(data: result);

        if (webBooking.value.hasData) {
          insertWebBooking();
          formGroup.control('testCallDate').value =
              webBooking.value.requireData.testCallDate;
          formGroup.control('testCallTime').value =
              webBooking.value.requireData.testCallTime;
          getPatientById(webBooking.value.requireData.patient?.id ?? '');
          getHospitalById(webBooking.value.requireData.hospital?.id ?? '');
        }
      }
    } catch (e) {
      logger.e(e);
      webBooking.value = AsyncData(error: e);
    }
  }

  void insertWebBooking() {
    var data = webBooking.value.requireData;

    FormArray candidateDate = formGroup.control('candidateDate') as FormArray;

    if (data.proposedDates != null && data.proposedDates!.isNotEmpty) {
      candidateDate.clear(updateParent: true);
      data.proposedDates?.map((e) {
        candidateDate.add(FormGroup({
          '_id': FormControl<String>(value: e.id),
          'preferredDate': FormControl<DateTime>(
            value: e.proposedDate,
          ),
          'choice': FormControl<String>(value: e.selectMorningAfternoonAllDay),
          'timePeriodFrom': FormControl<String>(value: e.timeZoneFrom),
          'timePeriodTo': FormControl<String>(value: e.timeZoneTo),
        }));
      }).toList();
    }
  }

  ValueNotifier<AsyncData<WebBookingMedicalRecordResponse>> submit =
      ValueNotifier(const AsyncData());

  void submitReservation(WebBookingMedicalRecordRequest request) async {
    try {
      submit.value = const AsyncData(loading: true);
      final result = await repository.webBookingPostReservation(request);
      submit.value = AsyncData(data: result);
      webBooking.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      submit.value = AsyncData(error: e);
    } finally {
      getReservationAll();
    }
  }

  void updateReservation(
      String reservationId, WebBookingMedicalRecordRequest request) async {
    try {
      submit.value = const AsyncData(loading: true);
      final result =
          await repository.webBookingPutReservation(reservationId, request);
      submit.value = AsyncData(data: result);
      webBooking.value = AsyncData(data: result);
      formGroup.control('message').value = null;
    } catch (e) {
      logger.e(e);
      submit.value = AsyncData(error: e);
    }
  }

  Future<void> submitData() async {
    if (webBooking.value.hasData) {
      await updateBooking();

      List<ProposedDate> proposedDates = [];

      formGroup.control('candidateDate').value.forEach((element) {
        proposedDates.add(ProposedDate(
          id: element['_id'],
          proposedDate: element['preferredDate'],
          selectMorningAfternoonAllDay: element['choice'],
          timeZoneFrom: element['timePeriodFrom'],
          timeZoneTo: element['timePeriodTo'],
        ));
      });

      List<MessageFrom> messageFrom = webBooking.value.data!.messageFrom ?? [];

      if (formGroup.control('message').value != null) {
        messageFrom.add(MessageFrom(
          message: formGroup.control('message').value,
          from: 'Admin',
        ));
      }

      var request = WebBookingMedicalRecordRequest(
        patientName:
            '${patient.value.data?.firstNameRomanized ?? '-'} ${patient.value.data?.middleNameRomanized ?? '-'} ${patient.value.data?.familyNameRomanized ?? '-'}',
        patient: patient.value.data?.id,
        hospital: hospital.value.data?.id,
        doctor: doctorSelected.value.data?.id,
        proposedDates: proposedDates,
        messageFrom: messageFrom,
        isClosed: webBooking.value.data?.isClosed,
        timeZoneConfirmationTo: webBooking.value.data?.timeZoneConfirmationTo,
        timeZoneConfirmationFrom:
            webBooking.value.data?.timeZoneConfirmationFrom,
        reservationConfirmationDate:
            webBooking.value.data?.reservationConfirmationDate,
        testCallDate: formGroup.control('testCallDate').value,
        testCallTime: formGroup.control('testCallTime').value,
        desiredDate1: formGroup.control('preferredDate1').value,
        desiredDate2: formGroup.control('preferredDate2').value,
        desiredDate3: formGroup.control('preferredDate3').value,
        reason: formGroup.control('remarks').value,
      );
      updateReservation(webBooking.value.requireData.id, request);
    } else {
      List<ProposedDate> proposedDates = [];

      formGroup.control('candidateDate').value.forEach((element) {
        proposedDates.add(ProposedDate(
          id: element['_id'],
          proposedDate: element['preferredDate'],
          selectMorningAfternoonAllDay: element['choice'],
          timeZoneFrom: element['timePeriodFrom'],
          timeZoneTo: element['timePeriodTo'],
        ));
      });
      List<MessageFrom> messageFrom = [];

      if (formGroup.control('message').value != null) {
        messageFrom.add(MessageFrom(
          message: formGroup.control('message').value,
          from: 'Admin',
        ));
      }
      var request = WebBookingMedicalRecordRequest(
        patientName:
            '${patient.value.data?.firstNameRomanized ?? '-'} ${patient.value.data?.middleNameRomanized ?? '-'} ${patient.value.data?.familyNameRomanized ?? '-'}',
        patient: patient.value.data?.id,
        hospital: hospital.value.data?.id,
        doctor: doctorSelected.value.data?.id,
        proposedDates: proposedDates,
        messageFrom: messageFrom,
        testCallDate: formGroup.control('testCallDate').value,
        testCallTime: formGroup.control('testCallTime').value,
        desiredDate1: formGroup.control('preferredDate1').value,
        desiredDate2: formGroup.control('preferredDate2').value,
        desiredDate3: formGroup.control('preferredDate3').value,
        reason: formGroup.control('remarks').value,
      );
      submitReservation(request);
    }
  }

  ValueNotifier<AsyncData<List<WebBookingMedicalRecordResponse>>> webBookings =
      ValueNotifier(const AsyncData());

  void getReservationAll() async {
    try {
      webBookings.value = const AsyncData(loading: true);
      final result = await repository.webBookingGetReservationAll(
        patientId: patient.value.requireData.id,
      );
      webBookings.value = AsyncData(data: result);
      
      // Populate webBooking (singular) from first item for editing
      if (result.isNotEmpty) {
        webBooking.value = AsyncData(data: result.first);
        insertWebBooking();
        formGroup.control('testCallDate').value = result.first.testCallDate;
        formGroup.control('testCallTime').value = result.first.testCallTime;
        if (result.first.hospital?.id != null) {
          getHospitalById(result.first.hospital!.id);
        }
      }
    } catch (e) {
      logger.e(e);
      webBookings.value = AsyncData(error: e);
    }
  }

  Future<void> updateBooking() async {
    try {
      TreamentRequest data;

      if (bookingByPatient.value.hasData) {
        data = TreamentRequest.fromJson(
            bookingByPatient.value.requireData.toJson());

        data = data.copyWith(
          desiredDate1: formGroup.control('preferredDate1').value,
          desiredDate2: formGroup.control('preferredDate2').value,
          desiredDate3: formGroup.control('preferredDate3').value,
          medicalName: hospital.value.requireData.hospitalNameKatakana,
          reason: formGroup.control('remarks').value,
        );
      } else {
        data = TreamentRequest(
          desiredDate1: formGroup.control('preferredDate1').value,
          desiredDate2: formGroup.control('preferredDate2').value,
          desiredDate3: formGroup.control('preferredDate3').value,
          medicalName: hospital.value.requireData.hospitalNameKatakana,
          reason: formGroup.control('remarks').value,
        );
      }

      bookingByPatient.value = const AsyncData(loading: true);
      final result = await repository.updateBooking(
          patient.value.requireData.id,
          data);
      bookingByPatient.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
    }
  }

  int generateCandidateDates() {
    if (!hospital.value.hasData) {
      logger.d('generateCandidateDates: No hospital data');
      return 0;
    }

    final preferredDates = [
      formGroup.control('preferredDate1').value as DateTime?,
      formGroup.control('preferredDate2').value as DateTime?,
      formGroup.control('preferredDate3').value as DateTime?,
    ];

    if (preferredDates.every((element) => element == null)) {
      logger.d('generateCandidateDates: No preferred dates selected');
      return 0;
    }

    final data = hospital.value.requireData;
    final candidateDate = formGroup.control('candidateDate') as FormArray;
    candidateDate.clear(updateParent: true);

    int addedCount = 0;
    for (var date in preferredDates) {
      if (date == null) continue;

      // 曜日を取得 (Monday=1, ..., Sunday=7)
      final weekday = date.weekday;

      // シフト1の確認
      if (_isShiftOpen(data, 1, weekday)) {
        _addCandidate(candidateDate, date, data.shift1 ?? '', '午前');
        addedCount++;
      } 

      // シフト2の確認
      if (_isShiftOpen(data, 2, weekday)) {
        _addCandidate(candidateDate, date, data.shift2 ?? '', '午後');
        addedCount++;
      }
    }

    return addedCount;
  }

  String? _getShiftStatus(BasicInformationHospitalResponse data, int shiftType, int weekday) {
     switch (weekday) {
      case DateTime.monday:
        return shiftType == 1 ? data.shift1Mon : data.shift2Mon;
      case DateTime.tuesday:
        return shiftType == 1 ? data.shift1Tue : data.shift2Tue;
      case DateTime.wednesday:
        return shiftType == 1 ? data.shift1Wed : data.shift2Wed;
      case DateTime.thursday:
        return shiftType == 1 ? data.shift1Thu : data.shift2Thu;
      case DateTime.friday:
        return shiftType == 1 ? data.shift1Fri : data.shift2Fri;
      case DateTime.saturday:
        return shiftType == 1 ? data.shift1Sat : data.shift2Sat;
      case DateTime.sunday:
        return shiftType == 1 ? data.shift1Sun : data.shift2Sun;
    }
    return null;
  }

  bool _isShiftOpen(
      BasicInformationHospitalResponse data, int shiftType, int weekday) {
    
    final status = _getShiftStatus(data, shiftType, weekday);
    // '○', '〇', 'O', 'o' などを許可
    const validStatuses = ['○', '〇', 'O', 'o', 'true'];
    return status != null && validStatuses.contains(status);
  }

  void _addCandidate(
      FormArray candidateDate, DateTime date, String shiftTime, String choice) {
    String start = '';
    String end = '';
    // shiftTime e.g. "09:00〜12:00" or "09:00-12:00"
    if (shiftTime.isNotEmpty) {
      // 共通の区切り文字で分割を試みる
      final split = shiftTime.split(RegExp(r'[〜\-]'));
      if (split.length >= 2) {
        start = split[0].trim();
        end = split[1].trim();
      }
    }

    final group = FormGroup({
      '_id': FormControl<String>(),
      'preferredDate': FormControl<DateTime>(
        value: date,
        validators: [Validators.required],
      ),
      'choice': FormControl<String>(value: choice),
      'timePeriodFrom': FormControl<String>(
        value: start,
        validators: [Validators.required],
      ),
      'timePeriodTo': FormControl<String>(
        value: end,
        validators: [Validators.required],
      ),
    });
    
    candidateDate.add(group);
  }
}
