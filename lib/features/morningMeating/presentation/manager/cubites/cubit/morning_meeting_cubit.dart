import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/utils/data_processing/process_customer_entity.dart';
import 'package:wncc_portal/core/utils/data_processing/process_factory_entity.dart';
import 'package:wncc_portal/features/morningMeating/data/models/morning_meeting/morning_meeting.dart';
import 'package:wncc_portal/features/morningMeating/domain/entities/customer_dispatch_entity.dart';
import 'package:wncc_portal/features/morningMeating/domain/entities/factory_entity.dart';
import 'package:wncc_portal/features/morningMeating/domain/repos/morning_meeting_repo.dart';

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
          await processFactoryEntities(morningMeetingList, date);

      // CustomerDispatchEntities: ممكن تعمل نفس الفكرة لاحقاً
      List<CustomerDispatchEntity> customerDispatchEntities =
          await processCustomerEntities(morningMeetingList, date);

      emit(MorningMeetingSuccess(
        factoryEntity: factoryEntities,
        customerDispatchEntity: customerDispatchEntities,
      ));
    });
  }

  // Future<void> getMorningMeetingData(DateTime date) async {
  //   emit(MorningMeetingLoading());
  //   var result = await morningMeetingRepo.getMorningMeetingData(date);
  //   result.fold((error) {
  //     emit(MorningMeetingFailure(errorMessage: error.msg));
  //   }, (morningMeetingList) {
  //     // Process the morningMeetingList to extract FactoryEntity and CustomerDispatchEntity
  //     List<MorningMeeting> morningMeetingTwoDays = morningMeetingList
  //         .where((m) =>
  //             m.date == date || m.date == date.add(const Duration(days: -1)))
  //         .toList();
  //     List<MorningMeeting> sumationList = morningMeetingList
  //         .where(
  //             (m) => m.date?.month == date.month && m.date?.year == date.year)
  //         .toList();
  //     List<FactoryEntity> factoryEntities = morningMeetingTwoDays
  //         .map((meeting) => FactoryEntity(
  //               date: meeting.date.toString(),
  //               bags: meeting.factoryDispatchResponse?.localBags?.toDouble(),
  //               bulk: meeting.factoryDispatchResponse?.bulk?.toDouble(),
  //               export: meeting.factoryDispatchResponse?.exports?.toDouble(),
  //               total: meeting.factoryDispatchResponse?.total?.toDouble(),
  //             ))
  //         .toList();
  //     FactoryEntity factoryEntity = FactoryEntity(
  //       date: 'MTD',
  //       bags: sumationList
  //           .map((e) => e.factoryDispatchResponse?.localBags ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       bulk: sumationList
  //           .map((e) => e.factoryDispatchResponse?.bulk ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       export: sumationList
  //           .map((e) => e.factoryDispatchResponse?.exports ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       total: sumationList
  //           .map((e) => e.factoryDispatchResponse?.total ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //     );
  //     factoryEntities.add(factoryEntity);
  //     List<CustomerDispatchEntity> customerDispatchEntities = morningMeetingTwoDays
  //         .map((meeting) => CustomerDispatchEntity(
  //             date: meeting.date.toString(),
  //             bags: meeting.customerDispatchResponse?.totalBags?.toDouble(),
  //             bulk: meeting.customerDispatchResponse?.bulk?.toDouble(),
  //             export: (meeting.customerDispatchResponse?.exportBags
  //                         ?.toDouble() ??
  //                     0) +
  //                 (meeting.customerDispatchResponse?.exportBulk?.toDouble() ??
  //                     0),
  //             total: meeting.customerDispatchResponse?.total?.toDouble(),
  //             wadi: meeting.customerDispatchResponse?.wadie?.toDouble(),
  //             masry: meeting.customerDispatchResponse?.masry?.toDouble(),
  //             expTrading:
  //                 meeting.customerDispatchResponse?.exportTrading?.toDouble(),
  //             totalExport:
  //                 meeting.customerDispatchResponse?.totalExport?.toDouble(),
  //             alltotal: (meeting.customerDispatchResponse?.total?.toDouble() ??
  //                     0) +
  //                 (meeting.customerDispatchResponse?.totalExport?.toDouble() ??
  //                     0),
  //             extra: meeting.customerDispatchResponse?.extra?.toDouble(),
  //             clincker: meeting.customerDispatchResponse?.clinker?.toDouble()))
  //         .toList();
  //     CustomerDispatchEntity customerDispatchEntity = CustomerDispatchEntity(
  //       date: 'MTD',
  //       bags: sumationList
  //           .map((e) => e.customerDispatchResponse?.totalBags ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       bulk: sumationList
  //           .map((e) => e.customerDispatchResponse?.bulk ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       export: sumationList
  //           .map((e) =>
  //               (e.customerDispatchResponse?.exportBags ?? 0) +
  //               (e.customerDispatchResponse?.exportBulk ?? 0))
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       total: sumationList
  //           .map((e) => e.customerDispatchResponse?.total ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       wadi: sumationList
  //           .map((e) => e.customerDispatchResponse?.wadie ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       masry: sumationList
  //           .map((e) => e.customerDispatchResponse?.masry ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       expTrading: sumationList
  //           .map((e) => e.customerDispatchResponse?.exportTrading ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       totalExport: sumationList
  //           .map((e) => e.customerDispatchResponse?.totalExport ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       alltotal: sumationList
  //           .map((e) =>
  //               (e.customerDispatchResponse?.total ?? 0) +
  //               (e.customerDispatchResponse?.totalExport ?? 0))
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       extra: sumationList
  //           .map((e) => e.customerDispatchResponse?.extra ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //       clincker: sumationList
  //           .map((e) => e.customerDispatchResponse?.clinker ?? 0)
  //           .reduce((value, element) => value + element)
  //           .toDouble(),
  //     );
  //     customerDispatchEntities.add(customerDispatchEntity);

  //     emit(MorningMeetingSuccess(
  //         factoryEntity: factoryEntities,
  //         customerDispatchEntity: customerDispatchEntities));
  //   });
  // }
}
