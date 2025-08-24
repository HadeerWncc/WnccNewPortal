import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/request_loading_table.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/requests_cubit/requests_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/requests_table.dart';

class GetAllRequestsBlocBuilder extends StatelessWidget {
  const GetAllRequestsBlocBuilder({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsCubit, RequestsState>(
      builder: (context, state) {
        if (state is RequestsSuccess) {
          return RequestsTable(
            requests: state.requests,
            user: user,
          );
        } else if (state is RequestsFailure) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const RequestLoadingTable();
      },
    );
  }
}
