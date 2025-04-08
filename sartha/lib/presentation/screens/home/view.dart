import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/home_cubit.dart';

class UhomeScreen extends StatelessWidget {
  const UhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UhomeCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Uhome')),
        body: const Center(child: Text('Uhome Screen')),
      ),
    );
  }
}
