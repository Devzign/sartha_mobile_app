import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/user_profile_cubit.dart';

class UuserUprofileScreen extends StatelessWidget {
  const UuserUprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UuserUprofileCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('UuserUprofile')),
        body: const Center(child: Text('UuserUprofile Screen')),
      ),
    );
  }
}
