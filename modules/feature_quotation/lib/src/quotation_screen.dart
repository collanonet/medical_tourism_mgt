import 'package:flutter/cupertino.dart';

import 'filter_quotation.dart';

class QuotationScreen extends StatelessWidget {
  const QuotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuotationFilter(),
        const Center(
          child: Text('Quotation Screen',
            style: TextStyle(
              fontFamily: 'NotoSansJP',
              package: 'core_ui',
            ),),
        ),
      ],
    );
  }
}
