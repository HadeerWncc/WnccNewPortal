import 'package:wncc_portal/features/priority/pickup/data/models/pickup_model/pickupility_product.dart';

String getKey(PickupilityProduct o) {
  return "${o.customerId}_${o.salesId}_${o.materialId}";
}
