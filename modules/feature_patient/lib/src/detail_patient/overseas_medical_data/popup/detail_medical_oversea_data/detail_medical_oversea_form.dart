// Package imports:
import 'package:core_network/core_network.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup detailMedicalOverseaForm({
  List<CommentDicomFile> data = const [],
}) {
  if (data.isNotEmpty) {
    return FormGroup({
      'comments': FormArray(
        data
            .map(
              (e) => FormGroup({
                'comment': FormControl<String>(value: e.comment),
                'role': FormControl<String>(value: e.role),
              }),
            )
            .toList(),
      ),
    });
  } else {
    return FormGroup({
      'comments': FormArray(
        [
          FormGroup({
            'comment': FormControl<String>(),
            'role': FormControl<String>(value: 'Admin'),
          }),
        ],
      ),
    });
  }
}
