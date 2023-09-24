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
        _loadNextPage();
      } else if (_isAtMinScroll()) {
        widget.onScrollMin?.call();
        _loadPreviousPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadNextPage() {
    if (widget.rowsPerPage != null) {
      setState(() {
        _currentPage = (_currentPage + 1).clamp(1, totalPages);
      });
    }
  }

  void _loadPreviousPage() {
    if (widget.rowsPerPage != null) {
      setState(() {
        _currentPage = (_currentPage - 1).clamp(1, totalPages);
      });
    }
  }

  int get totalPages {
    if (widget.rowsPerPage != null) {
      return (widget.data.rows.length / widget.rowsPerPage!).ceil();
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rowsPerPage = widget.rowsPerPage ?? widget.data.rows.length;
    final startIndex = _currentPage * rowsPerPage;
    final endIndex = startIndex + rowsPerPage;
    final rowsToShow = widget.data.rows.sublist(startIndex, endIndex);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: widget.data.columns
              .map(
                (column) => Expanded(
                  flex: column.flex,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: widget.headerDecoration ??
                        BoxDecoration(color: Colors.grey[300]),
                    child: column.titleHeader,
                  ),
                ),
              )
              .toList(),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: rowsToShow.length,
            itemBuilder: (context, index) {
              final rowIndex = startIndex + index;
              final rowColor = rowIndex.isOdd
                  ? widget.oddRowColor ?? Colors.transparent
                  : widget.evenRowColor ?? Colors.transparent;
              final rowDecoration =
                  widget.rowDecoration ?? BoxDecoration(color: rowColor);

              return DecoratedBox(
                decoration: rowDecoration,
                child: Row(
                  children: rowsToShow[index]
                      .cell
                      .mapIndexed(
                        (cellIndex, cell) => Expanded(
                          flex: widget.data.columns[cellIndex].flex,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: cell,
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
        ),
        if (widget.rowsPerPage != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
  final List<Widget> cell;

  RowTableData({
    required this.cell,
  });
}
