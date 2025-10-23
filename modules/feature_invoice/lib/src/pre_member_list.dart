// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';

class PreMemberList extends StatefulWidget {
  const PreMemberList({super.key});

  @override
  State<PreMemberList> createState() => _PreMemberListState();
}

class _PreMemberListState extends State<PreMemberList> {
  String _selectedFilter = 'すべて';

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              Text(
                'プレ会員一覧',
                style: context.textTheme.titleMedium,
              ),
              const Spacer(),
              // フィルターボタン
              Row(
                children: [
                  _buildFilterButton('受注のみ'),
                  const SizedBox(width: 8),
                  _buildFilterButton('CXL'),
                  const SizedBox(width: 8),
                  _buildFilterButton('すべて'),
                  const SizedBox(width: 8),
                  _buildFilterButton('新規登録'),
                ],
              ),
            ],
          ),
          // フィルター項目
          RowSeparated(
            separatorBuilder: (context, index) => SizedBox(
              width: context.appTheme.spacing.marginMedium,
            ),
            children: [
              IntrinsicWidth(
                stepWidth: 200,
                child: DropdownButtonFormField<String>(
                  value: null,
                  decoration: const InputDecoration(
                    label: Text('エージェント'),
                  ),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('選択してください')),
                    DropdownMenuItem(value: 'agent1', child: Text('エージェント1')),
                    DropdownMenuItem(value: 'agent2', child: Text('エージェント2')),
                  ],
                  onChanged: (value) {},
                ),
              ),
              IntrinsicWidth(
                stepWidth: 200,
                child: DropdownButtonFormField<String>(
                  value: null,
                  decoration: const InputDecoration(
                    label: Text('入園口'),
                  ),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('選択してください')),
                    DropdownMenuItem(value: 'entrance1', child: Text('入園口1')),
                    DropdownMenuItem(value: 'entrance2', child: Text('入園口2')),
                  ],
                  onChanged: (value) {},
                ),
              ),
              IntrinsicWidth(
                stepWidth: 200,
                child: DropdownButtonFormField<String>(
                  value: null,
                  decoration: const InputDecoration(
                    label: Text('国籍'),
                  ),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('選択してください')),
                    DropdownMenuItem(value: 'JP', child: Text('日本')),
                    DropdownMenuItem(value: 'VN', child: Text('ベトナム')),
                    DropdownMenuItem(value: 'CN', child: Text('中国')),
                  ],
                  onChanged: (value) {},
                ),
              ),
              IntrinsicWidth(
                stepWidth: 200,
                child: DropdownButtonFormField<String>(
                  value: null,
                  decoration: const InputDecoration(
                    label: Text('病名'),
                  ),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('選択してください')),
                    DropdownMenuItem(value: 'disease1', child: Text('病名1')),
                    DropdownMenuItem(value: 'disease2', child: Text('病名2')),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          // 検索・クリアボタン
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  // クリア処理
                },
                child: const Center(
                  child: Text('クリア'),
                ),
              ),
              SizedBox(width: context.appTheme.spacing.marginMedium),
              ElevatedButton(
                onPressed: () {
                  // 検索処理
                },
                child: const Center(
                  child: Text('検索'),
                ),
              ),
            ],
          ),
          // プレ会員テーブル
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('患者')),
                  DataColumn(label: Text('エージェント')),
                  DataColumn(label: Text('案件番号')),
                  DataColumn(label: Text('受付')),
                  DataColumn(label: Text('入国日')),
                  DataColumn(label: Text('出国日')),
                  DataColumn(label: Text('国籍')),
                  DataColumn(label: Text('病名')),
                ],
                rows: [
                  _buildDataRow(
                    'testito testtakashi',
                    'エージェント1',
                    '202506061',
                    '見積書',
                    '2025/04/10',
                    '2025/04/11',
                    'ベトナム',
                    '病名1',
                  ),
                  _buildDataRow(
                    'THANH VINH DO',
                    '25/1 (MV)',
                    '20250401KC',
                    '見積書',
                    '2025/04/10',
                    '2025/04/11',
                    'ベトナム',
                    '病名2',
                  ),
                  _buildDataRow(
                    'suzuki tarou',
                    'エージェント2',
                    '202506031',
                    '請求書',
                    '2025/04/10',
                    '2025/04/11',
                    '日本',
                    '病名3',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    final isSelected = _selectedFilter == label;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? context.appTheme.primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  DataRow _buildDataRow(
    String patient,
    String agent,
    String caseNumber,
    String reception,
    String entryDate,
    String departureDate,
    String nationality,
    String diseaseName,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(patient)),
        DataCell(Text(agent)),
        DataCell(
          Text(
            caseNumber,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataCell(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: reception == '見積書' ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              reception,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DataCell(Text(entryDate)),
        DataCell(Text(departureDate)),
        DataCell(Text(nationality)),
        DataCell(Text(diseaseName)),
      ],
    );
  }
}
