import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/forgot_password_cubit.dart';

class UforgotUpasswordScreen extends StatelessWidget {
  const UforgotUpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UforgotUpasswordCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('UforgotUpassword')),
        body: const Center(child: Text('UforgotUpassword Screen')),
      ),
    );
  }
}
