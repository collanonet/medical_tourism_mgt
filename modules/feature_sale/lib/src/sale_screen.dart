import 'package:flutter/cupertino.dart';

class SaleScreen extends StatelessWidget {
  const SaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Sale Screen',
        style: TextStyle(
          fontFamily: 'NotoSansJP',
          package: 'core_ui',
        ),
      ),
    );
  }
}
