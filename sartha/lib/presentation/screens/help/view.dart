import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/help_cubit.dart';

class UhelpScreen extends StatelessWidget {
  const UhelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UhelpCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Uhelp')),
        body: const Center(child: Text('Uhelp Screen')),
      ),
    );
  }
}
