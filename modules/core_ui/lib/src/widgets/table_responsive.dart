// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:collection/collection.dart';

class DynamicTable extends StatefulWidget {
  final TableData data;
  final VoidCallback? onScrollMax;
  final VoidCallback? onScrollMin;
  final BoxDecoration? rowDecoration;
  final BoxDecoration? headerDecoration;
  final Color? oddRowColor;
  final Color? evenRowColor;
  final int? totalPages;
  final int? rowsPerPage;
  final bool enableScroll;
  final bool isLoading;

  const DynamicTable({
    super.key,
    required this.data,
    this.onScrollMax,
    this.onScrollMin,
    this.rowDecoration,
    this.headerDecoration,
    this.oddRowColor,
    this.evenRowColor,
    this.totalPages = 1,
    this.rowsPerPage = 10,
    this.enableScroll = true,
    this.isLoading = false,
  });

  @override
  State<DynamicTable> createState() => _DynamicTableState();
}

class _DynamicTableState extends State<DynamicTable> {
  final ScrollController _scrollController = ScrollController();
  final int _currentPage = 0;

  bool _isAtMaxScroll() {
    return _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent;
  }

  bool _isAtMinScroll() {
    return _scrollController.position.pixels ==
        _scrollController.position.minScrollExtent;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_isAtMaxScroll()) {
        widget.onScrollMax?.call();
      } else if (_isAtMinScroll()) {
        widget.onScrollMin?.call();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  late List<RowTableData> rowsToShow;
  late int startIndex;
  late int endIndex;
  late int rowsPerPage;

  @override
  Widget build(BuildContext context) {
    if (widget.data.rows.isNotEmpty) {
      rowsPerPage = widget.rowsPerPage ?? widget.data.rows.length;
      startIndex = _currentPage * rowsPerPage;
      endIndex = startIndex + rowsPerPage;
      rowsToShow = widget.data.rows.sublist(startIndex, endIndex);
    }

    return Column(
      children: [
        Container(
          decoration: widget.headerDecoration ??
              const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8.0),
                ),
              ),
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 4.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.data.columns
                .map(
                  (column) => Expanded(
                    flex: column.flex,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: column.titleHeader,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        widget.data.rows.isEmpty
            ? const Center(
                child: Text(
                  'No data available',
                  style: TextStyle(
                    fontFamily: 'NotoSansJP',
                    package: 'core_ui',
                  ),
                ),
              )
            : widget.enableScroll
                ? Expanded(
                    child: list(),
                  )
                : list(),
        if (widget.data.rows.isNotEmpty && widget.rowsPerPage != null)
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            decoration: widget.headerDecoration ??
                const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8.0),
                  ),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  widget.isLoading
                      ? 'さらにデータを読み込み中...'
                      : '合計: $rowsPerPage',
                ),
              ],
            ),
          ),
      ],
    );
  }

  list() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: rowsToShow.length,
      shrinkWrap: !widget.enableScroll,
      physics: widget.enableScroll
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Decoration? rowDecoration;
        if (widget.data.rows.isNotEmpty) {
          final rowIndex = startIndex + index;
          final rowColor = rowIndex.isOdd
              ? widget.oddRowColor ?? Colors.white
              : widget.evenRowColor ?? const Color(0xffEDF8F8);
          rowDecoration =
              widget.rowDecoration ?? BoxDecoration(color: rowColor);
        }

        return InkWell(
          onTap: rowsToShow[index].onTap,
          hoverColor: Colors.grey,
          child: Container(
            decoration: rowDecoration,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 4.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: rowsToShow[index]
                  .cell
                  .mapIndexed(
                    (cellIndex, cell) => Expanded(
                      flex: widget.data.columns[cellIndex].flex,
                      child: cell,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class TableData {
  final List<HeaderTableData> columns;
  final List<RowTableData> rows;

  TableData({
    required this.columns,
    required this.rows,
  });
}

class HeaderTableData {
  final Widget titleHeader;
  final int flex;

  HeaderTableData({
    required this.titleHeader,
    this.flex = 1,
  });
}

class RowTableData {
  final VoidCallback? onTap;
  final List<Widget> cell;

  RowTableData({
    this.onTap,
    required this.cell,
  });
}
