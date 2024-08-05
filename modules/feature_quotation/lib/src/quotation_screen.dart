import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'filter_quotation.dart';
import 'quotion_detail.dart';

class QuotationScreen extends StatelessWidget {
  const QuotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        QuotationFilter(),
        
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                QuotionDetail(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
