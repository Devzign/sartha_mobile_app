import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class UhomeCubit extends Cubit<UhomeState> {
  UhomeCubit() : super(const UhomeInitial());
}
