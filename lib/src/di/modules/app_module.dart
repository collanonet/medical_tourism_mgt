import 'dart:ui';

import 'package:feature_agent/feature_agent.gm.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_hospital/feature_hospital.gm.dart';
import 'package:feature_invoice/feature_invoice.gm.dart';
import 'package:feature_medical_visa/feature_medical_visa.gm.dart';
import 'package:feature_patient/feature_patient.gm.dart';
import 'package:feature_process_chart/feature_process_chart.dart';
import 'package:feature_quotation/feature_quotation.gm.dart';
import 'package:feature_report/feature_report.gm.dart';
import 'package:feature_sale/feature_sale.gm.dart';
import 'package:feature_web_appointment/feature_web_appointment.gm.dart';
import 'package:injectable/injectable.dart';

import '../../routes/app_router.dart';
import '../../routes/guards.dart';

@module
abstract class AppModule {
  @singleton
  AppRouter appRouter(RoleGuard roleGuard) {
    return AppRouter(roleGuard: roleGuard);
  }

  @singleton
  RoleGuard get roleGuard {
    return RoleGuard(
      policies: {
        LoginRoute.name: [PermissionRole.guest],
        // AgentsRoute.name: [PermissionRole.user],
        AgentsRoute.name: [PermissionRole.guest],
        // HospitalsRoute.name: [PermissionRole.user],
        HospitalsRoute.name: [PermissionRole.guest],
        // InvoicesRoute.name: [PermissionRole.user],
        InvoicesRoute.name: [PermissionRole.guest],
        // MedicalVisasRoute.name: [PermissionRole.user],
        MedicalVisasRoute.name: [PermissionRole.guest],
        // PrePatientRoute.name: [PermissionRole.user],
        PrePatientRoute.name: [PermissionRole.guest],
        PatientsRoute.name: [PermissionRole.guest],
        DetailPatientRoute.name: [PermissionRole.guest],
        // DetailPatientRoute.name: [PermissionRole.user],
        // PatientsRoute.name: [PermissionRole.user],
        // QuotationsRoute.name: [PermissionRole.user],
        QuotationsRoute.name: [PermissionRole.guest],
        // ReportsRoute.name: [PermissionRole.user],
        ReportsRoute.name: [PermissionRole.guest],
        // SalesRoute.name: [PermissionRole.user],
        SalesRoute.name: [PermissionRole.guest],
        // ProcessChartsRoute.name: [PermissionRole.user],
        ProcessChartsRoute.name: [PermissionRole.guest],
        // WebAppointmentsRoute.name: [PermissionRole.user],
        WebAppointmentsRoute.name: [PermissionRole.guest],
      },
    );
  }

  @Named('defaultLocale')
  Locale get defaultLocale => const Locale('en');
}
