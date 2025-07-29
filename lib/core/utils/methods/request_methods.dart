import 'package:wncc_portal/features/requests/domain/enums/request_delivery_enum.dart';
import 'package:wncc_portal/features/requests/domain/enums/request_level_enum.dart';
import 'package:wncc_portal/features/requests/domain/enums/request_status_enum.dart';

String getRequestLevelText(RequestLevel delivery) {
  switch (delivery) {
    case RequestLevel.critical:
      return 'Critical';
    case RequestLevel.high:
      return 'High';
    case RequestLevel.low:
      return 'Low';
    case RequestLevel.medium:
      return 'Medium';
    case RequestLevel.optional:
      return 'Optional';
  }
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

String getRequestStatusText(RequestStatus status) {
  switch (status) {
    case RequestStatus.newCreate:
      return 'New';
    case RequestStatus.pending:
      return 'Pending';
    case RequestStatus.approved:
      return 'Approved';
    case RequestStatus.cancelled:
      return 'Cancelled';
    case RequestStatus.completed:
      return 'Completed';
    case RequestStatus.followUp:
      return 'FollowUp';
    case RequestStatus.forwarded:
      return 'Forwarded';
    case RequestStatus.overdue:
      return 'Overdue';
    case RequestStatus.rejected:
      return 'Rejected';
    case RequestStatus.resolved:
      return 'Resolved';
  }
}
