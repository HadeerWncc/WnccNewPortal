import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/add_new_dispatcher_cubit/add_new_dispatcher_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_agents_cubit/get_agents_cubit.dart';

class AddNewDispatcher extends StatefulWidget {
  const AddNewDispatcher({
    super.key,
  });

  @override
  State<AddNewDispatcher> createState() => _AddNewDispatcherState();
}

class _AddNewDispatcherState extends State<AddNewDispatcher> {
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomPlaceholderInput(
          labelText: 'Dispatcher',
          width: 150,
          controller: nameController,
        ),
        const SizedBox(width: 10),
        BlocConsumer<AddNewDispatcherCubit, AddNewDispatcherState>(
          listener: (context, state) {
            if (state is AddNewDispatcherSuccess) {
              ShowSnackbar.showSnackBar(context, state.msg, 'S');
              BlocProvider.of<GetAgentsCubit>(context).getAgents();
            }
            if (state is AddNewDispatcherFailure) {
              ShowSnackbar.showSnackBar(context, state.error, 'F');
            }
          },
          builder: (context, state) {
            if (state is AddNewDispatcherLoading) {
              return const CustomButtonWithIcon(
                child: 'loading',
                textColor: Colors.white,
                bgColor: Color.fromARGB(255, 120, 169, 103),
                onHoverColor: Color.fromARGB(255, 147, 214, 124),
                icon: Symbols.check,
                onTap: null,
              );
            }
            return CustomButtonWithIcon(
              child: 'Create',
              textColor: Colors.white,
              bgColor: kBtnColor,
              onHoverColor: const Color.fromARGB(255, 147, 214, 124),
              icon: Symbols.check,
              onTap: () {
                BlocProvider.of<AddNewDispatcherCubit>(context)
                    .addNewDispatcher(nameController.text);
              },
            );
          },
        )
      ],
    );
  }
}
