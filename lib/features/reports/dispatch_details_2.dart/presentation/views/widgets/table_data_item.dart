import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/domain/entities/dispatch_entity.dart';

class TableDataItem extends StatelessWidget {
  const TableDataItem(
      {super.key,
      required this.value,
      required this.month,
      required this.regions});
  final String value;
  final List<DispatchEntity> regions;
  final String month;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value),
        PopupMenuButton(
          icon: const Icon(
            Symbols.location_on,
            color: Colors.blueGrey,
            weight: 900,
          ),
          color: const Color.fromARGB(255, 42, 42, 42),
          itemBuilder: (context) => [
            PopupMenuItem(
              enabled: false,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Dispatch Regions',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Text(month,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 244, 106, 96),
                          ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  ...regions.map((r) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r.name,
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                        Text(r.value,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 71, 186, 214),
                            ))
                      ],
                    );
                  })
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
