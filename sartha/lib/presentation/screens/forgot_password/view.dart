import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../themes/app_bar.dart';
import '../../themes/app_color.dart';
import '../../themes/custom_text_style.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';
import 'forgot_password_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Forgot Password'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Text(
              'Reset your password',
              style: CustomTextStyle.style(
                context: context,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColor.color93287f,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Enter your email address below and we’ll send you a link to reset your password.',
              style: CustomTextStyle.style(
                context: context,
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Obx(() => CustomTextField(
              labelText: 'Email address',
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              errorText: controller.emailError.value,
            )),
            const SizedBox(height: 24),
            PrimaryButton(text: 'Send Reset Link', onPressed: controller.validateAndSubmit),
          ],
        ),
      ),
    );
  }
}
