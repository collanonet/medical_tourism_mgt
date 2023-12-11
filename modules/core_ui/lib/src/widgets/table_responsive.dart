import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class DynamicTable extends StatefulWidget {
  final TableData data;
  final VoidCallback? onScrollMax;
  final VoidCallback? onScrollMin;
  final BoxDecoration? rowDecoration;
  final BoxDecoration? headerDecoration;
  final Color? oddRowColor;
  final Color? evenRowColor;
  final int? rowsPerPage;

  const DynamicTable({
    Key? key,
    required this.data,
    this.onScrollMax,
    this.onScrollMin,
    this.rowDecoration,
    this.headerDecoration,
    this.oddRowColor,
    this.evenRowColor,
    this.rowsPerPage = 10,
  }) : super(key: key);

  @override
  State<DynamicTable> createState() => _DynamicTableState();
}

class _DynamicTableState extends State<DynamicTable> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;
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

  void _loadNextPage() {
    if (widget.data.rows.isNotEmpty && widget.rowsPerPage != null) {
      setState(() {
        _currentPage = (_currentPage + 1).clamp(1, totalPages);
      });
    }
  }

  void _loadPreviousPage() {
    if (widget.data.rows.isNotEmpty && widget.rowsPerPage != null) {
      setState(() {
        _currentPage = (_currentPage - 1).clamp(1, totalPages);
      });
    }
  }

  int get totalPages {
    if (widget.data.rows.isNotEmpty && widget.rowsPerPage != null) {
      return (widget.data.rows.length / widget.rowsPerPage!).ceil();
    } else {
      return 1;
    }
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
            ? const SizedBox()
            : Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: rowsToShow.length,
                  itemBuilder: (context, index) {
                    Decoration? rowDecoration;
                    if (widget.data.rows.isNotEmpty) {
                      final rowIndex = startIndex + index;
                      final rowColor = rowIndex.isOdd
                          ? widget.oddRowColor ?? Colors.white
                          : widget.evenRowColor ?? const Color(0xffEDF8F8);
                      rowDecoration = widget.rowDecoration ??
                          BoxDecoration(color: rowColor);
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
                ),
              ),
        if (widget.data.rows.isNotEmpty && widget.rowsPerPage != null)
          Container(
            decoration: widget.headerDecoration ??
                const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8.0),
                  ),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _currentPage > 0 ? _loadPreviousPage : null,
                  icon: const Icon(Icons.arrow_left),
                ),
                Text('Page ${_currentPage + 1}'),
                IconButton(
                  onPressed:
                      endIndex < widget.data.rows.length ? _loadNextPage : null,
                  icon: const Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
      ],
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
