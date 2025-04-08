import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/side_menu_cubit.dart';

class UsideUmenuScreen extends StatelessWidget {
  const UsideUmenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsideUmenuCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('UsideUmenu')),
        body: const Center(child: Text('UsideUmenu Screen')),
      ),
    );
  }
}
