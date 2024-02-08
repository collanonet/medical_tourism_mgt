class Apis {
  Apis._();

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
  static const POST_MEDICAL_RECORD_TRAVEL_GROUP = '/medical-record-travel-group';

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

  static const GET_MEDICAL_RECORDS_OVERSEAS = '/medical-records-overseas';
  static const GET_MEDICAL_RECORDS_OVERSEAS_BY_MEDICAL_RECORD =
      '/medical-records-overseas/medical-record-id';
  static const GET_MEDICAL_RECORDS_OVERSEA = '/medical-records-overseas';
  static const POST_MEDICAL_RECORDS_OVERSEAS = '/medical-records-overseas';
  static const PUT_MEDICAL_RECORDS_OVERSEAS = '/medical-records-overseas';
  static const DELETE_MEDICAL_RECORDS_OVERSEAS = '/medical-records-overseas';

  static const GET_MEDICAL_RECORDS_OVERSEAS_DATAS =
      '/medical-records-overseas-data';
  static const GET_MEDICAL_RECORDS_OVERSEAS_DATA_BY_RECORDS_OVERSEAS =
      '/medical-records-overseas-data/medical-record-overseas-id';
  static const GET_MEDICAL_RECORDS_OVERSEAS_DATA =
      '/medical-records-overseas-data';
  static const POST_MEDICAL_RECORDS_OVERSEAS_DATA =
      '/medical-records-overseas-data';
  static const PUT_MEDICAL_RECORDS_OVERSEAS_DATA =
      '/medical-records-overseas-data';
  static const DELETE_MEDICAL_RECORDS_OVERSEAS_DATA =
      '/medical-records-overseas-data';
}
