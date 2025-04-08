import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/login_cubit.dart';

class UloginScreen extends StatelessWidget {
  const UloginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UloginCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Ulogin')),
        body: const Center(child: Text('Ulogin Screen')),
      ),
    );
  }
}
