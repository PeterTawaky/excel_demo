import 'package:excel_demo/logic/cubit/loading_data_cubit.dart';
import 'package:excel_demo/service/layout/wrap_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoadingDataCubit, LoadingDataState>(
        builder: (context, state) {
          if (state is LoadingDataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadingDataSuccess) {
            return CustomVerticalList(dataCell: state.data);
          } else if (state is LoadingDataFailed) {
            return Center(child: Text(state.error));
          }
          return Container();
        },
      ),
    );
  }
}
