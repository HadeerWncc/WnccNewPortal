import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/complains/domain/entities/complain_entity.dart';
import 'package:wncc_portal/features/complains/domain/repos/complain_repo.dart';

part 'complains_state.dart';

class ComplainsCubit extends Cubit<ComplainsState> {
  ComplainsCubit(this.complainRepo) : super(ComplainsInitial());

  final ComplainRepo complainRepo;

  Future getAllComplains() async {
    emit(ComplainsLoading());
    var result = await complainRepo.getAllComplains();
    result.fold((error) {
      emit(ComplainsFailure(error: error.msg));
    }, (complains) {
      emit(ComplainsSuccess(complains: complains));
    });
  }
}
