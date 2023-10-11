import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class HabitModel {
  @HiveField(0)
  late String habit;

  @HiveField(1)
  late String note;

  // @HiveField(2)
  // late String category;

  // @HiveField(2)
  // late String feedback;

  // @HiveField(2)
  // late bool isDone;

  
  

  @HiveField(3)
  int? id;

  HabitModel({required this.habit, required this.note,
  // required this.feedback
  // required this.category
  // required this.isDone 
  });
}


