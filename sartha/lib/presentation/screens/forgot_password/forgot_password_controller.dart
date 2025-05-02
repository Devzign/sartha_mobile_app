import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  var emailError = RxnString();

  void validateAndSubmit() {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      emailError.value = 'Email is required';
      return;
    }

    emailError.value = null;

    // Simulate password reset logic
    Get.snackbar(
      'Success',
      'Reset link sent to your email',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
