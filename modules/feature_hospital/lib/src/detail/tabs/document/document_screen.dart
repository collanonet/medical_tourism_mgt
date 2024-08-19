import 'document_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'document_model.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key, required this.id});
  final String id;
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
      child: Provider(
        create: (context) =>
            GetIt.I<DocumentModel>()..fetchDocument(id: widget.id),
        child: DocumentSection(id: widget.id,),
      ),
    );
  }
}
