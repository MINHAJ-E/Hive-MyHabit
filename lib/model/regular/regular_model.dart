import 'package:hive/hive.dart';
part 'regular_model.g.dart';

@HiveType(typeId:1)
class RegularModel {

  @HiveField(0)
  final String regular;
  
  @HiveField(1)
  final String note;

  @HiveField(2)
  late bool isDone;

  RegularModel({required this.regular,required this.note,required this.isDone});
}