import 'package:flutter/material.dart';
import '../../../constants/image_constants.dart';
import '../../themes/app_color.dart';
import '../../themes/custom_text_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  @override
  void initState() {
    super.initState();

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
      emailError = _emailController.text.isEmpty ? 'Email is required' : null;
      passwordError =
          _passwordController.text.length < 6
              ? 'Password must be at least 6 characters'
              : null;
    });

    if (emailError == null && passwordError == null) {
      // Proceed with login logic
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Handle Image Responsively
                    Center(
                      child: Image.asset(
                        AppAssets.logoSquare,
                        width:
                            constraints.maxWidth *
                            0.6, // Adjust ratio as needed
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 30),
                    CustomTextField(
                      labelText: 'Email address',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      errorText: emailError,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      labelText: 'Password',
                      controller: _passwordController,
                      obscureText: true,
                      errorText: passwordError,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
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
                    const SizedBox(height: 24),
                    PrimaryButton(text: 'Login', onPressed: _validateInputs),
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
                      text: 'Sign In Using Google Account',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to Sartha? ',
                          style: CustomTextStyle.style(
                            context: context,
                            color: AppColor.color59606E,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Register here',
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
