// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/appbar/loading_action_box.dart';

class CustomImageActionBox extends StatelessWidget {
  const CustomImageActionBox({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image);
    // return CachedNetworkImage(
    //   width: MediaQuery.of(context).size.width * .08,
    //   imageUrl: image,
    //   imageBuilder: (context, imageProvider) => Container(
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(50),
    //       image: DecorationImage(
    //         image: imageProvider,
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   ),
    //   placeholder: (context, url) => const LoadingAppbarImage(),
    //   errorWidget: (context, url, error) => const Icon(Icons.error),
    // );
  }
}
