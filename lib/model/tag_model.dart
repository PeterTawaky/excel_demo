import 'package:excel/excel.dart';

class TagModel {
  final String tagName;
  final String type;
  final String address;
  final String access;
  final String acquistion;
  final String description;

  TagModel({
    required this.tagName,
    required this.type,
    required this.address,
    required this.access,
    required this.acquistion,
    required this.description,
  });

  factory TagModel.fromList(List<Data?> data) {
    return TagModel(
      tagName: data[0]?.value.toString() ?? '',
      type: data[1]?.value.toString() ?? '',
      address: data[2]?.value.toString() ?? '',
      access: data[3]?.value.toString() ?? '',
      acquistion: data[4]?.value.toString() ?? '',
      description: data[5]?.value.toString() ?? '',
    );
  }
}
