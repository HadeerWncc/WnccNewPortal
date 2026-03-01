import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/multi_select_drop_down.dart';
import 'package:wncc_portal/features/reports/factVsCustDisp/presentation/views/widgets/custom_year_picker.dart';

class DispatchDetailsHeader extends StatelessWidget {
  const DispatchDetailsHeader(
      {super.key, required this.allCities, required this.selectedCities});
  final List<String> allCities;
  final List<String> selectedCities;
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
              ),
            )
            // CustomMultiSelectDropDown(
            //   items: const ['Alex', 'Cairo', 'Aswan', 'Fayoum', 'Swiz', 'Giza'],
            //   selectedValue: const ['Alex', 'Cairo', 'Aswan'],
            //   title: '4 items selected',
            //   hintText: 'Select',
            //   width: MediaQuery.of(context).size.width * .2,
            //   onChanged: (value) {},
            // )
          ]),
    );
  }
}
