import 'package:auto_route/auto_route.dart';
import 'package:feature_agent/feature_agent.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_chats/feature_chats.dart';
import 'package:feature_hospital/feature_hospital.dart';
import 'package:feature_invoice/feature_invoice.dart';
import 'package:feature_medical_visa/feature_medical_visa.dart';
import 'package:feature_patient/feature_patient.dart';
import 'package:feature_process_chart/feature_process_chart.dart';
import 'package:feature_quotation/feature_quotation.dart';
import 'package:feature_report/feature_report.dart';
import 'package:feature_sale/feature_sale.dart';
import 'package:feature_web_appointment/feature_web_appointment.dart';
import 'package:get_it/get_it.dart';

import '../app/app_model.dart';
import 'guards.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: [
    FeatureAuthRouterModule,
    FeatureChatsRouterModule,
    FeatureAgentRouterModule,
    FeatureHospitalRouterModule,
    FeatureInvoiceRouterModule,
    FeatureMedicalVisaRouterModule,
    FeaturePatientRouterModule,
    FeatureQuotationRouterModule,
    FeatureReportRouterModule,
    FeatureSaleRouterModule,
    FeatureProcessChartRouterModule,
    FeatureWebAppointmentRouterModule,
  ],
)
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter({required this.roleGuard});

  final RoleGuard roleGuard;
  AuthModel? _auth;
  void Function()? _authListener;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await roleGuard.resolve(resolver.route.name)) {
      resolver.next(true);
    } else {
      resolver.redirect(const LoginRoute());

      listener() async {
        final resolved = await roleGuard.resolve(resolver.route.name);
        if (resolved) {
          router.popUntilRoot();
          resolver.next(true);

          unsubscribeAuthListener();
        }
      }

      _authListener = listener;
      _auth = GetIt.I<AppModel>().auth..addListener(listener);
    }
  }

  @override
  void dispose() {
    unsubscribeAuthListener();
    super.dispose();
  }

  void unsubscribeAuthListener() {
    if (_authListener != null) {
      _auth?.removeListener(_authListener!);
      _authListener = null;
    }
  }

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: LoginRoute.page, path: '/login'),
      AutoRoute(page: AgentsRoute.page, path: '/agents'),
      AutoRoute(page: HospitalsRoute.page, path: '/hospitals'),
      AutoRoute(page: InvoicesRoute.page, path: '/invoices'),
      AutoRoute(page: MedicalVisasRoute.page, path: '/medical-visa'),
      AutoRoute(
          page: MedicalVisaDetailRoute.page, path: '/medical-visa-detail'),
      AutoRoute(page: PatientsRoute.page, initial: true, path: '/patients'),
      AutoRoute(page: DetailPatientRoute.page, path: '/detail-patient/:id'),
      AutoRoute(page: PrePatientRoute.page, path: '/pre-patients'),
      AutoRoute(page: QuotationsRoute.page, path: '/quotations'),
      AutoRoute(page: ReportsRoute.page, path: '/reports'),
      AutoRoute(page: SalesRoute.page, path: '/sales'),
      AutoRoute(page: ProcessChartsRoute.page, path: '/precess-charts'),
      AutoRoute(page: WebAppointmentsRoute.page, path: '/web-appointments'),
      RedirectRoute(path: '*', redirectTo: '/patients')
    ];
  }
}
