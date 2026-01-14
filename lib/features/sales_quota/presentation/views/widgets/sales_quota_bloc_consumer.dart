import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/utils/methods/parse_to_int.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/chart_data_entity.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/daily_quota_entity.dart';
import 'package:wncc_portal/features/sales_quota/domain/entities/sales_quota_entity.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/sales_quota_cubit/sales_quota_cubit.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/cubit/set_quota_cubit/set_quota_cubit.dart';
import 'package:wncc_portal/features/sales_quota/presentation/managers/methods/prepare_controllers.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/loading_widgets/loading_sales_quota.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/widgets/sales_quota_success.dart';

class SalesQuotaBlocConsumer extends StatefulWidget {
  const SalesQuotaBlocConsumer({
    super.key,
    required this.currentDate,
  });

  final String currentDate;

  @override
  State<SalesQuotaBlocConsumer> createState() => _SalesQuotaBlocConsumerState();
}

class _SalesQuotaBlocConsumerState extends State<SalesQuotaBlocConsumer> {
  TextEditingController totalQuotaController = TextEditingController(text: '0');
  TextEditingController totalBulkController = TextEditingController();
  TextEditingController totalBagsController = TextEditingController();
  List<Map<String, TextEditingController>> controllers = [];

  dynamic dailyQuotaId = "";
  ChartDataEntity chartBagsData = ChartDataEntity(
    pickup: 0,
    delivery: 0,
    remaining: 100,
  );
  ChartDataEntity chartBulkData = ChartDataEntity(
    pickup: 0,
    delivery: 0,
    remaining: 100,
  );
  ChartDataEntity chartBagsDataPriority = ChartDataEntity(
    pickup: 0,
    delivery: 0,
    remaining: 100,
  );
  ChartDataEntity chartBulkDataPriority = ChartDataEntity(
    pickup: 0,
    delivery: 0,
    remaining: 100,
  );
  ChartDataEntity chartBagsDataDispatch = ChartDataEntity(
    pickup: 0,
    delivery: 0,
    remaining: 100,
  );
  ChartDataEntity chartBulkDataDispatch = ChartDataEntity(
    pickup: 0,
    delivery: 0,
    remaining: 100,
  );
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesQuotaCubit, SalesQuotaState>(
      listener: (context, state) {
        if (state is SalesQuotaSuccess) {
          listenToSuccessState(state);
        }
      },
      builder: (context, state) {
        if (state is SalesQuotaFailure) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state is SalesQuotaSuccess) {
          return SelesQuotaSuccess(
            dailyQuotaModel: state.dailyQuotaModel,
            controllers: controllers,
            totalQuotaController: totalQuotaController,
            totalBulkController: totalBulkController,
            totalBagsController: totalBagsController,
            tryToDistribute: tryToDistribute,
            chartBagsData: chartBagsData,
            chartBagsDataPriority: chartBagsDataPriority,
            chartBulkData: chartBulkData,
            chartBulkDataPriority: chartBulkDataPriority,
            chartDispatchBags: chartBagsDataDispatch,
            chartDispatchBulk: chartBulkDataDispatch,
          );
        }
        return const LoadingSalesQuota();
      },
    );
  }

  void listenToSuccessState(SalesQuotaSuccess state) {
    dailyQuotaId = state.dailyQuotaModel.id;
    totalQuotaController.text = state.dailyQuotaModel.totalQuota.toString();
    totalBulkController.text = state.dailyQuotaModel.totalBulkQuota.toString();
    totalBagsController.text = state.dailyQuotaModel.totalBagsQuota.toString();
    controllers = prepareControllers(state.dailyQuotaModel.salesQuotas!);
    quotaChart(state);
    priorityChart(state);
    dispatchChart(state);
  }

  void priorityChart(SalesQuotaSuccess state) {
    num totalPickupPriorityBags = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.pickupBagsPriority);

    num totalDeliveryPriorityBags = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.deliveryBagsPriority);
    num totalPickupPriorityBulk = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.pickupBulkPriority);

    num totalDeliveryPriorityBulk = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.deliveryBulkPriority);
    num totalBagsPriority = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.totalBagsPriority);

    num totalBulkPriority = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.totalBulkPriority);
    if (totalBagsPriority > 0) {
      chartBagsDataPriority.pickup =
          (totalPickupPriorityBags / totalBagsPriority) * 100;
      chartBagsDataPriority.delivery =
          (totalDeliveryPriorityBags / totalBagsPriority) * 100;
      chartBagsDataPriority.remaining =
          100 - (chartBagsDataPriority.pickup + chartBagsDataPriority.delivery);
    }

    if (totalBulkPriority > 0) {
      chartBulkDataPriority.pickup =
          (totalPickupPriorityBulk / totalBulkPriority) * 100;
      chartBulkDataPriority.delivery =
          (totalDeliveryPriorityBulk / totalBulkPriority) * 100;
      chartBulkDataPriority.remaining =
          100 - (chartBulkDataPriority.pickup + chartBulkDataPriority.delivery);
    }
  }

  void quotaChart(SalesQuotaSuccess state) {
    num totalPickupBags = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.pickupBagsQuota);

    num totalDeliveryBags = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.deliveryBagsQuota);

    num totalPickupBulk = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.pickupBulkQuota);

    num totalDeliveryBulk = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.deliveryBulkQuota);

    if (state.dailyQuotaModel.totalBagsQuota > 0) {
      chartBagsData.pickup =
          (totalPickupBags / state.dailyQuotaModel.totalBagsQuota) * 100;
      chartBagsData.delivery =
          (totalDeliveryBags / state.dailyQuotaModel.totalBagsQuota) * 100;
      chartBagsData.remaining =
          100 - (chartBagsData.pickup + chartBagsData.delivery);
    }

    if (state.dailyQuotaModel.totalBulkQuota > 0) {
      chartBulkData.pickup =
          (totalPickupBulk / state.dailyQuotaModel.totalBulkQuota) * 100;
      chartBulkData.delivery =
          (totalDeliveryBulk / state.dailyQuotaModel.totalBulkQuota) * 100;
      chartBulkData.remaining =
          100 - (chartBulkData.pickup + chartBulkData.delivery);
    }
  }

  void dispatchChart(SalesQuotaSuccess state) {
    num totalPickupDispatchBags = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.pickupBagsDispatch);

    num totalDeliveryDispatchBags = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.deliveryBagsDispatch);
    num totalPickupDispatchBulk = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.pickupBulkDispatch);

    num totalDeliveryDispatchBulk = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.deliveryBulkDispatch);
    num totalBagsDispatch = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.totalBagsDispatch);

    num totalBulkDispatch = state.dailyQuotaModel.salesQuotas!
        .fold(0, (sum, item) => sum + item.totalBulkDispatch);
    if (totalBagsDispatch > 0) {
      chartBagsDataDispatch.pickup =
          (totalPickupDispatchBags / totalBagsDispatch) * 100;
      chartBagsDataDispatch.delivery =
          (totalDeliveryDispatchBags / totalBagsDispatch) * 100;
      chartBagsDataDispatch.remaining =
          100 - (chartBagsDataDispatch.pickup + chartBagsDataDispatch.delivery);
    }

    if (totalBulkDispatch > 0) {
      chartBulkDataDispatch.pickup =
          (totalPickupDispatchBulk / totalBulkDispatch) * 100;
      chartBulkDataDispatch.delivery =
          (totalDeliveryDispatchBulk / totalBulkDispatch) * 100;
      chartBulkDataDispatch.remaining =
          100 - (chartBulkDataDispatch.pickup + chartBulkDataDispatch.delivery);
    }
  }

  void tryToDistribute(BuildContext context) {
    List<SalesQuotaEntity> salesQuotas = [];
    updateSalesQuotaEntity(salesQuotas);
    DailyQuotaEntity dailyQuotaEntity = DailyQuotaEntity(
      id: dailyQuotaId,
      date: widget.currentDate,
      salesQuotas: salesQuotas,
      totalQuota: parseToInt(totalQuotaController.text),
      totalBulkQuota: parseToInt(totalBulkController.text),
      totalBagsQuota: parseToInt(totalBagsController.text),
    );
    context
        .read<SetQuotaCubit>()
        .distributeDailyQuota(dailyQuotaEntity: dailyQuotaEntity);
  }

  void updateSalesQuotaEntity(List<SalesQuotaEntity> salesQuotas) {
    for (var i = 0; i < controllers.length; i++) {
      SalesQuotaEntity salesQuotaEntity = SalesQuotaEntity(
        salesId: controllers[i]["salesId"]!.text,
        deliveryBagsQuota:
            parseToInt(controllers[i]["deliveryBagsQuota"]!.text),
        deliveryBulkQuota:
            parseToInt(controllers[i]["deliveryBulkQuota"]!.text),
        extraBagsQuota: parseToInt(controllers[i]["extraBagsQuota"]!.text),
        extraBulkQuota: parseToInt(controllers[i]["extraBulkQuota"]!.text),
        pickupBagsQuota: parseToInt(controllers[i]["pickupBagsQuota"]!.text),
        pickupBulkQuota: parseToInt(controllers[i]["pickupBulkQuota"]!.text),
        settelementBagsQuota:
            parseToInt(controllers[i]["settelementBagsQuota"]!.text),
        settelementBulkQuota:
            parseToInt(controllers[i]["settelementBulkQuota"]!.text),
        totalBagsQuota: parseToInt(controllers[i]["totalBagsQuota"]!.text),
        totalBulkQuota: parseToInt(controllers[i]["totalBulkQuota"]!.text),
        totalQuota: parseToInt(controllers[i]["totalQuota"]!.text),
      );
      salesQuotas.add(salesQuotaEntity);
    }
  }
}
