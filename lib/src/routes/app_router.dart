import 'package:auto_route/auto_route.dart';
import 'package:feature_agent/feature_agent.module.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:feature_help_and_doc/feature_help_and_doc.module.dart';
import 'package:feature_hospital/feature_hospital.module.dart';
import 'package:feature_invoice/feature_invoice.module.dart';
import 'package:feature_medical_visa/feature_medical_visa.module.dart';
import 'package:feature_patient/feature_patient.module.dart';
import 'package:feature_pre_patient/feature_pre_patient.module.dart';
import 'package:feature_quotation/feature_quotation.module.dart';
import 'package:feature_report/feature_report.module.dart';
import 'package:feature_sale/feature_sale.module.dart';
import 'package:get_it/get_it.dart';

import '../app/app_model.dart';
import 'guards.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: [
    FeatureAuthRouterModule,
    FeatureAgentPackageModule,
    FeatureHelpAndDocPackageModule,
    FeatureHospitalPackageModule,
    FeatureInvoicePackageModule,
    FeatureMedicalVisaPackageModule,
    FeaturePatientPackageModule,
    FeaturePrePatientPackageModule,
    FeatureQuotationPackageModule,
    FeatureReportPackageModule,
    FeatureSalePackageModule,
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
      AutoRoute(page: LoginRoute.page, initial: true, path: '/'),
      RedirectRoute(path: '*', redirectTo: '/')
    ];
  }
}
