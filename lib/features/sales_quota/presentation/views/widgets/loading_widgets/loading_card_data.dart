import 'package:flutter/widgets.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/buttons/loading_btn_when_get.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/loading_widgets/loading_daily_quota.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/loading_widgets/loading_sales_quota_section.dart';

class LoadingCardData extends StatelessWidget {
  const LoadingCardData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              LoadingDailyQuota(),
              SizedBox(height: 25),
              LoadingSalesQuotaSection(),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 25),
              Row(
                children: [
                  LoadingBtnWhenGet(),
                  SizedBox(width: 10),
                  LoadingBtnWhenGet(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
