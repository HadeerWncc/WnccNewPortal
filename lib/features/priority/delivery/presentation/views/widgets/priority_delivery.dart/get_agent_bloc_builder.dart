import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/utils/methods/custom_borders.dart';
import 'package:wncc_portal/core/widgets/custom_drop_down_input.dart';
import 'package:wncc_portal/features/priority/delivery/domain/entities/dispatch_delivery_entity.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_agents_cubit/get_agents_cubit.dart';

class GetAgentBlocBuilder extends StatelessWidget {
  const GetAgentBlocBuilder({
    super.key,
    required this.onChange,
  });
  final Function(DispatchDeliveryEntity? agent) onChange;
  @override
  Widget build(BuildContext context) {
    // DispatchDeliveryEntity? selectedValue;
    return BlocBuilder<GetAgentsCubit, GetAgentsState>(
      builder: (context, state) {
        if (state is GetAgentsSuccess) {
          // state.agents.removeWhere((a) => a == "");
          // state.agents.insert(0, "");
          // selectedValue = state.agents[0];
          return DropdownButtonFormField<DispatchDeliveryEntity>(
            isExpanded: true,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
            decoration: InputDecoration(
              enabledBorder: inputBorder(),
              focusedBorder: customfocusedBorder(),
              fillColor: const Color(0xffF9F9F9),
              filled: true,
            ),
            // value: selectedValue??,
            hint: const Text(
              'Dispatcher',
              style: TextStyle(fontSize: 14),
            ),

            items: [
              const DropdownMenuItem<DispatchDeliveryEntity>(
                enabled: false,
                alignment: AlignmentDirectional.center,
                child: SizedBox(
                    child: Text(
                  "Dispatcher",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              ...state.agents.map((item) {
                return DropdownMenuItem<DispatchDeliveryEntity>(
                  alignment: AlignmentDirectional.centerEnd,
                  value: item,
                  child: SizedBox(
                      child: Text(
                    item.agentName,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis, fontSize: 12),
                  )),
                );
              }),
            ],
            onChanged: (agent) {
              onChange(agent);
            },
          );
        }
        return const CustomDropDownInput(
          selectedValue: null,
          items: [],
          title: "Dispatcher",
        );
      },
    );
  }
}
