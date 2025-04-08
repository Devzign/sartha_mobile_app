import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'institutes_state.dart';

class UinstitutesCubit extends Cubit<UinstitutesState> {
  UinstitutesCubit() : super(const UinstitutesInitial());
}
