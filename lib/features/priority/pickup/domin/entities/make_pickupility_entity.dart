import 'package:wncc_portal/features/priority/pickup/domin/entities/pickuplity_item_entity.dart';

class MakePickupilityEntity {
  final List<PickuplityItemEntity> pickuplityItems;
  final int type;
  final DateTime date;

  MakePickupilityEntity({
    required this.pickuplityItems,
    required this.type,
    required this.date,
  });
}
