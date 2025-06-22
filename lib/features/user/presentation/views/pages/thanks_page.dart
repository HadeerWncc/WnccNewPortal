import 'package:flutter/material.dart';
import 'package:wncc_portal/features/user/presentation/views/widgets/thanks_page_body.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.blueAccent,
        ),
        body: const ThanksPageBody(),
      ),
    );
  }
}
