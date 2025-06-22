import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DrawerPersonalImage extends StatelessWidget {
  const DrawerPersonalImage({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      height: MediaQuery.of(context).size.width * .2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 223, 223, 223)),
      child: Center(
        child: CachedNetworkImage(
          width: MediaQuery.of(context).size.width * .18,
          height: MediaQuery.of(context).size.width * .18,
          imageUrl: image,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),

        //  Container(
        //   width: MediaQuery.of(context).size.width * .18,
        //   height: MediaQuery.of(context).size.width * .18,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(50),
        //     image: DecorationImage(
        //       image: image,
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
