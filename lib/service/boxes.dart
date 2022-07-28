import 'package:flutter_bloc_example/model/to_do_model.dart';
import 'package:hive/hive.dart';

class Boxes{
  static Box<ToDo> getTodo() => Hive.box<ToDo>("toDo");
}