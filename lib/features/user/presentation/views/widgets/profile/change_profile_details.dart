import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/user/domain/entities/profile_entity.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_cities_cubit/get_cities_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/change_profile_bloc_consumer.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/profile/custom_change_image_picker.dart';

class ChangeProfileDetails extends StatefulWidget {
  const ChangeProfileDetails({
    super.key,
    required this.user,
    required this.states,
    required this.cities,
  });

  final UserModel user;
  final List<String> states;
  final List<String> cities;

  @override
  State<ChangeProfileDetails> createState() => _ChangeProfileDetailsState();
}

class _ChangeProfileDetailsState extends State<ChangeProfileDetails> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? selectedState;
  String? selectedCity;
  List<int>? selectedBase64Image;
  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fullNameController.text = widget.user.fullName ?? '';
    phoneController.text = widget.user.phoneNumber ?? '';
    selectedState = widget.user.state ?? widget.states[0];
    selectedCity = widget.user.city ?? widget.cities[0];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomChangeImagePicker(
          onImageSelected: (value) {
            selectedBase64Image = value;
            // setState(() {});
          },
        ),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPlaceholderInput(
              controller: fullNameController,
              labelText: 'Full Name',
              // width: MediaQuery.of(context).size.width * .5,
            ),
            const SizedBox(height: 15),
            CustomPlaceholderInput(
              controller: phoneController,
              labelText: 'Phone Number',
              keyboardType: TextInputType.number,
              // width: MediaQuery.of(context).size.width * .5,
            ),
            const SizedBox(height: 15),
            CustomDropDownInput(
              selectedValue: widget.user.state,
              items: widget.states,
              title: 'Government',
              // width: MediaQuery.of(context).size.width * .5,
              onChanged: (value) async {
                selectedState = value;
                // setState(() {

                // });
                await BlocProvider.of<GetCitiesCubit>(context)
                    .getCities(selectedState!);
              },
            ),
            const SizedBox(height: 15),
            BlocBuilder<GetCitiesCubit, GetCitiesState>(
              builder: (context, state) {
                if (state is GetCitiesSuccess) {
                  bool found = state.cities.contains(widget.user.city);
                  selectedCity = found ? widget.user.city : state.cities[0];
                  return CustomDropDownInput(
                    selectedValue: selectedCity,
                    items: state.cities,
                    title: 'City',
                    // width: MediaQuery.of(context).size.width * .5,
                    onChanged: (value) {
                      selectedCity = value;
                      // setState(() {

                      // });
                    },
                  );
                }
                return CustomDropDownInput(
                  selectedValue: widget.user.city,
                  items: widget.cities,
                  title: 'City',
                  // width: MediaQuery.of(context).size.width * .5,
                  onChanged: (value) {
                    selectedCity = value;
                    // setState(() {

                    // });
                  },
                );
              },
            )
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ChangeProfileBlocConsumer(
                  tryToUpdateProfile: tryToUpdateProfile,
                ),
              ),
              const SizedBox(width: 13),
            ],
          ),
        )
      ],
    );
  }

  void tryToUpdateProfile(BuildContext context) {
    context.read<UpdateProfileCubit>().updateProfile(ProfileEntity(
          fullName: fullNameController.text,
          government: selectedState!,
          city: selectedCity!,
          image: selectedBase64Image,
          phoneNumber: phoneController.text,
        ));
  }
}
