import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RegionPeriodPrice {
  final String region;
  final List<PeriodPrice> periods;
  RegionPeriodPrice(this.region, this.periods);
}

class PeriodPrice {
  final String periodName;
  final int pickup;
  final int delivery;
  PeriodPrice(this.periodName, this.pickup, this.delivery);
}

class MultiPeriodTable extends StatefulWidget {
  const MultiPeriodTable({super.key});

  @override
  State<MultiPeriodTable> createState() => _MultiPeriodTableState();
}

class _MultiPeriodTableState extends State<MultiPeriodTable> {
  late MultiPeriodDataSource _dataSource;

  final List<RegionPeriodPrice> _regionPeriodPrices = [
    RegionPeriodPrice("Minya", [
      PeriodPrice("10 Sep - Now", 3300, 3400),
      PeriodPrice("1 Aug - 10 Sep", 3100, 3200),
      PeriodPrice("15 Jul - 1 Aug", 3000, 3150),
    ]),
    RegionPeriodPrice("Fayoum", [
      PeriodPrice("10 Sep - Now", 3100, 3500),
      PeriodPrice("1 Aug - 10 Sep", 3000, 3150),
      PeriodPrice("15 Jul - 1 Aug", 2950, 3100),
    ]),
    RegionPeriodPrice("Fayoum", [
      PeriodPrice("10 Sep - Now", 3100, 3500),
      PeriodPrice("1 Aug - 10 Sep", 3000, 3150),
      PeriodPrice("15 Jul - 1 Aug", 2950, 3100),
    ]),
    RegionPeriodPrice("Fayoum", [
      PeriodPrice("10 Sep - Now", 3100, 3500),
      PeriodPrice("1 Aug - 10 Sep", 3000, 3150),
      PeriodPrice("15 Jul - 1 Aug", 2950, 3100),
    ]),
    RegionPeriodPrice("Fayoum", [
      PeriodPrice("10 Sep - Now", 3100, 3500),
      PeriodPrice("1 Aug - 10 Sep", 3000, 3150),
      PeriodPrice("15 Jul - 1 Aug", 2950, 3100),
    ]),
    RegionPeriodPrice("Fayoum", [
      PeriodPrice("10 Sep - Now", 3100, 3500),
      PeriodPrice("1 Aug - 10 Sep", 3000, 3150),
      PeriodPrice("15 Jul - 1 Aug", 2950, 3100),
    ]),
    RegionPeriodPrice("Fayoum", [
      PeriodPrice("10 Sep - Now", 3100, 3500),
      PeriodPrice("1 Aug - 10 Sep", 3000, 3150),
      PeriodPrice("15 Jul - 1 Aug", 2950, 3100),
    ]),
  ];

  @override
  void initState() {
    super.initState();
    _dataSource = MultiPeriodDataSource(_regionPeriodPrices);
  }

  @override
  Widget build(BuildContext context) {
    final periods = _regionPeriodPrices.first.periods;

    return SizedBox(
      height: 300,
      child: SfDataGrid(
        headerRowHeight: 30,
        rowHeight: 40,
        source: _dataSource,
        gridLinesVisibility: GridLinesVisibility.both,
        headerGridLinesVisibility: GridLinesVisibility.both,
        frozenColumnsCount: 1,
        columnWidthMode: ColumnWidthMode.none,
        columns: [
          GridColumn(
            columnName: 'region',
            width: 120,
            label: _buildHeaderCell("Region"),
          ),
          for (var p in periods) ...[
            GridColumn(
              columnName: '${p.periodName}_pickup',
              width: 100,
              label: _buildHeaderCell("Pickup"),
            ),
            GridColumn(
              columnName: '${p.periodName}_delivery',
              width: 100,
              label: _buildHeaderCell("Delivery"),
            ),
          ]
        ],
        stackedHeaderRows: [
          StackedHeaderRow(cells: [
            for (var p in periods)
              StackedHeaderCell(
                columnNames: [
                  '${p.periodName}_pickup',
                  '${p.periodName}_delivery'
                ],
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F7FD),
                    border: Border.all(
                        color: const Color.fromARGB(255, 234, 235, 234),
                        width: 1),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    p.periodName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ),
              ),
          ]),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF0F7FD),
        border: Border.all(
            color: const Color.fromARGB(255, 234, 235, 234), width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

class MultiPeriodDataSource extends DataGridSource {
  MultiPeriodDataSource(List<RegionPeriodPrice> data) {
    _rows = data.map((region) {
      final cells = <DataGridCell>[];
      cells.add(
          DataGridCell<String>(columnName: 'region', value: region.region));
      for (var p in region.periods) {
        cells.add(DataGridCell<int>(
            columnName: '${p.periodName}_pickup', value: p.pickup));
        cells.add(DataGridCell<int>(
            columnName: '${p.periodName}_delivery', value: p.delivery));
      }
      return DataGridRow(cells: cells);
    }).toList();
  }

  List<DataGridRow> _rows = [];

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((cell) {
        final isRegionColumn = cell.columnName == 'region';
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xffDFFFEA),
            border: Border.all(
              color: const Color.fromARGB(255, 234, 235, 234),
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
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
