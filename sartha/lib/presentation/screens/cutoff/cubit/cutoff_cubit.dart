import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cutoff_state.dart';

class UcutoffCubit extends Cubit<UcutoffState> {
  UcutoffCubit() : super(const UcutoffInitial());
}
