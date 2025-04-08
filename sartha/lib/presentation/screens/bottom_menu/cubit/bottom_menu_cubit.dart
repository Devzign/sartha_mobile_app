import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_menu_state.dart';

class UbottomUmenuCubit extends Cubit<UbottomUmenuState> {
  UbottomUmenuCubit() : super(const UbottomUmenuInitial());
}
