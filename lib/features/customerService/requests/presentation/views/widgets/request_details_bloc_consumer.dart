import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/request_details_cubit/request_details_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/request_details_body.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/request_details_loading.dart';

class RequestDetailsBlocConsumer extends StatelessWidget {
  const RequestDetailsBlocConsumer({
    super.key,
    required this.requestId,
    required this.user,
  });

  final String requestId;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestDetailsCubit, RequestDetailsState>(
      listener: (context, state) {
        if (state is RequestChangeLogSuccess) {
          ShowSnackbar.showSnackBar(context, state.msg, 'S');
        } else if (state is RequestChangeLogFailure) {
          BlocProvider.of<RequestDetailsCubit>(context).openRequest(requestId);

          ShowSnackbar.showSnackBar(context, state.error, 'F');
        }
      },
      builder: (context, state) {
        if (state is RequestDetailsSuccess) {
          return RequestDetailsBody(
            user: user,
            requestDetailsEntity: state.requestDetails,
          );
        } else if (state is RequestChangeLogSuccess) {
          return RequestDetailsBody(
            user: user,
            requestDetailsEntity: state.requestDetails,
          );
        } else if (state is RequestDetailsFailure) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        return const RequestDetailsLoadingPage();
      },
    );
  }
}
