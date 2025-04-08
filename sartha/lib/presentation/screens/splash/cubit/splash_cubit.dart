import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class UsplashCubit extends Cubit<UsplashState> {
  UsplashCubit() : super(const UsplashInitial());
}
