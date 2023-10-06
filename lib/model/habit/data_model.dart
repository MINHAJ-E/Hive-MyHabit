import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class HabitModel {
  @HiveField(0)
  final String habit;

  @HiveField(1)
  final String note;

  @HiveField(2)
  late bool isDone;

  @HiveField(3)
  int? id;

  HabitModel({required this.habit, required this.note,required this.isDone });
}


