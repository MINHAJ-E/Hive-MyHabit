import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class HabitModel {
  @HiveField(0)
  final String habit;

  @HiveField(1)
  final String note;


  @HiveField(2)
  late bool taskcomplete;

 
 @HiveField(3)
 String lastUpdatedDate;


  @HiveField(4)
  int? id;


  HabitModel({
  required this.habit, 
  required this.note,
  required this.taskcomplete,
  required this.lastUpdatedDate ,
  });

}


