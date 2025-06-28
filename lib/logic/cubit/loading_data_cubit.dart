import 'package:bloc/bloc.dart';
import 'package:excel_demo/model/tag_model.dart';
import 'package:excel_demo/service/excel_service.dart';
import 'package:meta/meta.dart';

part 'loading_data_state.dart';

class LoadingDataCubit extends Cubit<LoadingDataState> {
  LoadingDataCubit() : super(LoadingDataInitial());
  // List excelData = [];
  void readExcelFromAssets(String localExcelPath) async {
    emit(LoadingDataLoading());
    try {
      List<TagModel> tags = await ExcelService.readExcelData(
        localExcelPath: localExcelPath,
      );
      emit(LoadingDataSuccess(tags: tags));
    } catch (e) {
      emit(LoadingDataFailed('Error reading Excel file: $e'));
    }
  }
}
