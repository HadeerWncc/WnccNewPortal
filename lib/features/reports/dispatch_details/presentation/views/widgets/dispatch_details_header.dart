import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/multi_select_drop_down.dart';
import 'package:wncc_portal/features/reports/dispatch_details/data/models/dispatch_region.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/custom_year_picker.dart';

class DispatchDetailsHeader extends StatelessWidget {
  const DispatchDetailsHeader(
      {super.key, required this.allCities, required this.selectedCities, this.onChanged});
  final List<DispatchRegion> allCities;
  final List<String> selectedCities;
   final Function(List<String>)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xfff9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            CustomYearPicker(
              title: 'Select Year',
              onChange: (value) {
                // BlocProvider.of<FactVsCustCubit>(context)
                //     .getFactVsCustDisp(1, value);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .44,
              child: MultiSelectDropDown(
                cities: allCities,
                selectedCities: selectedCities,
                onChanged: onChanged,
              ),
            )
          ]),
    );
  }
}
