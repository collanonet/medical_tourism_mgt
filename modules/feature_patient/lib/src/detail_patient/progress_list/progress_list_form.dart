import 'package:reactive_forms/reactive_forms.dart';

FormGroup progressListForm() {
  return FormGroup({
    'contactUs': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'contactUs',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: 'お問い合せ',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'application': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'application',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: 'お申込み',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'submitMaterials': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'submitMaterials',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: '資料提出',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'medicalInstitutionSelectionProposal': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'medicalInstitutionSelectionProposal',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: '医療機関の選定・ご提案',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'contractConclusionDeposit': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'contractConclusionDeposit',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: '契約締結・入金',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'documentTranslationHospitalInquiries': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'documentTranslationHospitalInquiries',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: '資料翻訳・病院問い合わせ',
      ),
      'remarks': FormControl<String>(),
      'completionDate': FormControl<DateTime>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'judgingWhetherToVisitJapanForTreatment': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'judgingWhetherToVisitJapanForTreatment',
      ),
      'tag': FormControl<String?>(
        value: '病院',
      ),
      'task': FormControl<String>(
        value: '訪日治療適応判断（オンライン・書面）',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'decidingToComeToJapan': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'decidingToComeToJapan',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: '来日決定・お見積提示・入金',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'medicalVisaApplicationOfArrivalDate': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'medicalVisaApplicationOfArrivalDate',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: '医療ビザ申請・来日日程確定',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'submitVisaAirlineTicketInformation': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'submitVisaAirlineTicketInformation',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: 'ビザ・航空券情報提出',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'officialReservationAtAMedicalInstitution': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'officialReservationAtAMedicalInstitution',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: '医療機関の正式予約',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'treatmentExaminationSupportInJapan': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'treatmentExaminationSupportInJapan',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: '来日治療・受診サポート',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'completionOfTreatment': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'completionOfTreatment',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: '治療終了・帰国・フォローアップ',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'treatment',
      ),
    }),
    'contactUs1': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'contactUs',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: 'お問い合せ',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'application1': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'application',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: 'お申込み',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'submitRequiredInformation': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'submitRequiredInformation',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: '必要情報提出',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'hospitalCourseSelectionProposal': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'hospitalCourseSelectionProposal',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: '病院・コースの選定・ご提案',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'courseConfirmationScheduleAdjustmentTentativeReservation': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'courseConfirmationScheduleAdjustmentTentativeReservation',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: 'コース確定・日程調整・仮予約',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'contractConclusionDeposit1': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'contractConclusionDeposit',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: '契約締結・入金',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'officialReservationAtAMedicalInstitution1': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'officialReservationAtAMedicalInstitution',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: '医療機関の正式予約',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'estimateForAdditionalServicesSuchAsAccommodationAndSightseeing':
        FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'estimateForAdditionalServicesSuchAsAccommodationAndSightseeing',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: '宿泊・観光等追加サービスお見積',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'submitVisaAirlineTicketInformation1': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'submitVisaAirlineTicketInformation',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: 'ビザ・航空券情報提出',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'fillConfirmMedicalQuestionnaire': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'fillConfirmMedicalQuestionnaire',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: '問診票記入・確認',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'medicalExaminationAccompanied': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'medicalExaminationAccompanied',
      ),
      'tag': FormControl<String?>(
        value: '患者',
      ),
      'task': FormControl<String>(
        value: '医療通訳同行にて健診受診',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
    'sendingResultReport': FormGroup({
      'id': FormControl<String?>(),
      'completed': FormControl<bool>(
        value: false,
      ),
      'key': FormControl<String>(
        value: 'sendingResultReport',
      ),
      'tag': FormControl<String?>(
        value: '当社',
      ),
      'task': FormControl<String>(
        value: '結果報告書送付・フォローアップ',
      ),
      'completionDate': FormControl<DateTime>(),
      'remarks': FormControl<String>(),
      'medicalRecord': FormControl<String>(),
      'type': FormControl<String>(
        value: 'procedure',
      ),
    }),
  });
}
