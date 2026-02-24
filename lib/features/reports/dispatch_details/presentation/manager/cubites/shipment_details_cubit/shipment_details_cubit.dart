import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/features/reports/dispatch_details/domain/repo/dispatch_details_repo.dart';

part 'shipment_details_state.dart';

class ShipmentDetailsCubit extends Cubit<ShipmentDetailsState> {
  ShipmentDetailsCubit(this.dispatchDetailsRepo) : super(ShipmentDetailsInitial());

  final DispatchDetailsRepo dispatchDetailsRepo;
}
