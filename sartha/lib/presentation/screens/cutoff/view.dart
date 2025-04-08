import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cutoff_cubit.dart';

class UcutoffScreen extends StatelessWidget {
  const UcutoffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UcutoffCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Ucutoff')),
        body: const Center(child: Text('Ucutoff Screen')),
      ),
    );
  }
}
