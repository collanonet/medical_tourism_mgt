import 'dart:ui';
import 'package:core_network/entities.dart';
import 'package:feature_agent/feature_agent.gm.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_chats/feature_chats.gm.dart';
import 'package:feature_hospital/feature_hospital.gm.dart';
import 'package:feature_invoice/feature_invoice.gm.dart';
import 'package:feature_medical_visa/feature_medical_visa.gm.dart';
import 'package:feature_patient/feature_patient.gm.dart';
import 'package:feature_process_chart/feature_process_chart.gm.dart';
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
        AgentsRoute.name: [PermissionRole.admin],
        AgentDetailRoute.name: [PermissionRole.admin],
        ChatRoute.name: [PermissionRole.admin],
        HospitalsRoute.name: [PermissionRole.admin],
        HospitalDetailRoute.name: [PermissionRole.admin],
        InvoicesRoute.name: [PermissionRole.admin],
        MedicalVisasRoute.name: [PermissionRole.admin],
        PrePatientRoute.name: [PermissionRole.admin],
        DetailPatientRoute.name: [PermissionRole.admin],
        PatientsRoute.name: [PermissionRole.admin],
        QuotationsRoute.name: [PermissionRole.admin],
        ReportsRoute.name: [PermissionRole.admin],
        ReportTypeRoute.name: [PermissionRole.admin],
        SalesRoute.name: [PermissionRole.admin],
        ProcessChartsRoute.name: [PermissionRole.admin],
        ItinerarySimplifiedRoute.name: [PermissionRole.admin],
        DetailProcessChartRoute.name: [PermissionRole.admin],
        WebAppointmentsRoute.name: [PermissionRole.admin],
        MedicalVisaDetailRoute.name: [PermissionRole.admin],
        WebAppointmentDetailRoute.name: [PermissionRole.admin],
        MasterRoute.name: [PermissionRole.admin],
        ContractRoute.name: [PermissionRole.admin],
        EstimateMasterRoute.name: [PermissionRole.admin],
        ProspectivePankRoute.name: [PermissionRole.admin],
        ContractDetailRoute.name: [PermissionRole.admin],
      },
    );
  }

  @Named('defaultLocale')
  Locale get defaultLocale => const Locale('en');
}
