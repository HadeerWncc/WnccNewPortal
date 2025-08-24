import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/managers/cubits/complains_cubit/complains_cubit.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/add_complain_section.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/complain_table.dart';
import 'package:wncc_portal/features/customerService/complains/presentation/views/widgets/complains_filter.dart';

class ComplainsPageBody extends StatelessWidget {
  const ComplainsPageBody({super.key, required this.user});

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AddComplainSection(),
          const ComplainsFilter(),
          BlocBuilder<ComplainsCubit, ComplainsState>(
            builder: (context, state) {
              if (state is ComplainsSuccess) {
                return ComplainTable(complains: state.complains,user: user,);
              } else if (state is ComplainsFailure) {
                return Text(state.error);
              }
              return const SingleChildScrollView();
            },
          ),
        ],
      ),
    );
  }
}
