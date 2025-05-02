import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sartha/presentation/themes/app_color.dart';
import '../../themes/custom_text_style.dart';
import 'cubit/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<OnboardingCubit, OnboardingState>(
            listener: (context, state) {
              if (state is OnboardingNavigateToLogin) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            child: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                int currentIndex = 0;
                if (state is OnboardingInitial) {
                  currentIndex = state.index;
                }
                return Stack(
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        context.read<OnboardingCubit>().onPageChanged(index);
                      },
                      children: [
                        _buildOnboardingPage(
                          imagePath: 'assets/images/d1.png',
                          title: "Find Your Ideal Medical College",
                          description:
                          "Unlock a world of medical college options tailored to your aspirations and academic profile.",
                          context: context,
                        ),
                        _buildOnboardingPage(
                          imagePath: 'assets/images/d2.png',
                          title: "Compare and Choose Wisely",
                          description:
                          "Effortlessly compare colleges based on crucial factors like fees, location, specializations, and more.",
                          context: context,
                        ),
                        _buildOnboardingPage(
                          imagePath: 'assets/images/d3.png',
                          title: "Get Expert Guidance",
                          description:
                          "Benefit from valuable insights and resources to make informed decisions about your medical education journey.",
                          context: context,
                        ),
                      ],
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.color93287f,
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        child: TextButton(
                          onPressed: () {
                            context.read<OnboardingCubit>().skipOnboarding();
                          },
                          child: Text(
                            'Skip',
                            style: CustomTextStyle.style(
                              context: context,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(currentIndex),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String imagePath,
    required String title,
    required String description,
    required BuildContext context,
  }) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  title,
                  style: CustomTextStyle.style(
                    context: context,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.color93287f,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    description,
                    style: CustomTextStyle.style(
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColor.color3E4B5E,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPageIndicator(int currentIndex) {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      indicators.add(_indicator(currentIndex == i));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColor.color93287f : AppColor.colorE9d5ff,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
