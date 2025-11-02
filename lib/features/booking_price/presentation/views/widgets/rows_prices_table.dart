import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Period {
  final String name;
  final int pickupFree;
  final int pickupTarget;

  Period({
    required this.name,
    required this.pickupFree,
    required this.pickupTarget,
  });
}

class RowsPricesTable extends StatelessWidget {
  const RowsPricesTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Period> periods = [
      Period(name: "10 Sep - Now", pickupFree: 3300, pickupTarget: 3400),
      Period(name: "1 Aug - 10 Sep", pickupFree: 3100, pickupTarget: 3200),
      Period(name: "1 Jul - 1 Aug", pickupFree: 3000, pickupTarget: 3150),
    ];

    return SizedBox(
      height: 120,
      child: SfDataGrid(
        frozenColumnsCount: 1,
        source: FirstTableDataSource(periods: periods),
        gridLinesVisibility: GridLinesVisibility.both,
        headerGridLinesVisibility: GridLinesVisibility.both,
        headerRowHeight: 35,
        rowHeight: 40,
        columnWidthMode: ColumnWidthMode.auto,
        columns: [
          GridColumn(
            columnName: 'Prices',
            label: _buildHeaderCell('Prices'),
            width: 100,
          ),
          for (final p in periods)
            GridColumn(
              columnName: p.name,
              label: _buildHeaderCell(p.name),
              width: 150,
            ),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF0F7FD),
        border: Border.all(
          color: const Color.fromARGB(255, 234, 235, 234),
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class FirstTableDataSource extends DataGridSource {
  FirstTableDataSource({required List<Period> periods}) {
    _rows = [
      DataGridRow(
        cells: [
          const DataGridCell<String>(
            columnName: 'Prices',
            value: 'Pickup Free',
          ),
          ...periods.map(
            (p) => DataGridCell<int>(
              columnName: p.name,
              value: p.pickupFree,
            ),
          ),
        ],
      ),
      DataGridRow(
        cells: [
          const DataGridCell<String>(
            columnName: 'Prices',
            value: 'Pickup Target',
          ),
          ...periods.map(
            (p) => DataGridCell<int>(
              columnName: p.name,
              value: p.pickupTarget,
            ),
          ),
        ],
      ),
    ];
  }

  late List<DataGridRow> _rows;

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        final isRegionColumn = cell.columnName == 'Prices';
        return Container(
          alignment: Alignment.center,
          color: const Color(0xffDFFFEA),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Text(
            cell.value.toString(),
            style: TextStyle(
              fontWeight: isRegionColumn ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }).toList(),
    );
  }
}
