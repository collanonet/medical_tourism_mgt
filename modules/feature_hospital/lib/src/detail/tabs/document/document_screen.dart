import 'package:feature_hospital/src/detail/tabs/document/document_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:core_utils/core_utils.dart';
import 'document_form.dart';
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
      validationMessages: validationMessages,
      child: Provider(
        create: (context) =>
            GetIt.I<DocumentModel>()..fetchDocument(id: widget.id),
        child: DocumentSection(id: widget.id,),
      ),
    );
  }
}
