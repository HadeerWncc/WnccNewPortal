import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/constants/colors.dart';
import 'package:wncc_portal/core/utils/app_router.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/features/user/presentation/manager/cubits/user_cubit/user_cubit.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.error});
  final String error;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actionsPadding: const EdgeInsets.all(5),
          title: const Text('Error'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                error.split(".")[0],
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              if (error.split(".").length > 1)
                Text(
                  error.split(".")[1],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 6, 6, 6),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const SizedBox(height: 20),
              CustomButton(
                contant: "Try Again",
                color: kBtnColor,
                width: MediaQuery.of(context).size.width * .5,
                onTap: () {
                  BlocProvider.of<UserCubit>(context).getCurrentUser();
                  GoRouter.of(context).go(AppRouter.homePath);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
