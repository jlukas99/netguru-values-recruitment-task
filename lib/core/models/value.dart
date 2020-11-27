import 'package:hive/hive.dart';

part 'value.g.dart';

@HiveType(typeId: 0)
class Value {
  @HiveField(0)
  final String value;

  @HiveField(1)
  bool isFavorite;

  Value(this.value, {this.isFavorite});
}
