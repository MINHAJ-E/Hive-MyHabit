import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class TaskModel {
  @HiveField(1)
  final String task;

  @HiveField(2)
  final String note2;
  
  @HiveField(3)
  int? id;
  
  TaskModel({required this.task, required this.note2});
}
