import 'package:hive/hive.dart';

part 'tasbeeh_model.g.dart';

@HiveType(typeId: 0)
class TasbeehModel extends HiveObject {
  @HiveField(0)
  String do3a;

  @HiveField(1)
  int current;

  @HiveField(2)
  int round;

  @HiveField(3)
  int total;

  TasbeehModel({
    required this.do3a,
    required this.current,
    required this.round,
    required this.total,
  });
}
