import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:wncc_portal/core/widgets/custom_button.dart';
import 'package:wncc_portal/features/authentication/domain/entities/validate_code_entity.dart';
import 'package:wncc_portal/features/authentication/presentation/manager/validate_code_cubit/validate_code_cubit.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/form_heading.dart';
import 'package:wncc_portal/features/authentication/presentation/views/widgets/validation_bloc_consumer.dart';

class ValidationCodeForm extends StatefulWidget {
  const ValidationCodeForm({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<ValidationCodeForm> createState() => _ValidationCodeFormState();
}

class _ValidationCodeFormState extends State<ValidationCodeForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController codeController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width * .3;
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FormHeading(
            title: 'Verigication code',
            subTitle: 'Enter the code sent to your email.',
          ),
          const SizedBox(
            height: 30,
          ),
          // CustomTextFormField(
          //   textController: codeController,
          //   hintText: "Code",
          // ),
          OtpTextField(
            numberOfFields: 6,
            showFieldAsBox: true,
            onSubmit: (value) {
              codeController.text = value;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: btnWidth,
                child: ValidationBlocConsumer(
                  validation: validation,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: btnWidth,
                child: CustomButton(
                  contant: "Cancel",
                  color: const Color(0xfff9f9f9),
                  textColor: Colors.black,
                  fontSize: 14,
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void validation(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await context.read<ValidateCodeCubit>().validateCode(
            ValidateCodeEntity(
              email: widget.email,
              code: codeController.text,
            ),
          );
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
