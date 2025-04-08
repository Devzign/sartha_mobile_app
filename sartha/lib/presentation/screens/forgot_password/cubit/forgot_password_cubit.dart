import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_state.dart';

class UforgotUpasswordCubit extends Cubit<UforgotUpasswordState> {
  UforgotUpasswordCubit() : super(const UforgotUpasswordInitial());
}
