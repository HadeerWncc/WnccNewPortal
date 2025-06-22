import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/details_body.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              color: const Color.fromARGB(255, 168, 168, 168),
              height: .3,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 252, 251, 251),
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false,
          actionsPadding: const EdgeInsets.all(5),
          title: const Text(
            'Order Details',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Symbols.close,
                weight: 900,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: const DetailsBody(),
      ),
    );
  }
}
