import 'package:flutter/material.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/welcome_page_body.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WelcomePageBody(),
      ),
    );
  }
}
