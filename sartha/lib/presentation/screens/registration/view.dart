import 'package:flutter/material.dart';
import '../../../constants/image_constants.dart';
import '../../themes/app_color.dart';
import '../../themes/custom_text_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? nameError;
  String? emailError;
  String? passwordError;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      if (nameError != null && _nameController.text.isNotEmpty) {
        setState(() {
          nameError = null;
        });
      }
    });
    _emailController.addListener(() {
      if (emailError != null && _emailController.text.isNotEmpty) {
        setState(() {
          emailError = null;
        });
      }
    });
    _passwordController.addListener(() {
      if (passwordError != null && _passwordController.text.length >= 6) {
        setState(() {
          passwordError = null;
        });
      }
    });
  }

  void _validateInputs() {
    setState(() {
      nameError = _nameController.text.isEmpty ? 'Name is required' : null;
      emailError = _emailController.text.isEmpty ? 'Email is required' : null;
      passwordError = _passwordController.text.length < 6
          ? 'Password must be at least 6 characters'
          : null;
    });

    if (nameError == null && emailError == null && passwordError == null) {
      // Proceed with registration logic
      print('Registration successful!'); // Placeholder
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.color59606E), // Optional: for back button
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        AppAssets.logoSquare,
                        width: constraints.maxWidth * 0.4, // Slightly smaller for registration
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      labelText: 'Name',
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      errorText: nameError,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      labelText: 'Email address',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      errorText: emailError,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      labelText: 'Create Password',
                      controller: _passwordController,
                      obscureText: true,
                      errorText: passwordError,
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(text: 'Register', onPressed: _validateInputs),
                    const SizedBox(height: 24),
                    Row(
                      children: <Widget>[
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                            // Navigate to login page
                            Navigator.pop(context); // Example of navigating back
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
          );
        },
      ),
    );
  }
}