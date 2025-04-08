import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/edit_profile_cubit.dart';

class UeditUprofileScreen extends StatelessWidget {
  const UeditUprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UeditUprofileCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('UeditUprofile')),
        body: const Center(child: Text('UeditUprofile Screen')),
      ),
    );
  }
}
