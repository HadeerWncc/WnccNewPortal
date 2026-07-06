import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/manager/helper/get_areas_value.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/dispatch_details_per_region_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/dispatch_details_per_region_model/relation_value.dart';

Widget buildHeaderPerRegionRow(
    List<DispatchDetailsPerRegionModel> areas, List<String> selectedRegions) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
    decoration: const BoxDecoration(
        color: kBtnColor,
        border: Border(
            top: BorderSide(
                color: Color.fromARGB(255, 163, 160, 160), width: 1))),
    child: Row(
      children: [
        const Expanded(
          flex: 1,
          child: Center(
            child: Text(
              '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        const Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'Date',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white),
              ),
            )),
        for (var area in getTotalAreas(areas))
          // Row(
          //   children: 
            ...[
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    area.name ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
              ...selectedRegions.map((s) {
                RelationValue? region;

                for (final item in area.relationValues ?? <RelationValue>[]) {
                  if (item.name == s) {
                    region = item;
                    break;
                  }
                }
                return Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      region?.name ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                );
              })
            ],
          // ),
        const Expanded(
            flex: 3,
            child: Center(
                child: Text(
              'Total',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ))),
      ],
    ),
  );
}
