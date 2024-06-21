import 'package:auto_route/auto_route.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';

import '../feature_hospital.gm.dart';
import 'filter_hospital.dart';

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
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text('種別'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('病院名'),
                      ),
                      Expanded(
                        child: Text('エリア'),
                      ),
                      Expanded(
                        child: Text('Rあり'),
                      ),
                      Expanded(
                        child: Text('備考'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.router.push(HospitalDetailRoute());
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
                                child: Row(
                                  children: [
                                    Text('種別'),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text('大阪府済生会吹田病院'),
                              ),
                              Expanded(
                                child: Text('大阪'),
                              ),
                              Expanded(
                                child: Text('◎'), // ○
                              ),
                              Expanded(
                                child: Text('サインポストの遺伝子検査のベトナム展開は独占に近い'),
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
      ],
    );
  }
}
