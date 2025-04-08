import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'help_state.dart';

class UhelpCubit extends Cubit<UhelpState> {
  UhelpCubit() : super(const UhelpInitial());
}
