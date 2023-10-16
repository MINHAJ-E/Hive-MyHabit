import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class HabitModel {
  @HiveField(0)
  final String habit;

  @HiveField(1)
  final String note;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final String feedback;

  @HiveField(4)
  late bool taskcomplete;

  @HiveField(5)
  final String startdate;

  @HiveField(6)
  final String enddate;
 
 @HiveField(7)
 final DateTime date;

  @HiveField(8)
  int? id;


  HabitModel({required this.habit, 
  required this.note,
  required this.category,
  required this.feedback,
  required this.taskcomplete,
  required this.startdate,
  required this.enddate,
  required this.date,
  });
}


