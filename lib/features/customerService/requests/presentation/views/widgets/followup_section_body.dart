import 'package:flutter/material.dart';
import 'package:wncc_portal/core/utils/methods/request_methods.dart';
import 'package:wncc_portal/core/widgets/custom_circel_letter_container.dart';
import 'package:wncc_portal/features/customerService/requests/domain/entities/log_entity.dart';
import 'package:wncc_portal/features/customerService/requests/presentation/views/widgets/request_state.dart';

class FollowUpSectionBody extends StatelessWidget {
  const FollowUpSectionBody({
    super.key,
    required this.logs,
  });
  final List<LogEntity> logs;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: logs.isNotEmpty
            ? logs.map((log) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomCircelLetterContainer(
                          letter: log.createdBy!.toUpperCase().characters.first,
                          bgColor: Colors.redAccent,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(log.createdBy!),
                            Opacity(
                              opacity: .5,
                              child: Text(log.createdAt),
                            ),
                          ],
                        ),
                      ],
                    ),
                    RequestTypeStatusWidget(
                      requestTypeStatus: getRequestStatusText(log.changedTo),
                    ),
                  ],
                );
              }).toList()
            : List.empty());
  }
}
