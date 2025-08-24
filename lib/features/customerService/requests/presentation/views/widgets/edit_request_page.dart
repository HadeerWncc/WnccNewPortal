import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/constants/icons.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/create_request_entity.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/create_request_cubit/create_request_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/requests_cubit/requests_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/edit_request_form.dart';

class EditRequestPage extends StatefulWidget {
  const EditRequestPage({super.key, required this.payerId, required this.id});
  final String payerId;
  final String id;
  @override
  State<EditRequestPage> createState() => _EditRequestPageState();
}

class _EditRequestPageState extends State<EditRequestPage> {
  TextEditingController contactPerson = TextEditingController();
  TextEditingController contactPhone = TextEditingController();
  List<String> requestTypes = List.empty();
  int requestDelivery = 0;
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
                    'Edit Request',
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
            EditRequestForm(
              payerId: widget.payerId,
              comment: comment,
              contactPerson: contactPerson,
              contactPhone: contactPhone,
              onRequestDeliveryChange: (deliveryValue) {
                requestDelivery = deliveryValue;
              },
              onRequestLevelChange: (levelValue) {
                requestLevel = levelValue;
              },
              onRequestTypesChange: (typesList) {
                requestTypes = typesList;
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
                  child: BlocConsumer<CreateRequestCubit, CreateRequestState>(
                    listener: (context, state) {
                      if (state is CreateRequestSuccess) {
                        BlocProvider.of<RequestsCubit>(context)
                            .getAllRequests();
                        GoRouter.of(context).pop();
                        ShowSnackbar.showSnackBar(context, state.msg, 'S');
                      } else if (state is CreateRequestFailure) {
                        ShowSnackbar.showSnackBar(context, state.error, 'F');
                      }
                    },
                    builder: (context, state) {
                      if (state is CreateRequestLoading) {
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
                          tryToEditRequest(context);
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

  void tryToEditRequest(BuildContext context) {
    CreateRequestEntity requestEntity = CreateRequestEntity(
      id: widget.id,
      description: comment.text,
      contactPerson: contactPerson.text,
      contactPhone: contactPhone.text,
      level: requestLevel,
      delivery: requestDelivery,
      requestTypes: requestTypes,
      payerId: widget.payerId,
    );
    context.read<CreateRequestCubit>().editRequest(requestEntity);
  }
}
