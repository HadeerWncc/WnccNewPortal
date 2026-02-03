import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/features/home/updates/presentation/manager/cubits/updates_cubit/updates_cubit.dart';
import 'package:wncc_portal/features/home/updates/presentation/views/widgets/connect_line.dart';
import 'package:wncc_portal/features/home/updates/presentation/views/widgets/update_box_content.dart';
import 'package:wncc_portal/features/home/updates/presentation/views/widgets/update_icon_container.dart';

class AllUpdatesList extends StatelessWidget {
  const AllUpdatesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdatesCubit, UpdatesState>(
      listener: (context, state) {
        if (state is UpdatesFailure) {
          ShowSnackbar.showSnackBar(context, state.errorMessage, 'F');
        }
      },
      builder: (context, state) {
        if (state is UpdatesSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .6,
            child: ListView.builder(
                itemCount: state.updates.length,
                itemBuilder: (context, index) {
                  return IntrinsicHeight(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const UpdateIconContainer(),
                                const SizedBox(height: 10),
                                index != state.updates.length - 1
                                    ? const ConnectLine()
                                    : const SizedBox()
                              ],
                            ),
                            UpdatesBoxContent(
                              updatesModel: state.updates[index],
                            )
                          ],
                        )),
                  );
                }),
          );
        } else if (state is UpdatesFailure) {
          return const Center(
            child: Text('Something went wrong'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
