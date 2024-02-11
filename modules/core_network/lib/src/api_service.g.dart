// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiService implements ApiService {
  _ApiService(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AuthData> login(
    String email,
    String password,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'email': email,
      'password': password,
    };
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<AuthData>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AuthData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthData> refreshToken(String refreshToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'refresh-token': refreshToken};
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<AuthData>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/refresh-token',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AuthData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthData> logOut() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<AuthData>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/logout',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = AuthData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Paginated<PrePatient>> prePatients({
    int? page,
    int? limit,
    String? agents,
    String? patient,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'agents': agents,
      r'patient': patient,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Paginated<PrePatient>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/pre-patients',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Paginated<PrePatient>.fromJson(
      _result.data!,
      (json) => PrePatient.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<PrePatient> postPrePatient(PrePatientRequest prePatient) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(prePatient.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PrePatient>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/pre-patients',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PrePatient.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PrePatient> putPrePatient(
    String id,
    PrePatientRequest prePatient,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(prePatient.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PrePatient>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/pre-patients/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PrePatient.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deletePrePatient(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/pre-patients/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<Paginated<Patient>> patients({
    int? page,
    int? limit,
    String? patientName,
    String? companyAgents,
    String? acceptingHospital,
    List<String?>? type,
    String? salesStaff,
    String? dateOfEntryfrom,
    String? dateOfEntryto,
    String? medicalDayfrom,
    String? medicalDayto,
    String? returnDatefrom,
    String? returnDateto,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'patient_name': patientName,
      r'companyAGENTS': companyAgents,
      r'acceptingHospital': acceptingHospital,
      r'type': type,
      r'salesStaff': salesStaff,
      r'dateOfEntryfrom': dateOfEntryfrom,
      r'dateOfEntryto': dateOfEntryto,
      r'medicalDayfrom': medicalDayfrom,
      r'medicalDayto': medicalDayto,
      r'returnDatefrom': returnDatefrom,
      r'returnDateto': returnDateto,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<Paginated<Patient>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patients',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Paginated<Patient>.fromJson(
      _result.data!,
      (json) => Patient.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Patient> patient(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Patient>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patients/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Patient.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Patient> postPatient(PatientRequest patient) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(patient.toJson());
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Patient>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patients',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Patient.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Patient> putPatient(
    String id,
    PatientRequest patient,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(patient.toJson());
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Patient>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patients/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Patient.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deletePatient(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/patients/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<PatientName>> patientNames(String patientId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<PatientName>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-names/${patientId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) => PatientName.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<PatientName>> patientNamesByPatient(String patientId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<PatientName>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-names/patient-id/${patientId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) => PatientName.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<User> patientUser(String userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patients/user-id/${userId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PatientName> postPatientName(PatientNameRequest patientName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(patientName.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PatientName>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-names',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PatientName.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PatientName> putPatientName(
    String id,
    PatientNameRequest patientName,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(patientName.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PatientName>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-names/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PatientName.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deletePatientName(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/patient-names/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<PatientNationality>> patientNationalities(
      String patientId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<PatientNationality>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-nationalities/${patientId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            PatientNationality.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<PatientNationality>> patientNationalitiesByPatient(
      String patientId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<PatientNationality>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-nationalities/patient-id/${patientId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            PatientNationality.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<PatientNationality> postPatientNationality(
      PatientNationalityRequest patientNationality) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(patientNationality.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PatientNationality>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-nationalities',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PatientNationality.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PatientNationality> putPatientNationality(
    String id,
    PatientNationalityRequest patientNationality,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(patientNationality.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PatientNationality>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-nationalities/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PatientNationality.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deletePatientNationality(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/patient-nationalities/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<PatientPassport>> patientPassports(String patientId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<PatientPassport>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-passports/${patientId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) => PatientPassport.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<PatientPassport>> patientPassportsByPatient(
      String patientId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<PatientPassport>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-passports/patient-id/${patientId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) => PatientPassport.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<PatientPassport> postPatientPassport(
      PatientPassportRequest patientPassport) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(patientPassport.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PatientPassport>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-passports',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PatientPassport.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PatientPassport> putPatientPassport(
    String id,
    PatientPassportRequest patientPassport,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(patientPassport.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PatientPassport>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/patient-passports/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = PatientPassport.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deletePatientPassport(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/patient-passports/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<MedicalRecord>> medicalRecords({
    int? page,
    int? limit,
    String? patient,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'patient': patient,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<MedicalRecord>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) => MedicalRecord.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecord>> medicalRecordsByPatient(String patientId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<MedicalRecord>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records/patient-id/${patientId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) => MedicalRecord.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecord> postMedicalRecord(
      MedicalRecordRequest medicalRecord) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecord.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MedicalRecord>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecord.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecord> putMedicalRecord(
    String id,
    MedicalRecordRequest medicalRecord,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecord.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MedicalRecord>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecord.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecord(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/medical-records/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<MedicalRecordAgent>> medicalRecordAgents(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<MedicalRecordAgent>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-agents/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordAgent.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordAgent>> medicalRecordAgentsByMedicalRecord(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<MedicalRecordAgent>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-agents/medical-record-id/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordAgent.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecordAgent> postMedicalRecordAgent(
      MedicalRecordAgentRequest medicalRecordAgent) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordAgent.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MedicalRecordAgent>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-agents',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordAgent.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordAgent> putMedicalRecordAgent(
    String id,
    MedicalRecordAgentRequest medicalRecordAgent,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordAgent.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MedicalRecordAgent>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-agents/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordAgent.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecordAgent(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/medical-record-agents/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<MedicalRecordReferrer>> medicalRecordReferrers(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordReferrer>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-referrers/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordReferrer.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordReferrer>> medicalRecordReferrersByMedicalRecord(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordReferrer>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-referrers/medical-record-id/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordReferrer.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecordReferrer> postMedicalRecordReferrer(
      MedicalRecordReferrerRequest medicalRecordAgent) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordAgent.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordReferrer>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-referrers',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordReferrer.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordReferrer> putMedicalRecordReferrer(
    String id,
    MedicalRecordReferrerRequest medicalRecordAgent,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordAgent.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordReferrer>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-referrers/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordReferrer.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecordReferrer(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/medical-record-referrers/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<MedicalRecordBudget>> medicalRecordBudgets(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<MedicalRecordBudget>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-budgets/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordBudget.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordBudget>> medicalRecordBudgetsByMedicalRecord(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<MedicalRecordBudget>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-budgets/medical-record-id/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordBudget.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecordBudget> postMedicalRecordBudget(
      MedicalRecordBudgetRequest medicalRecordBudget) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordBudget.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordBudget>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-budgets',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordBudget.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordBudget> putMedicalRecordBudget(
    String id,
    MedicalRecordBudgetRequest medicalRecordBudget,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordBudget.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordBudget>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-budgets/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordBudget.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecordBudget(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/medical-record-budgets/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<MedicalRecordCompanion>> medicalRecordCompanions(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordCompanion>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-companions/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordCompanion.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordCompanion>> medicalRecordCompanionsByMedicalRecord(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordCompanion>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-companions/medical-record-id/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordCompanion.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecordCompanion> postMedicalRecordCompanion(
      MedicalRecordCompanionRequest medicalRecordCompanion) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordCompanion.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordCompanion>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-companions',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordCompanion.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordCompanion> putMedicalRecordCompanion(
    String id,
    MedicalRecordCompanionRequest medicalRecordCompanion,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordCompanion.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordCompanion>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-companions/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordCompanion.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecordCompanion(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/medical-record-companions/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<MedicalRecordHospital>> medicalRecordHospitals(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordHospital>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-hospitals/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordHospital.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordHospital>> medicalRecordHospitalsByMedicalRecord(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordHospital>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-hospitals/medical-record-id/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordHospital.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecordHospital> postMedicalRecordHospital(
      MedicalRecordHospitalRequest medicalRecordHospital) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordHospital.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordHospital>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-hospitals',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordHospital.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordHospital> putMedicalRecordHospital(
    String id,
    MedicalRecordHospitalRequest medicalRecordHospital,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordHospital.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordHospital>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-hospitals/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordHospital.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecordHospital(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/medical-record-hospitals/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<MedicalRecordInterpreter>> medicalRecordInterpreters(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordInterpreter>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-interpreters/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordInterpreter.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordInterpreter>>
      medicalRecordInterpretersByMedicalRecord(String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordInterpreter>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-interpreters/medical-record-id/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordInterpreter.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecordInterpreter> postMedicalRecordInterpreter(
      MedicalRecordInterpreterRequest medicalRecordInterpreter) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordInterpreter.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordInterpreter>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-interpreters',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordInterpreter.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordInterpreter> putMedicalRecordInterpreter(
    String id,
    MedicalRecordInterpreterRequest medicalRecordInterpreter,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordInterpreter.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordInterpreter>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-interpreters/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordInterpreter.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecordInterpreter(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/medical-record-interpreters/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<MedicalRecordProgress>> medicalRecordsProgress(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordProgress>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-progress/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordProgress.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordProgress>> medicalRecordsProgressByMedicalRecord(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordProgress>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-progress/medical-record-id/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordProgress.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecordProgress> postMedicalRecordProgress(
      MedicalRecordProgressRequest medicalRecordProgress) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordProgress.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordProgress>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-progress',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordProgress.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordProgress> putMedicalRecordProgress(
    String id,
    MedicalRecordProgressRequest medicalRecordProgress,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordProgress.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordProgress>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-progress/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordProgress.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecordProgress(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/medical-records-progress/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<MedicalRecordOversea>> medicalRecordsOverseas(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordOversea>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-overseas/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordOversea.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordOversea>> medicalRecordsOverseasByMedicalRecord(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordOversea>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-overseas/medical-record-id/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordOversea.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecordOversea> postMedicalRecordOversea(
      MedicalRecordOverseaRequest medicalRecordOversea) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordOversea.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordOversea>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-overseas',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordOversea.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordOversea> putMedicalRecordOversea(
    String id,
    MedicalRecordOverseaRequest medicalRecordOversea,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordOversea.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordOversea>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-overseas/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordOversea.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecordOversea(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/medical-records-overseas/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<List<MedicalRecordOverseaData>> medicalRecordsOverseaData(
      String medicalRecordOverseaId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordOverseaData>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-overseas-data/${medicalRecordOverseaId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordOverseaData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordOverseaData>>
      medicalRecordsOverseaDataByRecordsOversea(
          String medicalRecordOverseaId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordOverseaData>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-overseas-data/medical-record-overseas-id/${medicalRecordOverseaId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordOverseaData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecordOverseaData> postMedicalRecordOverseaData(
      MedicalRecordOverseaDataRequest medicalRecordOverseaData) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordOverseaData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordOverseaData>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-overseas-data',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordOverseaData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordOverseaData> putMedicalRecordOverseaData(
    String id,
    MedicalRecordOverseaDataRequest medicalRecordOverseaData,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordOverseaData.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordOverseaData>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-records-overseas-data/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordOverseaData.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecordOverseaData(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/medical-records-overseas-data/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<MedicalRecordTravelGroup> medicalRecordsTravelGroup(
      {String? medicalRecord}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordTravelGroup>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-travel-group/${medicalRecord}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordTravelGroup.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordTravelGroup> postMedicalRecordTravelGroup(
      MedicalRecordTravelGroupRequest medicalRecordTravelGroupRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordTravelGroupRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordTravelGroup>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-travel-group',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordTravelGroup.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<MedicalRecordProposal>> getAllMedicalRecordProposals() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordProposal>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/hospital-proposal',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordProposal.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordProposal>> getMedicalRecordProposalsByMedicalRecord(
      String medicalRecordId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordProposal>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/hospital-proposal/medical-record-id/${medicalRecordId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordProposal.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MedicalRecordProposal>> getOneMedicalRecordProposal(
      String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<MedicalRecordProposal>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/hospital-proposal/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    var value = _result.data!
        .map((dynamic i) =>
            MedicalRecordProposal.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<MedicalRecordProposal> postMedicalRecordProposal(
      MedicalRecordProposalRequest medicalRecordProposalRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordProposalRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordProposal>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/hospital-proposal',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordProposal.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordProposal> putMedicalRecordProposal(
    String id,
    MedicalRecordProposalRequest medicalRecordProposalRequest,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordProposalRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordProposal>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/hospital-proposal/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordProposal.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> deleteMedicalRecordProposal(String id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/hospital-proposal/${id}',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<MedicalRecordPatientResponseTreatment>
      getMedicalRecordPatientResponseTreatment({String? medicalRecord}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordPatientResponseTreatment>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-patient-response-treatment/${medicalRecord}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordPatientResponseTreatment.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordPatientResponseTreatment>
      postMedicalRecordPatientResponseTreatment(
          MedicalRecordPatientResponseTreatmentRequest
              medicalRecordPatientResponseTreatmentRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordPatientResponseTreatmentRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordPatientResponseTreatment>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-patient-response-treatment',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordPatientResponseTreatment.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordPatientResponseMedicalCheckup>
      getMedicalRecordPatientResponseMedicalCheckup(
          {String? medicalRecord}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordPatientResponseMedicalCheckup>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-patient-response-medical-checkup/${medicalRecord}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value =
        MedicalRecordPatientResponseMedicalCheckup.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordPatientResponseMedicalCheckup>
      postMedicalRecordPatientResponseMedicalCheckup(
          MedicalRecordPatientResponseMedicalCheckupRequest
              medicalRecordPatientResponseMedicalCheckupRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordPatientResponseMedicalCheckupRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordPatientResponseMedicalCheckup>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-patient-response-medical-checkup',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value =
        MedicalRecordPatientResponseMedicalCheckup.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordPatientResponseOther>
      getMedicalRecordPatientResponseOther({String? medicalRecord}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordPatientResponseOther>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-patient-response-other/${medicalRecord}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordPatientResponseOther.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordPatientResponseOther>
      postMedicalRecordPatientResponseOther(
          MedicalRecordPatientResponseOtherRequest
              medicalRecordPatientResponseOtherRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordPatientResponseOtherRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordPatientResponseOther>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-patient-response-other',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordPatientResponseOther.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordSummary> getMedicalRecordSummary(
      {String? medicalRecord}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordSummary>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-summary/${medicalRecord}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordSummary.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicalRecordSummary> postMedicalRecordSummary(
      MedicalRecordSummaryRequest medicalRecordNormalSummaryRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(medicalRecordNormalSummaryRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicalRecordSummary>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/medical-record-summary',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = MedicalRecordSummary.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
