import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'loading_data_state.dart';

class LoadingDataCubit extends Cubit<LoadingDataState> {
  LoadingDataCubit() : super(LoadingDataInitial());
  // List excelData = [];
  Future<List<String>> readExcelFromAssets(String assetPath) async {
    List<String> excelData = [];
    emit(LoadingDataLoading());
    try {
      // Load the Excel file from assets
      ByteData data = await rootBundle.load(assetPath);
      var bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      // Parse the Excel file
      var excel = Excel.decodeBytes(bytes);

      // Get the first sheet (or specify sheet name)
      String sheetName = excel.tables.keys.first;
      var sheet = excel.tables[sheetName];

      if (sheet != null) {
        // Iterate through rows and columns
        for (var row in sheet.rows) {
          for (var cell in row) {
            // Convert cell value to string and add to list
            if (cell?.value != null) {
              excelData.add(cell!.value.toString());
            }
          }
        }
      }
      emit(LoadingDataSuccess(excelData));
    } catch (e) {
      emit(LoadingDataFailed(e.toString()));
      log('Error reading Excel file: $e');
    }

    return excelData;
  }

  continuousReadingExcelData() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      readExcelFromAssets('assets/tag.xlsx');
      log('data read');
    });
  }
}
