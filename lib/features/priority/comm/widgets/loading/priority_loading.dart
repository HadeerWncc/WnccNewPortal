import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/buttons/loading_btn_when_get.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/fields/loading_place_holder_input.dart';
import 'package:wncc_portal/features/priority/comm/widgets/loading/loading_select_product_radio_btn.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/tables/loading_table.dart';

class PriorityLoading extends StatelessWidget {
  const PriorityLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              LoadingPlaceHolderInput(),
              SizedBox(width: 3),
              LoadingPlaceHolderInput(),
              SizedBox(width: 3),
              LoadingPlaceHolderInput(),
              SizedBox(width: 3),
              LoadingPlaceHolderInput(),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: LoadingBtnWhenGet(),
          ),
          SizedBox(height: 30),
          LoadingSelectProductRadioBtn(),
          SizedBox(height: 20),
          LoadingTable(),
        ],
      ),
    );
  }
}