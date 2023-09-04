import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../src/widgets/khqr.dart';

@widgetbook.UseCase(name: 'With Dollar', type: KHQR)
Widget withDollarSign(BuildContext context) {
  return SafeArea(
    child: Center(
      child: Column(
        children: [
          SizedBox(
            width: 286.0,
            height: 430.0,
            child: KHQR(
              accountName: context.knobs.string(
                label: 'Account Name',
                initialValue: 'KB Mart AB Mart 1',
              ),
              amount: context.knobs.string(
                label: 'Amount',
                initialValue: '20.00',
              ),
              currency: KHQRCurrency.dollar,
              data: context.knobs.string(label: 'QR Data'),
            ),
          ),
        ],
      ),
    ),
  );
}
