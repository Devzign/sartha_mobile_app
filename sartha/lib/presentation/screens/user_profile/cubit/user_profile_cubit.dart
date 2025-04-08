import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_profile_state.dart';

class UuserUprofileCubit extends Cubit<UuserUprofileState> {
  UuserUprofileCubit() : super(const UuserUprofileInitial());
}
