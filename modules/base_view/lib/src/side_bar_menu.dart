// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_utils/routes.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:provider/provider.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({
    super.key,
    required this.selectedIndex,
    required this.appVersion,
  });

  final int selectedIndex;
  final String appVersion;

  @override
  Widget build(BuildContext context) {
    List<Menu> menus = [
      Menu(
        title: context.l10n.labelPatient,
        route: Routes.patientsRoute,
      ),
      Menu(
        title: context.l10n.labelChat,
        route: Routes.chatRoute,
      ),
      Menu(
        title: context.l10n.labelMedicalVisaManagement,
        route: Routes.medicalVisasRoute,
      ),
      Menu(
        title: context.l10n.labelWebAppointment,
        route: Routes.webAppointmentsRoute,
      ),
      Menu(
        title: context.l10n.labelProcessChart,
        route: Routes.processChartsRoute,
      ),
      Menu(
        title: context.l10n.labelHospitals,
        route: Routes.hospitalsRoute,
      ),
      Menu(
        title: context.l10n.labelAgents,
        route: Routes.agentsRoute,
      ),
      Menu(
        title: '${context.l10n.labelQuotations}/${context.l10n.labelInvoice}',
        route: Routes.invoicesRoute,
      ),
      Menu(
        title: context.l10n.labelSalesManagement,
        route: Routes.salesRoute,
      ),
      Menu(
        title: context.l10n.labelReport,
        route: Routes.masterRoute,
      ),
    ];

    return Stack(
      children: [
        Container(
          width: 200,
          margin: const EdgeInsets.fromLTRB(16, 16, 0, 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Container(
          width: 216,
          margin: const EdgeInsets.fromLTRB(16, 16, 0, 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Image.asset(
                            Images.logoMadical,
                            package: 'core_ui',
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: menus.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CustomPaint(
                            painter: selectedIndex == index
                                ? ArrowBackgroundPainter()
                                : null,
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 0,
                              ),
                              dense: true,
                              title: Text(
                                menus[index].title,
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontSize: 16,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : context.appTheme.primaryColor,
                                ),
                              ),
                              selected: selectedIndex == index,
                              onTap: () => context.router.replace(
                                PageRouteInfo(menus[index].route),
                              ),
                              hoverColor: Colors.transparent,
                              tileColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              enableFeedback: false,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                  ),
                  child: Text(
                    context.l10n.labelHelp,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 2, 16, 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'センター本部専用',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 2, 16, 16),
                child: Text(
                  'version: $appVersion',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontFamily: 'NotoSansJP',
                    package: 'core_ui',
                  ),
                ),
              ),
              Divider(
                endIndent: 20,
                indent: 4,
                thickness: 1,
                color: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 2, 16, 16),
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Are you sure you want to log out?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<AuthModel>().logOut();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  label: Text(
                    context.l10n.labelLogout,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Menu {
  String title;
  String route;

  Menu({
    required this.title,
    required this.route,
  });
}

class ArrowBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final shadowPaint = Paint()
      ..color = Colors.black12
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 8);

    final paint = Paint()
      ..color = const Color(0xFFB76D0F)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - 16, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width - 16, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
