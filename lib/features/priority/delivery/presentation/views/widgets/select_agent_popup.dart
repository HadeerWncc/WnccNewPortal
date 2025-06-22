import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/functions/setup_service_locator.dart';
import 'package:wncc_portal/core/widgets/custom_button_with_icon.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/dispatch_delivery_orders_cubit/dispatch_delivery_order_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_agents_cubit/get_agents_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_all_delivery_cubit/get_all_delivery_cubit.dart';

Future<dynamic> selectAgent(BuildContext context, List<String> selectedOrders) {
  String agent = "";
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<GetAgentsCubit>()..getAgents(),
          ),
          BlocProvider(
            create: (context) => getIt<DispatchDeliveryOrderCubit>(),
          ),
        ],
        child: AlertDialog(
          backgroundColor: Colors.white,
          titlePadding: const EdgeInsets.only(left: 15, top: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Dispatch Order',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: const Icon(
                    Symbols.close,
                    size: 20,
                  )),
            ],
          ),
          content: const Opacity(
            opacity: .6,
            child: Text('Please Select Dispatch Agent'),
          ),
          actions: [
            BlocBuilder<GetAgentsCubit, GetAgentsState>(
              builder: (context, state) {
                if (state is GetAgentsSuccess) {
                  agent = state.agents[0];
                  return CustomDropDownInput(
                    selectedValue: state.agents[0],
                    items: state.agents,
                    title: "Select Agent",
                    onChanged: (value) {
                      agent = value ?? agent;
                    },
                  );
                }
                return const CustomDropDownInput(
                  selectedValue: "",
                  items: [],
                  title: "Select Agent",
                  onChanged: null,
                );
              },
            ),
            const SizedBox(height: 20),
            BlocConsumer<DispatchDeliveryOrderCubit,
                DispatchDeliveryOrderState>(
              listener: (context, state) {
                if (state is DispatchDeliveryOrderSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.msg),
                    ),
                  );
                  context.read<GetAllDeliveryCubit>().getAllDeliveryPriorty();
                  GoRouter.of(context).pop();
                } else if (state is DispatchDeliveryOrderFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is DispatchDeliveryOrderLoading) {
                  return const CustomButtonWithIcon(
                    child: "Loading",
                    textColor: Color.fromARGB(255, 255, 200, 3),
                    bgColor: Color(0xffFFFAE7),
                    icon: Symbols.progress_activity,
                    onHoverColor: Color.fromARGB(255, 247, 218, 113),
                    onTap: null,
                  );
                }
                return CustomButtonWithIcon(
                  child: "Dispatch",
                  textColor: Colors.white,
                  bgColor: kBtnColor,
                  icon: Symbols.done_all,
                  onHoverColor: const Color.fromARGB(255, 3, 72, 151),
                  onTap: () async {
                    await BlocProvider.of<DispatchDeliveryOrderCubit>(context)
                        .dispatchDeliveryOrders(selectedOrders, agent);
                  },
                );
              },
            )
          ],
        ),
      );
    },
  );
}
