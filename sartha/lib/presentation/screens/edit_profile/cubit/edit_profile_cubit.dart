import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_profile_state.dart';

class UeditUprofileCubit extends Cubit<UeditUprofileState> {
  UeditUprofileCubit() : super(const UeditUprofileInitial());
}
