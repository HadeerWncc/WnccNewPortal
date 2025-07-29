import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/features/user/domain/entities/profile_entity.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_cities_cubit/get_cities_cubit.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/update_profile_cubit/update_profile_cubit.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/custom_personal_image_item.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/update_profile_bloc_consumer.dart';

class CustomChangePersonalInfoForm extends StatefulWidget {
  const CustomChangePersonalInfoForm({
    super.key,
    required this.user,
    required this.states,
    required this.cities,
  });
  final UserModel user;
  final List<String> states;
  final List<String> cities;
  @override
  State<CustomChangePersonalInfoForm> createState() =>
      _CustomChangePersonalInfoFormState();
}

class _CustomChangePersonalInfoFormState
    extends State<CustomChangePersonalInfoForm> {
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
      children: [
        CustomPersonalImageItem(
          onImageSelected: (value) {
            selectedBase64Image = value;
          },
        ),
        const SizedBox(height: 20),
        CustomPlaceholderInput(
          labelText: 'Full Name',
          controller: fullNameController,
        ),
        const SizedBox(height: 20),
        CustomDropDownInput(
          selectedValue: selectedState,
          items: widget.states,
          title: 'State',
          onChanged: (value) async {
            selectedState = value!;
            await BlocProvider.of<GetCitiesCubit>(context)
                .getCities(selectedState!);
          },
        ),
        const SizedBox(height: 20),
        BlocBuilder<GetCitiesCubit, GetCitiesState>(
          builder: (context, state) {
            if (state is GetCitiesSuccess) {
              return CustomDropDownInput(
                selectedValue: state.cities.contains(selectedCity)
                    ? selectedCity
                    : state.cities[0],
                items: state.cities,
                title: 'City',
                onChanged: (value) {
                  selectedCity = value!;
                },
              );
            }
            return const CustomDropDownInput(
              selectedValue: '',
              items: [''],
              title: 'City',
              onChanged: null,
            );
          },
        ),
        const SizedBox(height: 20),
        CustomPlaceholderInput(
          labelText: 'Phone Number',
          controller: phoneController,
        ),
        // CustomPhoneInputList(phonesController: phonesController),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButtonWithIcon(
              onTap: () {
                GoRouter.of(context).push(AppRouter.changePasswordPath);
              },
              child: 'Skip',
              bgColor: const Color(0xffF1F1F3),
              textColor: Colors.black,
              icon: Symbols.swipe_up,
              onHoverColor: const Color.fromARGB(255, 179, 179, 179),
            ),
            const SizedBox(width: 13),
            BlocConsumerUpdateProfile(
              tryToUpdateProfile: tryToUpdateProfile,
            ),
          ],
        ),
      ],
    );
  }

  void tryToUpdateProfile(BuildContext context) {
    context.read<UpdateProfileCubit>().updateProfile(
          ProfileEntity(
            fullName: fullNameController.text,
            government: selectedState!,
            city: selectedCity!,
            image: selectedBase64Image,
            phoneNumber: phoneController.text,
            // phones: phonesController.map((ph) => ph.text).toList(),
          ),
        );
  }
}
