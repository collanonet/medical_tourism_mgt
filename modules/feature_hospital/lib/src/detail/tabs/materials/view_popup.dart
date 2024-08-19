import 'package:core_network/core_network.dart';
import 'package:core_ui/resources.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

class ViewPopup extends StatelessWidget {
  const ViewPopup({
    super.key,
    required this.datas,
  });

  final List<MaterialHospitalResponse> datas;

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
            Expanded(flex: 2, child: Text('パンフレット名')),
            Expanded(child: Text('作成者')),
            Expanded(child: Text('発行日')),
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
                    flex: 2,
                    child: Text(data.brochureName ?? ''),
                  ),
                  Expanded(
                    child: Text(data.author ?? ''),
                  ),
                  Expanded(
                    child: Text(data.dateOfIssue == null
                        ? ''
                        : Dates.formShortDate(data.dateOfIssue)),
                  ),
                  Expanded(
                    flex: 2,
                    child: isImage(data.file)
                        ? Avatar.network(
                            data.file,
                            placeholder: const AssetImage(
                              Images.logoMadical,
                              package: 'core_ui',
                            ),
                            shape: BoxShape.rectangle,
                            customSize: const Size(60, 60),
                          )
                        : data.file != null
                            ? SizedBox(
                                child:
                                    Text(data.file.toString().split('.').last),
                              )
                            : const SizedBox(),
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
