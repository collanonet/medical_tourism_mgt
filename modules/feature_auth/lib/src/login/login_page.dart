import 'package:auto_route/annotations.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBody(
        child: Column(
          children: [
            Text('test'),
          ],
        ),
      ),
    );
  }
}
