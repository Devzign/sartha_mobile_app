import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/forgot_password_confirmation_cubit.dart';

class UforgotUpasswordUconfirmationScreen extends StatelessWidget {
  const UforgotUpasswordUconfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UforgotUpasswordUconfirmationCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('UforgotUpasswordUconfirmation')),
        body: const Center(child: Text('UforgotUpasswordUconfirmation Screen')),
      ),
    );
  }
}
