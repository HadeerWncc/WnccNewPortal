import 'package:wncc_portal/features/home/data/models/home/quota.summary.model.dart';
import 'package:wncc_portal/features/reports/dispatch_details_2.dart/data/models/core_models/dispatch_details_quantity.dart';

Quota mergeQuotas(List<Quota> values) {
  return Quota(
    delivery: DispatchDetailsQuantity(
      bags: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.delivery?.bags ?? 0),
      ),
      bulk: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.delivery?.bulk ?? 0),
      ),
      total: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.delivery?.total ?? 0),
      ),
    ),
    pickup: DispatchDetailsQuantity(
      bags: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.pickup?.bags ?? 0),
      ),
      bulk: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.pickup?.bulk ?? 0),
      ),
      total: values.fold(
        0,
        (s, e) => (s ?? 0) + (e.pickup?.total ?? 0),
      ),
    ),
  );
}

num mergeNums(List<num> values) {
  return values.fold(
    0,
    (s, e) => (s) + (e),
  );
}
