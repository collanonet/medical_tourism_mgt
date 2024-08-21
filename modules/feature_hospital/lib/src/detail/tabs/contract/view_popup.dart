import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

class ViewPopup extends StatelessWidget {
  const ViewPopup({
    super.key,
    required this.datas,
  });

  final List<ContractResponse> datas;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        const Row(
          children: [
            Expanded(flex: 2, child: Text('書類名')),
            Expanded(child: Text('締結日')),
            Expanded(flex: 2, child: SizedBox())
          ],
        ),
        const Divider(
          height: 2,
          thickness: 2,
          color: Color(0xff98A6B5),
        ),
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ListView.separated(
            itemCount: datas.length,
            itemBuilder: (context, index) {
              final data = datas[index];
              return Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(data.fileName ?? '',
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: context.appTheme.primaryColor)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                        data.uploadDate != null
                            ? Dates.formatFullDate(data.uploadDate!)
                            : '',
                        style: context.textTheme.titleMedium),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: isImage(data.uploadFile)
                        ? Avatar.network(
                            data.uploadFile,
                            placeholder: const AssetImage(
                              Images.logoMadical,
                              package: 'core_ui',
                            ),
                            shape: BoxShape.rectangle,
                            customSize: const Size(60, 60),
                          )
                        : data.uploadFile != null
                            ? SizedBox(
                                child: Text(
                                    data.uploadFile.toString().split('.').last),
                              )
                            : SizedBox(),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.grey,
              );
            },
          ),
        )
      ],
    );
  }
}
