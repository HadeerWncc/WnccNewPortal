import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wncc_portal/core/constants/constants.dart';
import 'package:wncc_portal/core/widgets/loading_widgets/fields/loading_input.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/form_heading.dart';

class LoadingChangePersonalInfo extends StatelessWidget {
  const LoadingChangePersonalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const FormHeading(
                title: 'Personal Information',
                subTitle: 'Change your personal information',
              ),
              const SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * .3,
                height: MediaQuery.of(context).size.width * .3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.grey),
              ),
              const SizedBox(height: 20),
              const LoadingInput(),
              const SizedBox(height: 20),
              const LoadingInput(),
              const SizedBox(height: 20),
              const LoadingInput(),
              const SizedBox(height: 20),
              const LoadingInput(),
            ],
          ),
        ),
      ),
    );
  }
}
