import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/widgets/custom_marked_color_container.dart';

class LoadingRequestDetailsHeader extends StatelessWidget {
  const LoadingRequestDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: const Column(
          children: [
            Row(
              children: [
                Text(
                  'Payer Request-(            )',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                CustomMarkedColorContainer(
                  title: 'ttesting',
                  color: Color.fromARGB(255, 0, 139, 253),
                  bgColor: Color.fromARGB(255, 223, 236, 248),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Opacity(
                      opacity: .5,
                      child: Text(
                        'Created by:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
