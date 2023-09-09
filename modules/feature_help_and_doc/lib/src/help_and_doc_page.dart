import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';

import 'help_and_doc_screen.dart';

@RoutePage()
class HelpAndDocPage extends StatelessWidget {
  const HelpAndDocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SideBarMenu(page: HelpAndDocScreen());
  }
}
