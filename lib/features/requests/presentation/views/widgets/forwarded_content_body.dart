import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/widgets/custom_multiselect_dropdown.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/get_all_users_cubit/get_all_users_cubit.dart';

class ForwardedContentBody extends StatelessWidget {
  const ForwardedContentBody(
      {super.key,
      required this.forwardResonController,
      required this.onSelectForwardUsers, required this.forwardTextContent});
  final TextEditingController forwardResonController;
  final Function(List<String>) onSelectForwardUsers;
  final String forwardTextContent;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(forwardTextContent),
          const SizedBox(height: 20),
          BlocBuilder<GetAllUsersCubit, GetAllUsersState>(
            builder: (context, state) {
              if (state is GetAllUsersSuccess) {
                return CustomMultiSelectDropDown(
                  selectedValue: state.users[0].fullName,
                  items: state.users.map((user) => user.fullName!).toList(),
                  onChanged: (value) {
                    List<String> usersId = [];
                    usersId.addAll(state.users
                        .where((u) => value.contains(u.fullName))
                        .toList()
                        .map((user) => user.id!));
                    onSelectForwardUsers(usersId);
                  },
                  title: 'Forward to',
                );
              }
              return CustomMultiSelectDropDown(
                selectedValue: '',
                items: const [],
                onChanged: (value) {},
                title: 'Forward to',
              );
            },
          ),
          const SizedBox(height: 15),
          CustomPlaceholderInput(
            linesNum: 3,
            width: MediaQuery.of(context).size.width * .685,
            controller: forwardResonController,
            labelText: 'Forwarded reason...',
          ),
        ],
      ),
    );
  }
}
