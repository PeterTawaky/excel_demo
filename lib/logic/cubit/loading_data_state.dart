part of 'loading_data_cubit.dart';

@immutable
sealed class LoadingDataState {}

final class LoadingDataInitial extends LoadingDataState {}

final class LoadingDataLoading extends LoadingDataState {}

final class LoadingDataSuccess extends LoadingDataState {
  final List<TagModel> tags;
  LoadingDataSuccess({required this.tags});
}

final class LoadingDataFailed extends LoadingDataState {
  final String error;
  LoadingDataFailed(this.error);
}
