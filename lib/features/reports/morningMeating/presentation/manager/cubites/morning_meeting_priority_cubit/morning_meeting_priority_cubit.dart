import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/morningMeating/data/models/morning_meeting_priority/morning_meeting_priority.dart';
import 'package:wncc_portal/features/reports/morningMeating/domain/repos/morning_meeting_repo.dart';

part 'morning_meeting_priority_state.dart';

class MorningMeetingPriorityCubit extends Cubit<MorningMeetingPriorityState> {
  MorningMeetingPriorityCubit(this.morningMeetingRepo)
      : super(MorningMeetingPriorityInitial());

  final MorningMeetingRepo morningMeetingRepo;

  Future getMorningMeetingPriority(DateTime date) async {
    emit(MorningMeetingPriorityLoading());
    var result = await morningMeetingRepo.getMorningMeetingPriorityData(date);
    result.fold((error) {
      emit(MorningMeetingPriorityFailure(error: error.msg));
    }, (morningMeetingPriority) {
      emit(MorningMeetingPrioritySuccess(
          morningMeetingPriority: morningMeetingPriority));
    });
  }
}
