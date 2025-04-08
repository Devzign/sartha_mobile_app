import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'side_menu_state.dart';

class UsideUmenuCubit extends Cubit<UsideUmenuState> {
  UsideUmenuCubit() : super(const UsideUmenuInitial());
}
