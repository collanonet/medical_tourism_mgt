class Apis {
  Apis._();

  static const LOG_IN = '/auth/login';
  static const REFRESH_TOKEN = '/auth/refresh-token';
  static const LOG_OUT = '/auth/logout';

  static const GET_PRE_PATIENTS = '/pre-patients';
  static const POST_PRE_PATIENTS = '/pre-patients';
  static const PUT_PRE_PATIENTS = '/pre-patients';
  static const DELETE_PRE_PATIENT = '/pre-patients';

  static const GET_PATIENTS = '/patients';
  static const POST_PATIENTS = '/patients';
  static const PUT_PATIENTS = '/patients';
  static const DELETE_PATIENT = '/patients';

  static const GET_PATIENT_NAMES = '/patient-names/patient-id';
  static const POST_PATIENT_NAMES = '/patients-names';
  static const PUT_PATIENT_NAMES = '/patients-names';
  static const DELETE_PATIENT_NAMES = '/patients-names';

  static const GET_PATIENT_NATIONALITIES = '/patient-nationalities/patient-id';
  static const POST_PATIENT_NATIONALITIES = '/patients-nationalities';
  static const PUT_PATIENT_NATIONALITIES = '/patients-nationalities';
  static const DELETE_PATIENT_NATIONALITIES = '/patients-nationalities';

  static const GET_PATIENT_PASSPORTS = '/patient-passports/patient-id';
  static const POST_PATIENT_PASSPORTS = '/patients-passports';
  static const PUT_PATIENT_PASSPORTS = '/patients-passports';
  static const DELETE_PATIENT_PASSPORTS = '/patients-passports';

  static const GET_MEDICAL_RECORDS = '/medical-records';
  static const POST_MEDICAL_RECORDS = '/medical-records';
  static const PUT_MEDICAL_RECORDS = '/medical-records';
  static const DELETE_MEDICAL_RECORDS = '/medical-records';

  static const GET_MEDICAL_RECORD_AGENTS = '/medical-record-agents/medical-record-id';
  static const POST_MEDICAL_RECORD_AGENTS = '/medical-record-agents';
  static const PUT_MEDICAL_RECORD_AGENTS = '/medical-record-agents';
  static const DELETE_MEDICAL_RECORD_AGENTS = '/medical-record-agents';

  static const GET_MEDICAL_RECORD_BUDGETS = '/medical-record-budgets/medical-record-id';
  static const POST_MEDICAL_RECORD_BUDGETS = '/medical-record-budgets';
  static const PUT_MEDICAL_RECORD_BUDGETS = '/medical-record-budgets';
  static const DELETE_MEDICAL_RECORD_BUDGETS = '/medical-record-budgets';

  static const GET_MEDICAL_RECORD_COMPANIONS = '/medical-record-companions/medical-record-id';
  static const POST_MEDICAL_RECORD_COMPANIONS = '/medical-record-companions';
  static const PUT_MEDICAL_RECORD_COMPANIONS = '/medical-record-companions';
  static const DELETE_MEDICAL_RECORD_COMPANIONS = '/medical-record-companions';

  static const GET_MEDICAL_RECORD_HOSPITALS = '/medical-record-hospitals/medical-record-id';
  static const POST_MEDICAL_RECORD_HOSPITALS = '/medical-record-hospitals';
  static const PUT_MEDICAL_RECORD_HOSPITALS = '/medical-record-hospitals';
  static const DELETE_MEDICAL_RECORD_HOSPITALS = '/medical-record-hospitals';

  static const GET_MEDICAL_RECORD_INTERPRETERS = '/medical-record-interpreters/medical-record-id';
  static const POST_MEDICAL_RECORD_INTERPRETERS = '/medical-record-interpreters';
  static const PUT_MEDICAL_RECORD_INTERPRETERS = '/medical-record-interpreters';
  static const DELETE_MEDICAL_RECORD_INTERPRETERS = '/medical-record-interpreters';

  static const GET_MEDICAL_RECORDS_PROGRESS = '/medical-records-progress/medical-record-id';
  static const POST_MEDICAL_RECORDS_PROGRESS = '/medical-records-progress';
  static const PUT_MEDICAL_RECORDS_PROGRESS = '/medical-records-progress';
  static const DELETE_MEDICAL_RECORDS_PROGRESS = '/medical-records-progress';

  static const GET_MEDICAL_RECORDS_OVERSEAS = '/medical-records-overseas/medical-record-id';
  static const POST_MEDICAL_RECORDS_OVERSEAS = '/medical-records-overseas';
  static const PUT_MEDICAL_RECORDS_OVERSEAS = '/medical-records-overseas';
  static const DELETE_MEDICAL_RECORDS_OVERSEAS = '/medical-records-overseas';

  static const GET_MEDICAL_RECORDS_OVERSEAS_DATA = '/medical-records-overseas-data/medical-record-overseas-id';
  static const POST_MEDICAL_RECORDS_OVERSEAS_DATA = '/medical-records-overseas-data';
  static const PUT_MEDICAL_RECORDS_OVERSEAS_DATA = '/medical-records-overseas-data';
  static const DELETE_MEDICAL_RECORDS_OVERSEAS_DATA = '/medical-records-overseas-data';
}
