import 'package:flutter/material.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/select_startup_routing_body.dart';

class SelectStartupRoutingPage extends StatelessWidget {
  const SelectStartupRoutingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blueAccent,
        ),
        body: const SelectStartupRoutingBody(),
      ),
    );
  }
}
