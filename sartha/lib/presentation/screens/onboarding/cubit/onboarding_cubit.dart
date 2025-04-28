import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial(index: 0));

  void nextPage(PageController controller) {
    if (state.index < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(OnboardingInitial(index: state.index + 1));
    } else {
      // Last page reached
      emit(OnboardingNavigateToLogin());
    }
  }

  void skipOnboarding() {
    emit(OnboardingNavigateToLogin());
  }

  void onPageChanged(int index) {
    emit(OnboardingInitial(index: index));
  }
}
