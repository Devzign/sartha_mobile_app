import 'package:flutter/material.dart';
import '../../../constants/image_constants.dart';
import '../../themes/app_color.dart';
import '../../themes/custom_text_style.dart';
import '../../widgets/custom_button.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: AppColor.color93287f,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            AppAssets.logoSquare,
                            height: MediaQuery.of(context).size.height * 0.18,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Wrap(
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Text(
                                'The Ultimate ',
                                style: CustomTextStyle.style(
                                  context: context,
                                  fontSize: 30,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'College Guidance ',
                                style: CustomTextStyle.style(
                                  context: context,
                                  fontSize: 30,
                                  color: AppColor.color93287f,
                                  fontWeight: FontWeight.bold,
                                  underline: true,
                                ),
                              ),
                              Text(
                                'and ',
                                style: CustomTextStyle.style(
                                  context: context,
                                  fontSize: 30,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'Counselling ',
                                style: CustomTextStyle.style(
                                  context: context,
                                  fontSize: 30,
                                  color: AppColor.color93287f,
                                  fontWeight: FontWeight.bold,
                                  underline: true,
                                ),
                              ),
                              Text(
                                'Platform ',
                                style: CustomTextStyle.style(
                                  context: context,
                                  fontSize: 30,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildOptionRow('NEET-UG', context),
                      const SizedBox(height: 10),
                      _buildOptionRow('NEET-PG', context),
                      const SizedBox(height: 10),
                      _buildOptionRow('CUET', context),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: TertiaryButton(
                          text: 'Login',
                          onPressed: () {
                            Navigator.pushNamed(context, '/signIn');
                          },
                          backgroundColor: AppColor.color93287f,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SecondaryButton(
                          text: 'Register',
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          borderColor: AppColor.color93287f,
                          textColor: AppColor.color93287f,
                          borderWidth: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionRow(String text, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset("assets/icons/radio_icon.png", height: 30, width: 30),
        const SizedBox(width: 8),
        Text(
          text,
          style: CustomTextStyle.style(
            context: context,
            fontSize: 24,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
