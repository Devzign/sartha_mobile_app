import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'consuling_plans_state.dart';

class UconsulingUplansCubit extends Cubit<UconsulingUplansState> {
  UconsulingUplansCubit() : super(const UconsulingUplansInitial());
}
