import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class UloginCubit extends Cubit<UloginState> {
  UloginCubit() : super(const UloginInitial());
}
