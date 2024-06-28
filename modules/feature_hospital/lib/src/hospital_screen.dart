import 'package:auto_route/auto_route.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        HospitalFilter(),
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
                                child: Text('Rあり'), // With R
                              ),
                              Expanded(
                                child: Text('備考'), // remarks
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: value.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  context.router.push(HospitalDetailRoute(
                                    id: value.requireData[index].id,
                                  ));
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
                                                        : value
                                                                    .requireData[
                                                                        index]
                                                                    .treatment ==
                                                                true
                                                            ? '治療'
                                                            : value
                                                                        .requireData[
                                                                            index]
                                                                        .heavyIonBeam ==
                                                                    true
                                                                ? '重粒子線'
                                                                : value.requireData[index].protonBeam ==
                                                                        true
                                                                    ? '陽子線'
                                                                    : value.requireData[index].regenerativeMedicine ==
                                                                            true
                                                                        ? '再生医療'
                                                                        : value.requireData[index].beauty ==
                                                                                true
                                                                            ? '美容'
                                                                            : null
                                                  ].map((e) {
                                                    return e == null
                                                        ? const SizedBox()
                                                        : Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4),
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(4),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .blueGrey,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                            child: Text(
                                                              e,
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          );
                                                  }).toList() ??
                                                  [],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                            '${value.requireData[index].hospitalNameChinese ?? ''}'),
                                      ),
                                      Expanded(
                                        child: Text(
                                            '${value.requireData[index].location ?? '--'}'),
                                      ),
                                      Expanded(
                                        child: Text('--'), // ○
                                      ),
                                      Expanded(
                                        child: Text(
                                            '${value.requireData[index].memo ?? ''}'),
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
            }),
      ],
    );
  }
}
