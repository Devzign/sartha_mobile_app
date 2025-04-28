part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  int get index => 0;

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {
  final int index;

  const OnboardingInitial({required this.index});

  @override
  List<Object> get props => [index];
}

class OnboardingNavigateToLogin extends OnboardingState {}
