import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/updates/presentation/manager/cubits/updates_cubit/updates_cubit.dart';
import 'package:wncc_portal/features/updates/presentation/views/widgets/add_update_box.dart';
import 'package:wncc_portal/features/updates/presentation/views/widgets/all_updates_list.dart';

class UpdatesPageBody extends StatelessWidget {
  const UpdatesPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UpdatesCubit>(context).fetchAllUpdates();

    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AllUpdatesList(),
            Divider(
              color: Color.fromARGB(255, 87, 86, 86),
            ),
            AddUpdateBox()
          ],
        ),
      ),
    );
  }
}
