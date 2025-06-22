import 'package:flutter/material.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/constants/links.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key, this.imageUrl,
  });
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color(0xffF2F6F9),
        border: Border.all(
          color: const Color(0xffE5E5E5),
          width: 1,
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * .3,
        height: MediaQuery.of(context).size.width * .3,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageUrl != null? NetworkImage('$baseUrl$imageUrl'):const AssetImage(personalImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
