import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/sales_quota/data/models/daily_quota_model/daily_quota_model.dart';
import 'package:wncc_portal/features/sales_quota/domain/usecases/daily_quota_usecase.dart';

part 'sales_quota_state.dart';

class SalesQuotaCubit extends Cubit<SalesQuotaState> {
  SalesQuotaCubit(this.dailyQuotaUsecase) : super(SalesQuotaInitial());
  final DailyQuotaUsecase dailyQuotaUsecase;
  Future<void> getDailyQuotaByDate(String date) async {
    emit(SalesQuotaloading());
    var result = await dailyQuotaUsecase.call(date);
    result.fold((error) {
      emit(SalesQuotaFailure(error: error.msg));
    }, (quota) {
      emit(SalesQuotaSuccess(dailyQuotaModel: quota));
    });
  }
}
