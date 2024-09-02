// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../feature_hospital.gm.dart';
import 'filter_hospital.dart';
import 'hospital_model.dart';

class HospitalScreen extends StatelessWidget {
  const HospitalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColumnSeparated(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 16);
      },
      children: [
        const HospitalFilter(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                context.router.push(HospitalDetailRoute());
              },
              child: const Text('新規登録'),
            ),
          ],
        ),
        ValueListenableBuilder(
          valueListenable: context.watch<HospitalModel>().hospitals,
          builder: (context, value, _) {
            return Expanded(
              child: Skeletonizer(
                enabled: value.loading,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            SizedBox(width: 30),
                            Expanded(
                              flex: 2,
                              child: Text('種別'), // type
                            ),
                            Expanded(
                              flex: 2,
                              child: Text('病院名'), // The name of the hospital
                            ),
                            Expanded(
                              child: Text('エリア'), // area
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Expanded(
                              child: Text('Rあり'), // With R
                            ),
                            Expanded(
                              child: Text('備考'), // remarks
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                          itemCount: value.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context.router.push(
                                  HospitalDetailRoute(
                                    id: value.requireData[index].id,
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                color: index.isEven
                                    ? const Color(0xffEDF8F8)
                                    : Colors.white,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start, // start
                                        mainAxisAlignment:
                                            MainAxisAlignment.start, // center
                                        children: [
                                          Wrap(
                                            children: [
                                              value.requireData[index]
                                                          .healthCheckup ==
                                                      true
                                                  ? '健診'
                                                  : null,
                                              value.requireData[index]
                                                          .treatment ==
                                                      true
                                                  ? '治療'
                                                  : null,
                                              value.requireData[index]
                                                          .heavyIonBeam ==
                                                      true
                                                  ? '重粒子線'
                                                  : null,
                                              value.requireData[index]
                                                          .protonBeam ==
                                                      true
                                                  ? '陽子線'
                                                  : null,
                                              value.requireData[index]
                                                          .regenerativeMedicine ==
                                                      true
                                                  ? '再生医療'
                                                  : null,
                                              value.requireData[index].beauty ==
                                                      true
                                                  ? '美容'
                                                  : null,
                                            ].map((e) {
                                              return e == null
                                                  ? const SizedBox()
                                                  : Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      margin:
                                                          const EdgeInsets.all(
                                                              4),
                                                      decoration: BoxDecoration(
                                                        color: e == '健診'
                                                            ? const Color(
                                                                0xffE238A0)
                                                            : e == '治療'
                                                                ? const Color(
                                                                    0xff53A6FF)
                                                                : e == '重粒子線'
                                                                    ? const Color(
                                                                        0xffE238A0)
                                                                    : e == '陽子線'
                                                                        ? const Color(
                                                                            0xff98DE51)
                                                                        : e == '再生医療'
                                                                            ? const Color(0xffE238A0)
                                                                            : e == '美容'
                                                                                ? const Color(0xffF7654A)
                                                                                : Colors.blueGrey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                      ),
                                                      child: Text(
                                                        e,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(value.requireData[index]
                                              .hospitalNameChinese ??
                                          ''),
                                    ),
                                    Expanded(
                                      child: Text(
                                          value.requireData[index].location ??
                                              '--'),
                                    ),
                                    const Expanded(
                                      child: SizedBox(),
                                    ),
                                    const Expanded(child: Text('--')),
                                    Expanded(
                                      child: Text(
                                          value.requireData[index].memo ?? ''),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
