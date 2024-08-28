// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../../../hospital_detail_model.dart';
import '../basic_information_model.dart';

class BasicInfoSection extends StatefulWidget {
  const BasicInfoSection({super.key});

  @override
  State<BasicInfoSection> createState() => _BasicInfoSectionState();
}

class _BasicInfoSectionState extends State<BasicInfoSection> {
  final formatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('basicInformation') as FormGroup;
    return ValueListenableListener(
      valueListenable:
          context.read<BasicInformationModel>().basicInformationData,
      onListen: () {
        var data =
            context.read<BasicInformationModel>().basicInformationData.value;

        if (data.hasData) {
          context.read<HospitalDetailModel>().update(data.requireData);
        }
      },
      child: ValueListenableBuilder(
          valueListenable:
              context.watch<BasicInformationModel>().basicInformationData,
          builder: (context, value, _) {
            return Skeletonizer(
              enabled: value.loading,
              child: ReactiveForm(
                formGroup: formGroup,
                child: ColumnSeparated(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (context, index) => SizedBox(
                    height: context.appTheme.spacing.formSpacing,
                  ),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium,
                        ),
                        color: const Color(0xffF8F8D9),
                      ),
                      padding:
                          EdgeInsets.all(context.appTheme.spacing.marginMedium),
                      child: ColumnSeparated(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          );
                        },
                        children: [
                          const Text(
                            '基本情報',
                            style: TextStyle(
                              fontFamily: 'NotoSansJP',
                              package: 'core_ui',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicWidth(
                                stepWidth: 300,
                                child: ReactiveTextField(
                                  formControlName: 'hospitalNameChinese',
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      '病院名（漢字）',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 300,
                                child: ReactiveTextField(
                                  formControlName: 'hospitalNameKatakana',
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      '病院名（カナ）',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicWidth(
                                stepWidth: 300,
                                child: ReactiveTextField(
                                  formControlName: 'zipCode',
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      '郵便番号',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 300,
                                child: ReactiveTextField(
                                  formControlName: 'location',
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      '所在地',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ReactiveTextField(
                                  formControlName: 'googleMap',
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      'GoogleMapリンク',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              ElevatedButton(
                                  onPressed: () async {},
                                  child: const Text('QR コードを生成'))
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicWidth(
                                stepWidth: 300,
                                child: ReactiveTextField(
                                  formControlName: 'phoneNumber',
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      '電話番号',
                                    ),
                                  ),
                                  inputFormatters: [
                                    CustomPhoneFormatter(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 300,
                                child: ReactiveTextField(
                                  formControlName: 'faxNumber',
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: Text(
                                      'FAX 番号',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntrinsicWidth(
                                stepWidth: 300,
                                child: ReactiveTextField(
                                  formControlName: 'homepage',
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    label: const Text(
                                      'ホームページ',
                                    ),
                                    suffixIcon: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 20),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: context
                                                .appTheme.primaryColor),
                                        child: Text(
                                          '開く',
                                          style: context.textTheme.labelLarge
                                              ?.copyWith(
                                                  color: const Color(
                                                      0xffFFFFFF)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '対応メニュー', //
                                  ),
                                  RowSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: <Widget>[
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'healthCheckup',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup
                                                .control('healthCheckup')
                                                .value = value.value == true;
                                          },
                                          title: Text('健診',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'treatment',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup
                                                .control('treatment')
                                                .value = value.value == true;
                                          },
                                          title: Text('治療',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'heavyIonBeam',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup
                                                .control('heavyIonBeam')
                                                .value = value.value == true;
                                          },
                                          title: Text('重粒子線',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'protonBeam',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup
                                                .control('protonBeam')
                                                .value = value.value == true;
                                          },
                                          title: Text('陽子線',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName:
                                              'regenerativeMedicine',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup
                                                .control('regenerativeMedicine')
                                                .value = value.value == true;
                                          },
                                          title: Text('再生医療',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'beauty',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup.control('beauty').value =
                                                value.value == true;
                                          },
                                          title: Text('美容',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '連絡方法', //
                                  ),
                                  RowSeparated(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium,
                                      );
                                    },
                                    children: <Widget>[
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'phone',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup.control('phone').value =
                                                value.value == true;
                                          },
                                          title: Text('電話',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'fax',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup.control('fax').value =
                                                value.value == true;
                                          },
                                          title: Text('FAX',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'mail',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup.control('mail').value =
                                                value.value == true;
                                          },
                                          title: Text('メール',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'line',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup.control('line').value =
                                                value.value == true;
                                          },
                                          title: Text('LINE',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        stepWidth: 300,
                                        child: ReactiveTextField(
                                          formControlName: 'note',
                                          decoration: const InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            label: Text(
                                              '備考',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            '日本語以外に提出可能なサマリーの言語', //
                                          ),
                                          RowSeparated(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return SizedBox(
                                                width: context.appTheme.spacing
                                                    .marginMedium,
                                              );
                                            },
                                            children: <Widget>[
                                              IntrinsicWidth(
                                                child: ReactiveCheckboxListTile(
                                                  checkboxShape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  formControlName: 'english',
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  onChanged: (value) {
                                                    formGroup
                                                            .control('english')
                                                            .value =
                                                        value.value == true;
                                                  },
                                                  title: Text('英語',
                                                      style: context.textTheme
                                                          .labelLarge),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: ReactiveCheckboxListTile(
                                                  checkboxShape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  formControlName: 'chinese',
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  onChanged: (value) {
                                                    formGroup
                                                            .control('chinese')
                                                            .value =
                                                        value.value == true;
                                                  },
                                                  title: Text('中国語',
                                                      style: context.textTheme
                                                          .labelLarge),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: ReactiveCheckboxListTile(
                                                  checkboxShape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  formControlName: 'vietnamese',
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  onChanged: (value) {
                                                    formGroup
                                                        .control('vietnamese')
                                                        .value = value
                                                            .value ==
                                                        true;
                                                  },
                                                  title: Text('ベトナム語',
                                                      style: context.textTheme
                                                          .labelLarge),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: ReactiveCheckboxListTile(
                                                  checkboxShape:
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  formControlName:
                                                      'otherLanguages',
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  onChanged: (value) {
                                                    formGroup
                                                        .control(
                                                            'otherLanguages')
                                                        .value = value
                                                            .value ==
                                                        true;
                                                  },
                                                  title: Text('その他の言語',
                                                      style: context.textTheme
                                                          .labelLarge),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                stepWidth: 120,
                                                child: ReactiveTextField(
                                                  formControlName: 'languages',
                                                  decoration:
                                                      const InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        width: context
                                            .appTheme.spacing.marginMedium),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Text(
                                            'オンライン診療', //
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'onlineCheck',
                                                value: '可',
                                                title: Text(
                                                  '可',
                                                  style: context
                                                      .textTheme.bodySmall,
                                                ),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'onlineCheck',
                                                value: '不可',
                                                title: Text(
                                                  '不可',
                                                  style: context
                                                      .textTheme.bodySmall,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 18),
                                          child: Text(
                                            '医師の指名', //
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'appointment',
                                                value: '可',
                                                onChanged: (value) {},
                                                title: Text(
                                                  '可',
                                                  style: context
                                                      .textTheme.bodySmall,
                                                ),
                                              ),
                                            ),
                                            IntrinsicWidth(
                                              child: ReactiveRadioListTile(
                                                formControlName: 'appointment',
                                                value: '不可',
                                                onChanged: (value) {},
                                                title: Text(
                                                  '不可',
                                                  style: context
                                                      .textTheme.bodySmall,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '画像データの提出方法', //
                                  ),
                                  Wrap(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    // separatorBuilder:
                                    //     (BuildContext context, int index) {
                                    //   return SizedBox(
                                    //     width: context
                                    //         .appTheme.spacing.marginMedium,
                                    //   );
                                    // },
                                    children: <Widget>[
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'cdr',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup.control('cdr').value =
                                                value.value == true;
                                          },
                                          title: Text('CD-R を郵送',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'storageUrl',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup
                                                .control('storageUrl')
                                                .value = value.value == true;
                                          },
                                          title: Text('ストレージの URL 共有',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'viewMyPage',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup
                                                .control('viewMyPage')
                                                .value = value.value == true;
                                          },
                                          title: Text('現地病院のマイページ閲覧',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'mailAttachment',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup
                                                .control('mailAttachment')
                                                .value = value.value == true;
                                          },
                                          title: Text('メール添付',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                      IntrinsicWidth(
                                        child: ReactiveCheckboxListTile(
                                          checkboxShape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          contentPadding: EdgeInsets.zero,
                                          formControlName: 'loanerTablet',
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          onChanged: (value) {
                                            formGroup
                                                .control('loanerTablet')
                                                .value = value.value == true;
                                          },
                                          title: Text('当社貸出タブレットで閲覧',
                                              style:
                                                  context.textTheme.labelLarge),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 0,
                            indent: context.appTheme.spacing.marginMedium,
                            endIndent: context.appTheme.spacing.marginMedium,
                          ),
                          SizedBox(
                              height: context.appTheme.spacing.marginMedium),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '所属学会', //
                              ),
                              RowSeparated(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width:
                                        context.appTheme.spacing.marginMedium,
                                  );
                                },
                                children: <Widget>[
                                  IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: EdgeInsets.zero,
                                      formControlName: 'jmip',
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (value) {
                                        formGroup.control('jmip').value =
                                            value.value == true;
                                      },
                                      title: Text('JMIP',
                                          style: context.textTheme.labelLarge),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: EdgeInsets.zero,
                                      formControlName: 'jci',
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (value) {
                                        formGroup.control('jci').value =
                                            value.value == true;
                                      },
                                      title: Text('JCI',
                                          style: context.textTheme.labelLarge),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: EdgeInsets.zero,
                                      formControlName: 'jih',
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (value) {
                                        formGroup.control('jih').value =
                                            value.value == true;
                                      },
                                      title: Text('JIH',
                                          style: context.textTheme.labelLarge),
                                    ),
                                  ),
                                ],
                              ),
                              Wrap(
                                children: <Widget>[
                                  IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: EdgeInsets.zero,
                                      formControlName: 'ningenDoctor',
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (value) {
                                        formGroup
                                            .control('ningenDoctor')
                                            .value = value.value == true;
                                      },
                                      title: Text('日本人間ドック学会',
                                          style: context.textTheme.labelLarge),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: EdgeInsets.zero,
                                      formControlName: 'japanHealth',
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (value) {
                                        formGroup.control('japanHealth').value =
                                            value.value == true;
                                      },
                                      title: Text('日本健診協会',
                                          style: context.textTheme.labelLarge),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: EdgeInsets.zero,
                                      formControlName:
                                          'societyRorRegenerativeMedicine',
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (value) {
                                        formGroup
                                            .control(
                                                'societyRorRegenerativeMedicine')
                                            .value = value.value == true;
                                      },
                                      title: Text('再生医療学会',
                                          style: context.textTheme.labelLarge),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: EdgeInsets.zero,
                                      formControlName: 'osakaPrefecturalBase',
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (value) {
                                        formGroup
                                            .control('osakaPrefecturalBase')
                                            .value = value.value == true;
                                      },
                                      title: Text('大阪府外国人患者受入れ拠点医療機関',
                                          style: context.textTheme.labelLarge),
                                    ),
                                  ),
                                  IntrinsicWidth(
                                    child: ReactiveCheckboxListTile(
                                      checkboxShape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      contentPadding: EdgeInsets.zero,
                                      formControlName: 'certified',
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      onChanged: (value) {
                                        formGroup.control('certified').value =
                                            value.value == true;
                                      },
                                      title: Text('日本総合健診医学会認定',
                                          style: context.textTheme.labelLarge),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.all(context.appTheme.spacing.marginMedium),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(
                          context.appTheme.spacing.borderRadiusMedium,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const IntrinsicWidth(
                                stepWidth: 150,
                                child: Text(
                                  '部門',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansJP',
                                    package: 'core_ui',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 150,
                                child: Text(
                                  '診療時間',
                                  style: TextStyle(
                                    fontFamily: 'NotoSansJP',
                                    package: 'core_ui',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 80,
                                child: boxText(
                                  context,
                                  '月',
                                  textColor: Colors.white,
                                  bg: context.appTheme.primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 80,
                                child: boxText(
                                  context,
                                  '火',
                                  textColor: Colors.white,
                                  bg: context.appTheme.primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 80,
                                child: boxText(
                                  context,
                                  '水',
                                  textColor: Colors.white,
                                  bg: context.appTheme.primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 80,
                                child: boxText(
                                  context,
                                  '木',
                                  textColor: Colors.white,
                                  bg: context.appTheme.primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 80,
                                child: boxText(
                                  context,
                                  '金',
                                  textColor: Colors.white,
                                  bg: context.appTheme.primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 80,
                                child: boxText(
                                  context,
                                  '土',
                                  textColor: Colors.white,
                                  bg: context.appTheme.primaryColor,
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 80,
                                child: boxText(
                                  context,
                                  '日',
                                  textColor: Colors.white,
                                  bg: context.appTheme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            children: [
                              IntrinsicWidth(
                                stepWidth: 150,
                                child: ReactiveTextField(
                                  formControlName: 'department1',
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 150,
                                child: ReactiveTextField(
                                  formControlName: 'shift1',
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift1Mon',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift1Tue',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift1Wed',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift1Thu',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift1Fri',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift1Sat',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift1Sun',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.appTheme.spacing.marginMedium,
                          ),
                          Row(
                            children: [
                              IntrinsicWidth(
                                stepWidth: 150,
                                child: ReactiveTextField(
                                  formControlName: 'department2',
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              IntrinsicWidth(
                                stepWidth: 150,
                                child: ReactiveTextField(
                                  formControlName: 'shift2',
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift2Mon',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift2Tue',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift2Wed',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift2Thu',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift2Fri',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift2Sat',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: context.appTheme.spacing.marginMedium,
                              ),
                              const IntrinsicWidth(
                                stepWidth: 80,
                                child: ReactiveDropdownFormField(
                                  formControlName: 'shift2Sun',
                                  items: [
                                    DropdownMenuItem(
                                      value: '×',
                                      child: Text('×'),
                                    ),
                                    DropdownMenuItem(
                                      value: '○',
                                      child: Text('○'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ReactiveTextField(
                      formControlName: 'memo',
                      maxLines: 6,
                      decoration: const InputDecoration(
                        label: Text('メモ'),
                        hintText: '来日の意向が確定してから問い合わせること。',
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

boxText(BuildContext context, String text,
        {Color? bg, Color? borderC, Color? textColor, Function()? onTap}) =>
    InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
        decoration: BoxDecoration(
          color: bg,
          border: Border.all(
            color: borderC ?? bg ?? Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
              context.appTheme.spacing.borderRadiusMedium),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor ?? Colors.black),
          ),
        ),
      ),
    );
