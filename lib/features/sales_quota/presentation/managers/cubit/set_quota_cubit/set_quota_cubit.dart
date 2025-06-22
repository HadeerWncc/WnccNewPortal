import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/copy_quota_dates_entity.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/daily_quota_entity.dart';
import 'package:wncc_portal/features/sales_quota/domain/usecases/copy_quota_usecase.dart';
import 'package:wncc_portal/features/sales_quota/domain/usecases/set_quota_usecase.dart';

part 'set_quota_state.dart';

class SetQuotaCubit extends Cubit<SetQuotaState> {
  SetQuotaCubit(this.setQuotaUsecase, this.copyQuotaUsecase)
      : super(SetQuotaInitial());

  final SetQuotaUsecase setQuotaUsecase;
  final CopyQuotaUsecase copyQuotaUsecase;
  Future<void> distributeDailyQuota({
    required DailyQuotaEntity dailyQuotaEntity,
  }) async {
    emit(SetQuotaLoading());
    var result = await setQuotaUsecase(dailyQuotaEntity);
    result.fold(
      (failure) {
        emit(SetQuotaFailure(error: failure.msg));
      },
      (message) {
        emit(SetQuotaSuccess(message: message));
      },
    );
  }

  Future<void> copedQuota({
    required CopyQuotaDateEntity copyQuotaEntity,
  }) async {
    emit(CopyQuotaLoading());
    var result = await copyQuotaUsecase(copyQuotaEntity);
    result.fold(
      (failure) {
        emit(CopyQuotaFailure(error: failure.msg));
      },
      (message) {
        emit(CopyQuotaSuccess(message: message));
      },
    );
  }
}
