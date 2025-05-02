import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sartha/presentation/screens/registration/registration_controller.dart';
import '../../../constants/image_constants.dart';
import '../../themes/app_color.dart';
import '../../themes/custom_text_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_field.dart';

class RegistrationPage extends StatelessWidget {
  final registrationController = Get.put(RegistrationController());

  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        Center(
                          child: Image.asset(
                            AppAssets.logoSquare,
                            width: constraints.maxWidth * 0.4,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Create your Account',
                          style: CustomTextStyle.style(
                            context: context,
                            fontSize: 24,
                            color: AppColor.color93287f,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        CustomTextField(
                          labelText: 'Name',
                          controller: registrationController.nameController,
                          keyboardType: TextInputType.name,
                          errorText:
                              registrationController.nameError.value.isNotEmpty
                                  ? registrationController.nameError.value
                                  : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          labelText: 'Email address',
                          controller: registrationController.emailController,
                          keyboardType: TextInputType.emailAddress,
                          errorText:
                              registrationController.emailError.value.isNotEmpty
                                  ? registrationController.emailError.value
                                  : null,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          labelText: 'Create Password',
                          controller: registrationController.passwordController,
                          obscureText: true,
                          errorText:
                              registrationController
                                      .passwordError
                                      .value
                                      .isNotEmpty
                                  ? registrationController.passwordError.value
                                  : null,
                        ),
                        const SizedBox(height: 16),
                        Obx(
                          () => CustomDropdown<String>(
                            labelText: 'Select Role',
                            value:
                                registrationController
                                        .selectedRole
                                        .value
                                        .isNotEmpty
                                    ? registrationController.selectedRole.value
                                    : null,
                            items:
                                ['Admin', 'User', 'Manager'].map((role) {
                                  return DropdownMenuItem(
                                    value: role,
                                    child: Text(role),
                                  );
                                }).toList(),
                            onChanged: registrationController.selectRole,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          labelText: 'Pin Code',
                          controller: registrationController.pinCodeController,
                          keyboardType: TextInputType.number,
                          errorText:
                              registrationController
                                      .pinCodeError
                                      .value
                                      .isNotEmpty
                                  ? registrationController.pinCodeError.value
                                  : null,
                          maxLength: 6,
                        ),
                        const SizedBox(height: 16),
                        Obx(
                          () => Column(
                            children: [
                              CustomTextField(
                                labelText: 'State',
                                controller: TextEditingController(
                                  text:
                                      registrationController
                                          .stateController
                                          .value,
                                ),
                                enabled: false,
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(
                                labelText: 'City',
                                controller: TextEditingController(
                                  text:
                                      registrationController
                                          .cityController
                                          .value,
                                ),
                                enabled: false,
                              ),
                              if (registrationController.isLoading.value)
                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              if (registrationController.fetchError.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    registrationController.fetchError.value,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          labelText: 'Mobile Number',
                          controller: registrationController.mobileNoController,
                          keyboardType: TextInputType.number,
                          errorText:
                              registrationController
                                      .mobileNoError
                                      .value
                                      .isNotEmpty
                                  ? registrationController.mobileNoError.value
                                  : null,
                          maxLength: 10,
                        ),
                        const SizedBox(height: 24),
                        PrimaryButton(
                          text: 'Register',
                          onPressed: registrationController.validateInputs,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: <Widget>[
                            const Expanded(child: Divider()),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                'Or continue with',
                                style: CustomTextStyle.style(
                                  context: context,
                                  color: AppColor.color59606E,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Expanded(child: Divider()),
                          ],
                        ),
                        const SizedBox(height: 24),
                        SocialButton(
                          imagePath: 'assets/icons/google.png',
                          text: 'Sign up with Google',
                          onPressed: () {},
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: CustomTextStyle.style(
                                context: context,
                                color: AppColor.color59606E,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Login',
                                style: CustomTextStyle.style(
                                  context: context,
                                  fontSize: 15,
                                  color: AppColor.color93287f,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}