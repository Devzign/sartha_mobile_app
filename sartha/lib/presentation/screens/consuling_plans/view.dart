import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/consuling_plans_cubit.dart';

class UconsulingUplansScreen extends StatelessWidget {
  const UconsulingUplansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UconsulingUplansCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('UconsulingUplans')),
        body: const Center(child: Text('UconsulingUplans Screen')),
      ),
    );
  }
}
