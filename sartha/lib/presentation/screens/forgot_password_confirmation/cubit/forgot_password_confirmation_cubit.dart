import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_confirmation_state.dart';

class UforgotUpasswordUconfirmationCubit extends Cubit<UforgotUpasswordUconfirmationState> {
  UforgotUpasswordUconfirmationCubit() : super(const UforgotUpasswordUconfirmationInitial());
}
