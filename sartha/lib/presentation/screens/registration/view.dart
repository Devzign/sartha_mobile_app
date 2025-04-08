import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/registration_cubit.dart';

class UregistrationScreen extends StatelessWidget {
  const UregistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UregistrationCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Uregistration')),
        body: const Center(child: Text('Uregistration Screen')),
      ),
    );
  }
}
