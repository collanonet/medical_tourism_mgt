class Endpoints {
  Endpoints._();

  static const LOG_IN = '/auth/login';
  static const REFRESH_TOKEN = '/auth/refresh-token';
  static const LOG_OUT = '/auth/logout';

  static const GET_PRE_PATIENTS = '/pre-patients';
  static const GET_PRE_PATIENT = '/pre-patients';
  static const POST_PRE_PATIENTS = '/pre-patients';
  static const PUT_PRE_PATIENTS = '/pre-patients';
  static const DELETE_PRE_PATIENT = '/pre-patients';

  static const GET_PATIENTS = '/patients';
  static const GET_PATIENT = '/patients';
  static const GET_PATIENT_USER = '/patients/user-id';
  static const POST_PATIENTS = '/patients';
  static const PUT_PATIENTS = '/patients';
  static const DELETE_PATIENT = '/patients';

  static const GET_PATIENT_NAMES = '/patient-names';
  static const GET_PATIENT_NAMES_BY_PATIENT = '/patient-names/patient-id';
  static const GET_PATIENT_NAME = '/patient-names';
  static const POST_PATIENT_NAMES = '/patient-names';
  static const PUT_PATIENT_NAMES = '/patient-names';
  static const DELETE_PATIENT_NAMES = '/patient-names';

  static const GET_PATIENT_NATIONALITIES = '/patient-nationalities';
  static const GET_PATIENT_NATIONALITIES_BY_PATIENT =
      '/patient-nationalities/patient-id';
  static const GET_PATIENT_NATIONALITY = '/patient-nationalities';
  static const POST_PATIENT_NATIONALITIES = '/patient-nationalities';
  static const PUT_PATIENT_NATIONALITIES = '/patient-nationalities';
  static const DELETE_PATIENT_NATIONALITIES = '/patient-nationalities';

  static const GET_PATIENT_PASSPORTS = '/patient-passports';
  static const GET_PATIENT_PASSPORTS_BY_PATIENT =
      '/patient-passports/patient-id';
  static const GET_PATIENT_PASSPORT = '/patient-passports';
  static const POST_PATIENT_PASSPORTS = '/patient-passports';
  static const PUT_PATIENT_PASSPORTS = '/patient-passports';
  static const DELETE_PATIENT_PASSPORTS = '/patient-passports';

  static const GET_MEDICAL_RECORDS = '/medical-records';
  static const GET_MEDICAL_RECORDS_BY_PATIENT = '/medical-records/patient-id';
  static const GET_MEDICAL_RECORD = '/medical-records';
  static const POST_MEDICAL_RECORDS = '/medical-records';
  static const PUT_MEDICAL_RECORDS = '/medical-records';
  static const DELETE_MEDICAL_RECORDS = '/medical-records';

  static const GET_MEDICAL_RECORD_AGENTS = '/medical-record-agents';
  static const GET_MEDICAL_RECORD_AGENTS_BY_MEDICAL_RECORD =
      '/medical-record-agents/medical-record-id';
  static const GET_MEDICAL_RECORD_AGENT = '/medical-record-agents';
  static const POST_MEDICAL_RECORD_AGENTS = '/medical-record-agents';
  static const PUT_MEDICAL_RECORD_AGENTS = '/medical-record-agents';
  static const DELETE_MEDICAL_RECORD_AGENTS = '/medical-record-agents';

  static const GET_MEDICAL_RECORD_REFERRERS = '/medical-record-referrers';
  static const GET_MEDICAL_RECORD_REFERRER_BY_MEDICAL_RECORD =
      '/medical-record-referrers/medical-record-id';
  static const GET_MEDICAL_RECORD_REFERRER = '/medical-record-referrers';
  static const POST_MEDICAL_RECORD_REFERRER = '/medical-record-referrers';
  static const PUT_MEDICAL_RECORD_REFERRER = '/medical-record-referrers';
  static const DELETE_MEDICAL_RECORD_REFERRER = '/medical-record-referrers';

  static const GET_MEDICAL_RECORD_TRAVEL_GROUP = '/medical-record-travel-group';
  static const POST_MEDICAL_RECORD_TRAVEL_GROUP =
      '/medical-record-travel-group';

  static const GET_MEDICAL_RECORD_BUDGETS = '/medical-record-budgets';
  static const GET_MEDICAL_RECORD_BUDGETS_BY_MEDICAL_RECORD =
      '/medical-record-budgets/medical-record-id';
  static const GET_MEDICAL_RECORD_BUDGET = '/medical-record-budgets';
  static const POST_MEDICAL_RECORD_BUDGETS = '/medical-record-budgets';
  static const PUT_MEDICAL_RECORD_BUDGETS = '/medical-record-budgets';
  static const DELETE_MEDICAL_RECORD_BUDGETS = '/medical-record-budgets';

  static const GET_MEDICAL_RECORD_COMPANIONS = '/medical-record-companions';
  static const GET_MEDICAL_RECORD_COMPANIONS_BY_MEDICAL_RECORD =
      '/medical-record-companions/medical-record-id';
  static const GET_MEDICAL_RECORD_COMPANION = '/medical-record-companions';
  static const POST_MEDICAL_RECORD_COMPANIONS = '/medical-record-companions';
  static const PUT_MEDICAL_RECORD_COMPANIONS = '/medical-record-companions';
  static const DELETE_MEDICAL_RECORD_COMPANIONS = '/medical-record-companions';

  static const GET_MEDICAL_RECORD_HOSPITALS = '/medical-record-hospitals';
  static const GET_MEDICAL_RECORD_HOSPITALS_BY_MEDICAL_RECORD =
      '/medical-record-hospitals/medical-record-id';
  static const GET_MEDICAL_RECORD_HOSPITAL = '/medical-record-hospitals';
  static const POST_MEDICAL_RECORD_HOSPITALS = '/medical-record-hospitals';
  static const PUT_MEDICAL_RECORD_HOSPITALS = '/medical-record-hospitals';
  static const DELETE_MEDICAL_RECORD_HOSPITALS = '/medical-record-hospitals';

  static const MEDICAL_RECORD_PROPOSAL_BY_MEDICAL_RECORD =
      '/hospital-proposal/medical-record-id';
  static const MEDICAL_RECORD_PROPOSAL = '/hospital-proposal';

  static const MEDICAL_RECORD_PATIENT_RESPONSE_TREATMENT =
      '/medical-record-patient-response-treatment';
  static const MEDICAL_RECORD_PATIENT_RESPONSE_MEDICAL_CHECKUP =
      '/medical-record-patient-response-medical-checkup';
  static const MEDICAL_RECORD_PATIENT_RESPONSE_OTHER =
      '/medical-record-patient-response-other';

  static const MEDICAL_RECORD_SUMMARY = '/medical-record-summary';
  static const MEDICAL_RECORD_SUMMARY_LIST = '/medical-record-summary-list';

  static const GET_MEDICAL_RECORD_INTERPRETERS = '/medical-record-interpreters';
  static const GET_MEDICAL_RECORD_INTERPRETERS_BY_MEDICAL_RECORD =
      '/medical-record-interpreters/medical-record-id';
  static const GET_MEDICAL_RECORD_INTERPRETER = '/medical-record-interpreters';
  static const POST_MEDICAL_RECORD_INTERPRETERS =
      '/medical-record-interpreters';
  static const PUT_MEDICAL_RECORD_INTERPRETERS = '/medical-record-interpreters';
  static const DELETE_MEDICAL_RECORD_INTERPRETERS =
      '/medical-record-interpreters';

  static const GET_MEDICAL_RECORDS_PROGRESS = '/medical-records-progress';
  static const GET_MEDICAL_RECORDS_PROGRESS_BY_MEDICAL_RECORD =
      '/medical-records-progress/medical-record-id';
  static const GET_MEDICAL_RECORDS_PROGRES = '/medical-records-progress';
  static const POST_MEDICAL_RECORDS_PROGRESS = '/medical-records-progress';
  static const PUT_MEDICAL_RECORDS_PROGRESS = '/medical-records-progress';
  static const DELETE_MEDICAL_RECORDS_PROGRESS = '/medical-records-progress';

  static const MEDICAL_RECORDS_OVERSEAS_DATA = '/medical-records-overseas-data';
  static const MEDICAL_RECORDS_OVERSEAS_DATA_MEDICAL_RECORD =
      '/medical-records-overseas-data/medical-record';

  static const BOOKING_MEDICAL_RECORD = '/medical-record-web-booking';

  static const TYPE = '/types';
  static const AGENTS = '/agents';
  static const AGENT_MANAGER = '/agents-manager';
  static const WEB_BOOKING_ADMIN = '/web-booking-admin';

  static const MEDICAL_RECORD_PATIENT_RESPONSE_REGENERATIVE_MEDICAL =
      '/medical-record-patient-response-regenerative-medical';
  static const MEDICAL_RECORD_PATIENT_RESPONSE_BEAUTY =
      '/medical-record-patient-response-beauty';
  static const MEDICAL_RECORD_PATIENT_RESPONSE_BLOOD_PURIFICATION_THERAPY =
      '/medical-record-patient-response-blood-purification-therapy';
  static const MEDICAL_RECORD_PATIENT_RESPONSE_RISK_TEST =
      '/medical-record-patient-response-risk-test';

  //E1
  static const FILTER_PROCESS_CHART_PATIENT = '/filter-process-chart-patient';
  static const ITINERARY_SIMPLE_TITLE = '/itinerary-simple-title';
  static const ITINERARY_SIMPLE_EXPLANATION = '/itinerary-simple-explanation';
  static const ITINERARY_SIMPLE_INTERPRETOR_OR_GUIDE =
      '/itinerary-simple-interpretor-or-guide';
  static const ITINERARY_SIMPLE_TRANSFER_INPUT =
      '/itinerary-simple-transfer-input';
  static const DETAIL_FACILITY_HOSPITAL = '/detail-facility-hospital';
  static const DETAIL_FACILITY_DROP_IN_FACILITY =
      '/detail-facility-drop-in-facility';
  static const DETAIL_HOTEL_REGISTATION = '/detail-hotel-registation';
  static const DETAIL_HOTEL_SEARCH = '/detail-hotel-search';

  static const BASIC_INFORMATION_HOSPITAL = '/basic-information-hospital';
  static const MEDICAL_RECORD_BASIC_INFO_HOSPITAL =
      '/medical-record-information-hospital/hospital';

  static const DOCTOR_INFORMATION_HOSPITAL = '/doctor-information-hospital';

  static const ADDITIONALINFORMATION_HOSPITAL =
      '/additional-information-hospital';

  static const PAYMENT_OPTION_HOSPITAL = '/payment-option-hospital';

  static const SUPPORT_LANGUAGE_HOSPITAL = '/support-language-hospital';

  static const GET_HOW_TO_REQUEST_HOSPITAL = '/how-to-request-hospital';

  static const GET_NEW_REGISTRATION_HOSPITAL = '/new-registration-hospital';

  static const GET_LIST_SECTION_HOSPITAL = '/section-hospital';

  static const GET_MATERIAL_HOSPITAL = '/material-hospital';

  static const GET_WEB_RESERVATION_PATIENT = '/web-reservation-patient';

  static const GET_MEDICAL_INSTITUTION_HOSPITAL = '/medical-institutions';

  static const GET_HOSPITAL = '/hospital';
}
