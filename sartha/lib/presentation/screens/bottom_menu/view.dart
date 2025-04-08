import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/bottom_menu_cubit.dart';

class UbottomUmenuScreen extends StatelessWidget {
  const UbottomUmenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UbottomUmenuCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('UbottomUmenu')),
        body: const Center(child: Text('UbottomUmenu Screen')),
      ),
    );
  }
}
