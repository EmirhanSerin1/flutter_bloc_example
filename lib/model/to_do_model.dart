import 'package:hive/hive.dart';

part 'to_do_model.g.dart';

@HiveType(typeId: 1)
class ToDo {
  @HiveField(0)
  String title;

  @HiveField(1)
  int description;

  ToDo({required this.title, required this.description});
}
