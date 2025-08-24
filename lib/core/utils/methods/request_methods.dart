import 'package:wncc_portal/features/customerService/requests/domain/enums/request_delivery_enum.dart';
import 'package:wncc_portal/features/customerService/requests/domain/enums/request_level_enum.dart';
import 'package:wncc_portal/features/customerService/requests/domain/enums/request_status_enum.dart';

String getRequestLevelText(SupportLevel delivery) {
  switch (delivery) {
    case SupportLevel.critical:
      return 'Critical';
    case SupportLevel.high:
      return 'High';
    case SupportLevel.low:
      return 'Low';
    case SupportLevel.medium:
      return 'Medium';
    case SupportLevel.optional:
      return 'Optional';
  }
}

List<String> getRequestLevelListOfString() {
  List<String> requestLevels = [];
  for (var i = 0; i < SupportLevel.values.length; i++) {
    requestLevels.add(SupportLevel.values[i].name);
  }
  return requestLevels;
}

String getRequestDeliveryText(RequestDelivery delivery) {
  switch (delivery) {
    case RequestDelivery.baniSuiefOffice:
      return 'Bani Suief Office';
    case RequestDelivery.email:
      return 'Email';
    case RequestDelivery.fax:
      return 'Fax';
    case RequestDelivery.fayoumOffice:
      return 'Fayoum Office';
    case RequestDelivery.mainOffice:
      return 'Main Office';
    case RequestDelivery.post:
      return 'Post';
    case RequestDelivery.salesAgent:
      return 'Sales Agent';
  }
}

List<String> getRequestDeliveryListOfString() {
  List<String> deliveryTypes = [];
  for (var i = 0; i < RequestDelivery.values.length; i++) {
    deliveryTypes.add(RequestDelivery.values[i].name);
  }
  return deliveryTypes;
}

String getRequestStatusText(SupportStatus status) {
  switch (status) {
    case SupportStatus.newCreate:
      return 'New';
    case SupportStatus.pending:
      return 'Pending';
    case SupportStatus.approved:
      return 'Approved';
    case SupportStatus.cancelled:
      return 'Cancelled';
    case SupportStatus.completed:
      return 'Completed';
    case SupportStatus.followUp:
      return 'FollowUp';
    case SupportStatus.forwarded:
      return 'Forwarded';
    case SupportStatus.overdue:
      return 'Overdue';
    case SupportStatus.rejected:
      return 'Rejected';
    case SupportStatus.resolved:
      return 'Resolved';
  }
}
