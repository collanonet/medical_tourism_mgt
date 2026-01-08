// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_web_appointment/data_web_appointment.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'web_appointment_detail_form.dart';

@injectable
class WebAppointmentDetailModel {
  WebAppointmentDetailModel({
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

  final WebAppointmentRepository repository;
  FormGroup formGroup = formWebAppointment();

  ValueNotifier<AsyncData<List<BasicInformationHospitalResponse>>> hospitals =
      ValueNotifier(const AsyncData());

  Future<void> getHospitals() async {
    try {
      hospitals.value = const AsyncData(loading: true);
      final result = await repository.webBookingSearchHospital(search: '');
      hospitals.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
      hospitals.value = AsyncData(error: e);
    }
  }

  ValueNotifier<List<Patient>> patients = ValueNotifier([]);

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
      }
    } catch (e) {
      logger.e(e);
      patient.value = AsyncData(error: e);
    }
  }

  void searchPatient({String? search}) async {
    try {
      // Search does not affect the main 'patient' loading state, usually.
      // Or we can add a loading state for search results if needed.
      final result = await repository.webBookingSearchPatients(search: search);
      patients.value = result;
      // Auto-select if only one result?
      if (result.isNotEmpty) {
         // Optionally update singular patient if strict 1-to-1 match was expected
         // But for a list UI, we usually just show the list.
         // patient.value = AsyncData(data: result.first); 
      }
    } catch (e) {
      logger.e(e);
      patients.value = [];
    }
  }

  void selectPatient(Patient p) {
      patient.value = AsyncData(data: p);
      formGroup.control('patientName').value =
          '${p.firstNameRomanized} ${p.middleNameRomanized} ${p.familyNameRomanized}';
      getBookingByPatientId(p.id);
      getReservationAll(patientId: p.id);
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
                  validators: [
                    Validators.pattern(
                      ValidatorRegExp.date,
                    ),
                  ],
                ),
                'choice': FormControl<String>(value: '午前'),
                'timePeriodFrom': FormControl<String>(validators: [
                  Validators.pattern(
                    ValidatorRegExp.time,
                  ),
                ]),
                'timePeriodTo': FormControl<String>(validators: [
                  Validators.pattern(
                    ValidatorRegExp.time,
                  ),
                ]),
              }));
            }
          }
          
          // 希望日が1つもない場合、空行が消えているので戻す必要があるか？
          // UI的には「候補日を追加」ボタンがあるので0行でも問題ないかもだが、
          // 念のため希望日が0件だった場合はデフォルト行を再作成する？
          // いや、datesループが回らないなら0行になる。
          // 元のコードはFormArray([FormGroup(...)])で初期化されていた。
          // 0行だと編集しにくいかもしれないが、Addボタンはある。
          if (candidateDate.controls.isEmpty) {
             candidateDate.add(FormGroup({
              '_id': FormControl<String>(),
              'preferredDate': FormControl<DateTime>(
                validators: [
                  Validators.required,
                  Validators.pattern(
                    ValidatorRegExp.date,
                  ),
                ],
              ), // 第一希望
              'choice': FormControl<String>(value: '午前'), // 午前, 午後, 終日
              'timePeriodFrom': FormControl<String>(
                validators: [
                  Validators.required,
                  Validators.pattern(
                    ValidatorRegExp.time,
                  )
                ],
              ), // 時間帯（自）
              'timePeriodTo': FormControl<String>(
                validators: [
                  Validators.required,
                  Validators.pattern(
                    ValidatorRegExp.time,
                  )
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
      bookingByPatient.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<BasicInformationHospitalResponse>> hospital =
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

  void searchHospital({String? search}) async {
    try {
      hospital.value = const AsyncData(loading: true);
      final result = await repository.webBookingSearchHospital(search: search);
      hospital.value = AsyncData(data: result.first);

      if (hospital.value.hasData) {
        insertHospitalSchedule(search: search);
        getDoctorsByHospitalId(hospital.value.requireData.id);
      }
    } catch (e) {
      logger.e(e);
      hospital.value = AsyncData(error: e);
    }
  }

  void insertHospitalSchedule({String? search}) {
    var data = hospital.value.requireData;
    formGroup.control('medicalInstitutionName').value =search ??
        data.hospitalNameChinese;
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

    // Populate preferred dates (希望日) and remarks (備考)
    formGroup.control('preferredDate1').value = data.desiredDate1;
    formGroup.control('preferredDate2').value = data.desiredDate2;
    formGroup.control('preferredDate3').value = data.desiredDate3;
    formGroup.control('noDesiredDate').value = data.noDesiredDate ?? false;
    formGroup.control('remarks').value = data.reason;

    FormArray candidateDate = formGroup.control('candidateDate') as FormArray;

    if (data.proposedDates != null && data.proposedDates!.isNotEmpty) {
      candidateDate.clear(updateParent: true);
      data.proposedDates?.map((e) {
        candidateDate.add(FormGroup({
          '_id': FormControl<String>(value: e.id),
          'preferredDate': FormControl<DateTime>(
            value: e.proposedDate,
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'choice': FormControl<String>(value: e.selectMorningAfternoonAllDay),
          'timePeriodFrom':
              FormControl<String>(value: e.timeZoneFrom, validators: [
            Validators.pattern(
              ValidatorRegExp.time,
            ),
          ]),
          'timePeriodTo': FormControl<String>(value: e.timeZoneTo, validators: [
            Validators.pattern(
              ValidatorRegExp.time,
            ),
          ]),
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

  void submitData() {
    if (webBooking.value.hasData) {
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

  Future<bool> deleteReservation(String reservationId) async {
    try {
      submit.value = const AsyncData(loading: true);
      await repository.webBookingDeleteReservation(reservationId);
      submit.value = const AsyncData(data: null); // or some success indicator
      
      // Update local list immediately for UI responsiveness
      if (webBookings.value.hasData) {
        final currentList = webBookings.value.requireData;
        final updatedList =
            currentList.where((element) => element.id != reservationId).toList();
        webBookings.value = AsyncData(data: updatedList);
      } else {
         // Fallback if list wasn't loaded for some reason
         if (patient.value.data?.id != null) {
            getReservationAll(patientId: patient.value.data!.id);
         }
      }
      return true;
    } catch (e) {
      logger.e(e);
      submit.value = AsyncData(error: e);
      return false;
    }
  }

  ValueNotifier<AsyncData<List<WebBookingMedicalRecordResponse>>> webBookings =
      ValueNotifier(const AsyncData());

  void getReservationAll({
    String? hospitalId,
    String? patientId,
  }) async {
    try {
      webBookings.value = const AsyncData(loading: true);
      final result = await repository.webBookingGetReservationAll(
        hospitalId: hospitalId,
        patientId: patientId,
      );
      webBookings.value = AsyncData(data: result);
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
          TreamentRequest.fromJson(data.toJson()));
      bookingByPatient.value = AsyncData(data: result);
    } catch (e) {
      logger.e(e);
    }
  }
  int generateCandidateDates() {
    if (!hospital.value.hasData) {
      return 0;
    }

    final preferredDates = [
      formGroup.control('preferredDate1').value as DateTime?,
      formGroup.control('preferredDate2').value as DateTime?,
      formGroup.control('preferredDate3').value as DateTime?,
    ];

    if (preferredDates.every((element) => element == null)) {
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
