import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/manager/helper/data_processing/process_customer_entity.dart';
import 'package:wncc_portal/features/reports/morningMeating/presentation/manager/helper/data_processing/process_factory_entity.dart';
import 'package:wncc_portal/features/reports/morningMeating/domain/entities/customer_dispatch_entity.dart';
import 'package:wncc_portal/features/reports/morningMeating/domain/entities/factory_entity.dart';
import 'package:wncc_portal/features/reports/morningMeating/domain/repos/morning_meeting_repo.dart';

part 'morning_meeting_state.dart';

class MorningMeetingCubit extends Cubit<MorningMeetingState> {
  MorningMeetingCubit(this.morningMeetingRepo) : super(MorningMeetingInitial());

  final MorningMeetingRepo morningMeetingRepo;
  Future<void> getMorningMeetingData(DateTime date) async {
    emit(MorningMeetingLoading());

    var result = await morningMeetingRepo.getMorningMeetingData(date);
    result.fold((error) {
      emit(MorningMeetingFailure(errorMessage: error.msg));
    }, (morningMeetingList) async {
      // Process Factory Entities in background
      List<FactoryEntity> factoryEntities =
          processFactoryEntities(morningMeetingList, date);

      // CustomerDispatchEntities: ممكن تعمل نفس الفكرة لاحقاً
      List<CustomerDispatchEntity> customerDispatchEntities =
          processCustomerEntities(morningMeetingList, date);

      emit(MorningMeetingSuccess(
        factoryEntity: factoryEntities,
        customerDispatchEntity: customerDispatchEntities,
      ));
    });
  }
}
