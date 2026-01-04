import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/managers/request_details_cubit/request_details_cubit.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/edit_request_page.dart';

class EditRequestView extends StatelessWidget {
  const EditRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestDetailsCubit, RequestDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is RequestDetailsLoading){
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else if(state is RequestDetailsSuccess){
           return EditRequestPage(payerId: state.requestDetails.payerId!, id: state.requestDetails.id!, requestDetailsEntity: state.requestDetails,);
        }
        else{
          return const Scaffold(
            body: Center(
              child: Text('Failed to load request details'),
            ),
          );
        }
       
      },
    );
  }
}
