import 'package:core_l10n/l10n.dart';
import 'package:core_network/core_network.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'facility_file.dart';
import 'facility_photo_form.dart';
import 'facility_photo_model.dart';

class FacilityPhotoSection extends StatefulWidget {
  const FacilityPhotoSection({super.key, required this.id});
  final String id;

  @override
  State<FacilityPhotoSection> createState() => _FacilityPhotoSectionState();
}

class _FacilityPhotoSectionState extends State<FacilityPhotoSection> {
  @override
  Widget build(BuildContext context) {
    return ColumnSeparated(
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: context.appTheme.spacing.formSpacing),
      children: [
        //Drag and drop file
        InkWell(
          onTap: () {
            filePicker().then((value) {
              if (value != null) {
                showCreateWithFileDialog(context, value);
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(
              context.appTheme.spacing.marginExtraLarge,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              )),
              border: Border.all(
                color: context.appTheme.primaryColor,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.copy_all_rounded,
                  size: 50,
                  color: context.appTheme.primaryColor,
                ),
                SizedBox(
                  width: context.appTheme.spacing.marginMedium,
                ),
                Column(
                  children: [
                    Text(
                      '診療データをここにドラッグ＆ドロップ',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: context.appTheme.spacing.marginMedium,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        filePicker().then((value) {
                          if (value != null) {
                            showCreateWithFileDialog(context, value);
                          }
                        });
                      },
                      child: const Text(
                        'またはファイルを選択する',
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const Row(
          children: [
            Expanded(flex: 2, child: Text('書類名')),
            Expanded(child: Text('発行元')),
            Expanded(child: Text('発行日')),
            Expanded(child: Text('支払期限')),
            Expanded(child: SizedBox()),
          ],
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ValueListenableBuilder(
            valueListenable: context.read<FacilityModel>().facilityData,
            builder: (context, value, _) {
              return Expanded(
                child: ListView.separated(
                  itemCount: value.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                                value.requireData[index].nameOfHospital ?? ''),
                          ),
                          Expanded(
                            child:
                                Text(value.requireData[index].photograph ?? ''),
                          ),
                          Expanded(
                            child: Text(
                                value.requireData[index].shootingDate == null
                                    ? ''
                                    : Dates.formShortDate(
                                        value.requireData[index].shootingDate)),
                          ),
                          Expanded(
                            child: value.requireData[index].share == null
                                ? SizedBox()
                                : Icon(Icons.person),
                          ),
                          Expanded(
                            child: Avatar.network(
                              value.requireData[index].facilityFile ??
                                  value.requireData[index].uploadedPhoto,
                              placeholder: AssetImage(
                                Images.logoMadical,
                                package: 'core_ui',
                              ),
                              shape: BoxShape.rectangle,
                              customSize: const Size(60, 60),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.grey,
                    );
                  },
                ),
              );
            }),
      ],
    );
  }

  void showCreateWithFileDialog(BuildContext context, FileSelect file) {
    showDialog(
      context: context,
      builder: (_) => Provider.value(
        value: context.read<FacilityModel>(),
        child: AlertDialog(
          content: ReactiveFormConfig(
            validationMessages: <String, ValidationMessageFunction>{
              ValidationMessage.required: (error) =>
                  context.l10n.mgsFieldRequired,
            },
            child: ReactiveFormBuilder(
              form: () =>
                  facilityPhotoForm(hospitalRecordId: widget.id, file: file)
                    ..markAllAsTouched(),
              builder: (context, formGroup, child) {
                return const Popup();
              },
            ),
          ),
        ),
      ),
    );
  }
}
