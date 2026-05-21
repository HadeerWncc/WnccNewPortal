import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/core/utils/methods/show_snakbar.dart';
import 'package:wncc_portal/core/widgets/custom_placeholder_input.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/edit_dispatcher_name_cubit/edit_dispatcher_name_cubit.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/managers/cubits/get_agents_cubit/get_agents_cubit.dart';

class AgentTable extends StatefulWidget {
  const AgentTable({
    super.key,
    this.onSelector,
  });
  final Function(List<String> dispatchers)? onSelector;
  @override
  State<AgentTable> createState() => _AgentTableState();
}

class _AgentTableState extends State<AgentTable> {
  // List<String> agentsArray = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAgentsCubit, GetAgentsState>(
      builder: (context, state) {
        if (state is GetAgentsSuccess) {
          Map<String, TextEditingController> agentController = {
            for (var e in state.agents)
              e.id: TextEditingController(text: e.agentName),
          };
          return SingleChildScrollView(
            child: DataTable(
              showBottomBorder: true,
              showCheckboxColumn: true,
              horizontalMargin: 20,
              columnSpacing: 5,
              border: const TableBorder.symmetric(
                inside: BorderSide(
                  color: Color.fromARGB(255, 186, 186, 186),
                ),
                outside: BorderSide(
                  color: Color.fromARGB(255, 186, 186, 186),
                ),
              ),
              onSelectAll: (value) {
                setState(() {
                  for (var agent in state.agents) {
                    agent.isSelected = value ?? false;
                  }
                });
                widget.onSelector?.call(state.agents
                    .map(
                      (e) => e.id,
                    )
                    .toList());
              },
              columns: const [
                DataColumn(
                  label: Text(
                    'Dispatcher',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Update',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
              rows: state.agents.map((agent) {
                return DataRow(
                  selected: agent.isSelected ?? false,
                  onSelectChanged: (value) {
                    setState(() {
                      agent.isSelected = value;
                    });
                    widget.onSelector?.call(state.agents
                        .where((e) => e.isSelected == true)
                        .map(
                          (e) => e.id,
                        )
                        .toList());
                  },
                  cells: [
                    DataCell(agent.enableEdit
                        ? CustomPlaceholderInput(
                            width: 100,
                            labelText: '',
                            fontSize: 12,
                            controller: agentController[agent.id],
                            onChanged: (value) {},
                          )
                        : Text(agent.agentName)),
                    DataCell(agent.enableEdit
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlocListener<EditDispatcherNameCubit,
                                  EditDispatcherNameState>(
                                listener: (context, state) {
                                  if (state is EditDispatcherNameFailure) {
                                    ShowSnackbar.showSnackBar(
                                        context, state.errorMsg, "F");
                                  } else if (state
                                      is EditDispatcherNameSuccess) {
                                    ShowSnackbar.showSnackBar(
                                        context, state.msg, 'S');
                                    BlocProvider.of<GetAgentsCubit>(context)
                                        .getAgents();
                                  }
                                },
                                child: IconButton(
                                  icon: const Icon(
                                    Symbols.check,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<EditDispatcherNameCubit>(
                                            context)
                                        .editDispatcherName(agent.id,
                                            agentController[agent.id]!.text);
                                  },
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Symbols.close,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    agent.enableEdit = !agent.enableEdit;
                                  });
                                },
                              ),
                            ],
                          )
                        : IconButton(
                            icon: const Icon(
                              Symbols.edit,
                              color: Color.fromARGB(255, 133, 104, 16),
                            ),
                            onPressed: () {
                              setState(() {
                                agent.enableEdit = !agent.enableEdit;
                              });
                            },
                          )),
                  ],
                );
              }).toList(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
