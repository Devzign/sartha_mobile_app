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
                    const SizedBox(height: 20),
                    Center(
                      child: Image.asset(
                        AppAssets.logoSquare,
                        width:
                            constraints.maxWidth *
                            0.5,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Login here',
                      style: CustomTextStyle.style(
                        context: context,
                        fontSize: 24,
                        color: AppColor.color93287f,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Welcome back you've\nbeen missed!",
                      style: CustomTextStyle.style(
                        context: context,
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgotPassword');
                          },
                          child: Text(
                            'Forgot your password?',
                            style: CustomTextStyle.style(
                              context: context,
                              fontSize: 14,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account? ",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Register',
                            style: CustomTextStyle.style(
                              context: context,
                              fontSize: 14,
                              color: AppColor.color93287f,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    SocialButton(
                      imagePath: 'assets/icons/google.png',
                      text: 'Sign In Using Google Account',
                      onPressed: () {},
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
