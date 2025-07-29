import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/links.dart';
import 'package:wncc_portal/core/models/user_model.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_image_action_box.dart';
import 'package:wncc_portal/features/home/presentation/views/widgets/custom_text_ation_box.dart';

class CustomActionBox extends StatelessWidget {
  const CustomActionBox({
    super.key,
    required this.user,
  });
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CustomTextActionBox(
            name: user.fullName!.split(' ')[0],
            position: user.position ?? "",
          ),
          const SizedBox(width: 10),
          CustomImageActionBox(
            image: "$baseUrl${user.imageUrl}",
          ),
        ],
      ),
    );
  }
}
