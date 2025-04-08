import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/splash_cubit.dart';

class UsplashScreen extends StatelessWidget {
  const UsplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsplashCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Usplash')),
        body: const Center(child: Text('Usplash Screen')),
      ),
    );
  }
}
