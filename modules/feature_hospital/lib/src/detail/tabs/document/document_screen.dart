import 'package:feature_hospital/src/detail/tabs/document/document_section.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'document_form.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'This field is required',
      },
      child: ReactiveFormBuilder(
          form: () => documentForm(),
          builder: (context, form, _) {
            return const DocumentSection();
          }),
    );
  }
}
