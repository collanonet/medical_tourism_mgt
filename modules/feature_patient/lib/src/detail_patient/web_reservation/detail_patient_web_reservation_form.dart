import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formWebAppointment() => FormGroup({
      'patientName': FormControl<String>(),
      'preferredDate1': FormControl<DateTime>(), // 第１希望
      'preferredDate2': FormControl<DateTime>(), // 第２希望
      'preferredDate3': FormControl<DateTime>(), // 第３希望
      'noDesiredDate': FormControl<bool>(), // 希望日なし
      'remarks': FormControl<String>(), // 備考
      'medicalInstitutionName': FormControl<String>(
        validators: [Validators.required],
      ), // 医療機関名
      'doctorName': FormControl<DoctorProfileHospitalResponse>(
        validators: [Validators.required],
      ), // 医師名
      'department1': FormControl<String>(
        disabled: true,
      ),
      'department2': FormControl<String>(
        disabled: true,
      ),
      'shift1': FormControl<String>(
        disabled: true,
      ),
      'shift2': FormControl<String>(
        disabled: true,
      ),
      'shift1Mon': FormControl<String>(
        disabled: true,
      ),
      'shift1Tue': FormControl<String>(
        disabled: true,
      ),
      'shift1Wed': FormControl<String>(
        disabled: true,
      ),
      'shift1Thu': FormControl<String>(
        disabled: true,
      ),
      'shift1Fri': FormControl<String>(
        disabled: true,
      ),
      'shift1Sat': FormControl<String>(
        disabled: true,
      ),
      'shift1Sun': FormControl<String>(
        disabled: true,
      ),
      'shift2Mon': FormControl<String>(
        disabled: true,
      ),
      'shift2Tue': FormControl<String>(
        disabled: true,
      ),
      'shift2Wed': FormControl<String>(
        disabled: true,
      ),
      'shift2Thu': FormControl<String>(
        disabled: true,
      ),
      'shift2Fri': FormControl<String>(
        disabled: true,
      ),
      'shift2Sat': FormControl<String>(
        disabled: true,
      ),
      'shift2Sun': FormControl<String>(
        disabled: true,
      ),
      'candidateDate': FormArray([
        FormGroup({
          'id': FormControl<String>(),
          'preferredDate': FormControl<DateTime>(
            validators: [
              Validators.required,
              Validators.pattern(r'^\d{4}/(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])$'),
            ],
          ), // 第一希望
          'choice': FormControl<String>(value: '午前'), // 午前, 午後, 終日
          'timePeriodFrom': FormControl<String>(
            validators: [
              Validators.required,
              Validators.pattern(
                  r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$'),
            ],
          ), // 時間帯（自）
          'timePeriodTo': FormControl<String>(
            validators: [
              Validators.required,
              // validate time format
              Validators.pattern(
                  r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$'),
            ],
          ), // 時間帯（至）
        }),
      ]),
      'message': FormControl<String>(), // メッセージ（希望日がない場合は、メッセージ欄にてその旨伝えてください）
      'testCallDate': FormControl<DateTime>(), // 年月日
      'testCallTime': FormControl<String>(
        validators: [
          Validators.pattern(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$'),
        ],
      ), // 時間
    });
