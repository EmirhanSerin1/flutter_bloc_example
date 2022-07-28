import 'package:hive/hive.dart';

part 'to_do_model.g.dart';

@HiveType(typeId: 1)
class ToDo extends HiveObject{
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  ToDo({required this.title, required this.description});



  
}
