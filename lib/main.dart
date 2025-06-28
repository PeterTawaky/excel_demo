import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/loading_data_cubit.dart';
import 'home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) {
          final cubit = LoadingDataCubit();
          cubit.readExcelFromAssets('assets/tags.xlsx');
          return cubit;
        },
        child: const HomeView(),
      ),
    );
  }
}
