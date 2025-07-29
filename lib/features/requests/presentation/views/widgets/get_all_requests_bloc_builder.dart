import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/requests/presentation/managers/requests_cubit/requests_cubit.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/requests_table.dart';

class GetAllRequestsBlocBuilder extends StatelessWidget {
  const GetAllRequestsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsCubit, RequestsState>(
      builder: (context, state) {
        if (state is RequestsSuccess) {
          return RequestsTable(
            requests: state.requests,
          );
        } else if (state is RequestsFailure) {
          return Text(state.error);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
