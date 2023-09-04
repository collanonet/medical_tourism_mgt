import 'package:flutter/material.dart';

class LabelValue extends StatelessWidget {
  const LabelValue({
    super.key,
    required this.label,
    required this.value,
    this.valueColor = Colors.black,
  });

  final String label;
  final String value;
  final Color valueColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 13.0,
                ),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          flex: 6,
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 13.0,
                  color: valueColor,
                ),
          ),
        ),
      ],
    );
  }
}
