  import 'package:flutter/material.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/shipment_details_model/shipment_details_model.dart';
import 'package:wncc_portal/features/reports/dispatch_details/presentation/views/widgets/build_shipment_data_row.dart';

Widget buildShipmentData(
      ShipmentDetailsModel ship, List<DispatchRegion> regions, BoxBorder? totalBorder) {
    return Column(
      children: [buildShipmentDataRow(ship, regions,totalBorder: totalBorder)],
    );
  }