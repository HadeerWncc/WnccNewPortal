import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/utils/app_router.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key, required this.pageIndex});
  final int pageIndex;
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  Color mainColor = const Color.fromARGB(255, 18, 72, 30);
  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.fixedCircle,
      backgroundColor: const Color(0xffF7F7FC),
      color: const Color.fromARGB(255, 0, 0, 0),
      activeColor: const Color(0xff008855),
      shadowColor: mainColor,
      items: const [
        TabItem(
          icon: Icon(Icons.format_list_bulleted_sharp, weight: 900),
          title: 'To_Do',
          isIconBlend: true,
        ),
        TabItem(
          icon: Icon(
            Icons.home_sharp,
            size: 35,
          ),
          title: 'Home',
          isIconBlend: true,
        ),
        TabItem(
          icon: Icon(Icons.notifications_sharp, weight: 900),
          title: 'Notification',
          isIconBlend: true,
        ),
      ],
      initialActiveIndex: widget.pageIndex,
      onTap: (index) {
        if (index == 0) {
          GoRouter.of(context).push(AppRouter.toDoList);
        } else if (index == 1) {
          GoRouter.of(context).push(AppRouter.homePath);
        }
        // else if (index == 2) {
        //   Navigator.pushReplacementNamed(context, '/addTask');
        // }
      },
    );
  }
}
