import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/constants/icons.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/customerService/complains/domain/entities/create_complain_entity.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/complains_cubit/complains_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/create_new_complain/create_new_complain_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/create_complain_form.dart';

class CreateComplainPage extends StatefulWidget {
  const CreateComplainPage({super.key});

  @override
  State<CreateComplainPage> createState() => _CreateComplainPageState();
}

class _CreateComplainPageState extends State<CreateComplainPage> {
  TextEditingController payerId = TextEditingController();
  TextEditingController contactPerson = TextEditingController();
  TextEditingController contactPhone = TextEditingController();
  TextEditingController complainSubject = TextEditingController();
  String requestType = "";
  int requestLevel = 0;
  TextEditingController comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Add Complain',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(
                      Symbols.close,
                      size: 24,
                      weight: 900,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            CreateComplainForm(
              complainSubject: complainSubject,
              comment: comment,
              contactPerson: contactPerson,
              contactPhone: contactPhone,
              payerId: payerId,
              onRequestLevelChange: (levelValue) {
                requestLevel = levelValue;
              },
              onRequestTypeChange: (typeValue) {
                requestType = typeValue;
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: CustomButton(
                    contant: 'Discard',
                    color: const Color(0xffF9F9F9),
                    textColor: const Color.fromARGB(255, 57, 57, 57),
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                  child: BlocConsumer<CreateNewComplainCubit,
                      CreateNewComplainState>(
                    listener: (context, state) {
                      if (state is CreateNewComplainSuccess) {
                        BlocProvider.of<ComplainsCubit>(context)
                            .getAllComplains();
                        GoRouter.of(context).pop();
                        ShowSnackbar.showSnackBar(context, state.msg, 'S');
                      } else if (state is CreateNewComplainFailure) {
                        ShowSnackbar.showSnackBar(context, state.error, 'F');
                      }
                    },
                    builder: (context, state) {
                      if (state is CreateNewComplainLoading) {
                        return const CustomButtonWithIcon(
                          child: 'Loading',
                          textColor: Colors.white,
                          bgColor: kBtnColor,
                          icon: loadingIcon,
                          onHoverColor: Color.fromARGB(255, 116, 174, 240),
                          onTap: null,
                        );
                      }
                      return CustomButtonWithIcon(
                        child: 'Submit',
                        textColor: Colors.white,
                        bgColor: kBtnColor,
                        icon: Symbols.done_all,
                        onHoverColor: const Color.fromARGB(255, 116, 174, 240),
                        onTap: () {
                          tryToCreateNewComplain(context);
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void tryToCreateNewComplain(BuildContext context) {
    CreateComplainEntity createComplainEntity = CreateComplainEntity(
      subject: complainSubject.text,
      payerId: payerId.text,
      contactPerson: contactPerson.text,
      contactPhone: contactPhone.text,
      description: comment.text,
      type: requestType,
      level: requestLevel,
    );
    context
        .read<CreateNewComplainCubit>()
        .createNewComplain(createComplainEntity);
  }
}
