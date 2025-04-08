import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/institutes_cubit.dart';

class UinstitutesScreen extends StatelessWidget {
  const UinstitutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UinstitutesCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Uinstitutes')),
        body: const Center(child: Text('Uinstitutes Screen')),
      ),
    );
  }
}
