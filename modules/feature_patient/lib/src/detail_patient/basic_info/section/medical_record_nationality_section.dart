import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MedicalRecordNationalitySection extends StatelessWidget {
  const MedicalRecordNationalitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('PATIENT_NATIONALITIES') as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '国籍と連絡先',
          style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveForm(
          formGroup: formGroup,
          child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            children: [
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'nationality',
                      decoration: InputDecoration(
                        label: Text(
                          '国籍', // Todo: l10n (国籍)
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'nativeLanguage',
                      decoration: InputDecoration(
                        label: Text(
                          '母国語', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'residentialArea',
                      decoration: InputDecoration(
                        label: Text(
                          '居住地域', // Todo: l10n (国籍)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ReactiveTextField(
                      formControlName: 'currentAddress',
                      decoration: InputDecoration(
                        label: Text(
                          '現住所', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'mobileNumber',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: '+',
                        label: Text(
                          '携帯番号',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'email',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          'Email',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                  ),
                ],
              ),
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  Expanded(
                    child: ReactiveTextField(
                      formControlName: 'chat_tool_link',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        label: Text(
                          'チャットツールリンク',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: context.appTheme.primaryColor,
                    ),
                    SizedBox(
                      width: context.appTheme.spacing.marginSmall,
                    ),
                    Text(
                      'チャットツールリンクを追加',
                      style: TextStyle(
        fontFamily: 'NotoSansJP',
        package: 'core_ui',color: context.appTheme.primaryColor),
                    )
                  ],
                ),
              ),
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    padding:
                        EdgeInsets.all(context.appTheme.spacing.marginMedium),
                    decoration: BoxDecoration(
                      border: Border.all(color: context.appTheme.primaryColor),
                      borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium),
                    ),
                    child: Image.asset(
                      Images.sampleQr,
                      package: 'core_ui',
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 250,
                    padding:
                        EdgeInsets.all(context.appTheme.spacing.marginMedium),
                    decoration: BoxDecoration(
                      border: Border.all(color: context.appTheme.primaryColor),
                      borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium),
                    ),
                    child: ColumnSeparated(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: context.appTheme.spacing.marginMedium,
                        );
                      },
                      children: [
                        Icon(Icons.copy_all_rounded),
                        Text('QRコードをここにドラッグ＆ドロップ'),
                        ElevatedButton(
                            onPressed: () {}, child: Text('またはファイルを選択する'))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
