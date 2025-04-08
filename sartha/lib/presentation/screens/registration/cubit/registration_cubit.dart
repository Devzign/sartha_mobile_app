import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registration_state.dart';

class UregistrationCubit extends Cubit<UregistrationState> {
  UregistrationCubit() : super(const UregistrationInitial());
}
