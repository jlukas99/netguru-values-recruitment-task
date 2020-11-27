import 'package:hive/hive.dart';

part 'value.g.dart';

@HiveType(typeId: 0)
class ValueModel {
  @HiveField(0)
  final String text;

  @HiveField(1)
  bool isFavorite;

  ValueModel(this.text, {this.isFavorite = false});
}
