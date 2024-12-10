import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'contract_template_detail_form_data.dart';
import 'contract_template_detail_model.dart';
import 'document_content.dart';

class ContractList extends StatelessWidget {
  const ContractList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16),
        child: ColumnSeparated(
          separatorBuilder: (context, index) =>
              SizedBox(height: context.appTheme.spacing.marginMedium),
          children: [
            const Row(
              children: [
                SizedBox(width: 30),
                Expanded(
                  flex: 2,
                  child: Text('バージョン'),
                ),
                Expanded(
                  flex: 2,
                  child: Text('更新日'),
                ),
                //SizedBox(width: 90),
                Expanded(
                  flex: 3,
                  child: Text('件名'),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  child: Text('運用'),
                ),
              ],
            ),
            const Divider(color: Colors.grey, height: 1),
            Expanded(
              child: SingleChildScrollView(
                child: ColumnSeparated(
                  separatorBuilder: (context, index) =>
                      SizedBox(height: context.appTheme.spacing.marginMedium),
                  children: [
                    ValueListenableBuilder(
                      valueListenable: context
                          .watch<ContractTemplateModel>()
                          .contractTemplatebasicInfoData,
                      builder: (context, value, child) {
                        return Skeletonizer(
                          enabled: value.loading,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: ColumnSeparated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: context.appTheme.spacing.marginMedium,
                              ),
                              children: [
                                ColumnSeparated(
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return const SizedBox(height: 16);
                                    },
                                    children: [
                                      ListView.separated(
                                        shrinkWrap: true,
                                        itemCount: value.data?.length ?? 0,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          var respone = value.data?[index];
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: index.isEven
                                                  ? context
                                                      .appTheme.primaryColor
                                                      .withOpacity(0.1)
                                                  : Colors.white,
                                            ),
                                            padding: const EdgeInsets.all(10),
                                            child: RowSeparated(
                                              separatorBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return const SizedBox(
                                                    width: 16);
                                              },
                                              children: [
                                                // const SizedBox(width: 50),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    respone?.version ??
                                                        '--//--',
                                                    style: context
                                                        .textTheme.bodySmall,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    respone?.updateDate != null
                                                        ? Dates.formatFullDate(
                                                            respone!
                                                                .updateDate!)
                                                        : '',
                                                    style: context
                                                        .textTheme.bodyMedium,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    respone?.documentName ?? '',
                                                    style: context
                                                        .textTheme.bodyMedium,
                                                  ),
                                                ),
                                                const Expanded(
                                                  flex: 2,
                                                  child: SizedBox(),
                                                ),
                                                SizedBox(
                                                  child: respone?.user == true
                                                      ? Container(
                                                          width: 80,
                                                          height: 30,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      10),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  6, 235, 216),
                                                            ),
                                                          ),
                                                          child: const Center(
                                                            child: Text('運用中'),
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return const Divider(
                                            thickness: 0.5,
                                          );
                                        },
                                      )
                                    ]),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const ContractForm(),
                    const DocumentContent(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
