import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup detailPatientWebReservationForm() => FormGroup({
      'preferredDate1': FormControl<DateTime>(
        disabled: true,
      ), // 第１希望
      'preferredDate2': FormControl<DateTime>(
        disabled: true,
      ), // 第２希望
      'preferredDate3': FormControl<DateTime>(
        disabled: true,
      ), // 第３希望
      'noDesiredDate': FormControl<bool>(
        disabled: true,
      ), // 希望日なし
      'remarks': FormControl<String>(
        disabled: true,
      ), // 備考
      'medicalInstitutionName': FormControl<String>(), // 医療機関名
      'doctorName': FormControl<String>(), // 医師名
      'shift1': FormControl<String>(value: '10時〜12時'), //
      'shift2': FormControl<String>(value: '13時〜16時'), //
      'candidateDate': FormArray([
        FormGroup({
          'id' : FormControl<String>(),
          'preferredDate': FormControl<DateTime>(), // 第一希望
          'choice': FormControl<String>(value: '午前'), // 午前, 午後, 終日
          'timePeriodFrom': FormControl<String>(), // 時間帯（自）
          'timePeriodTo': FormControl<String>(), // 時間帯（至）
          'medicalRecord' : FormControl<String>(),
        }),
      ]),
      'message': FormControl<String>(), // メッセージ（希望日がない場合は、メッセージ欄にてその旨伝えてください）
      'date': FormControl<DateTime>(), // 年月日
      'time': FormControl<TimeOfDay>(), // 時間
    });
