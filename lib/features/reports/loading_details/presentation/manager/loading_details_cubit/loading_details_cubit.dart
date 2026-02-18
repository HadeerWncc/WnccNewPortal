import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/loading_details/data/models/loading_details_model.dart';
import 'package:wncc_portal/features/reports/loading_details/domain/repos/loading_repo.dart';

part 'loading_details_state.dart';

class LoadingDetailsCubit extends Cubit<LoadingDetailsState> {
  LoadingDetailsCubit(this.loadingRepo) : super(LoadingDetailsInitial());

  final LoadingRepo loadingRepo;
  
  Future getLoadingDetails() async{
   emit(LoadingDetailsLoading());
   var result = await loadingRepo.getLoadingDetails();
   result.fold((error){
    emit(LoadingDetailsFailure(errorMsg: error.msg));
   }, (loadingDetails){
    emit(LoadingDetailsSuccess(loadingDetails: loadingDetails));
   });
  }
}
