import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/model/to_do_model.dart';
import 'package:flutter_bloc_example/service/boxes.dart';
import 'package:flutter_bloc_example/views/ToDoAdd/to_do_add.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ToDoAdd(),
                  ));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ValueListenableBuilder<Box<ToDo>>(
        valueListenable: Boxes.getTodo().listenable(),
        builder: (context, box, _) {
          final todo = box.values.toList().cast<ToDo>();
          return Center(child: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(todo[index].title),
                  Text(todo[index].description),
                ],
              );
            },
          ));
        },
      ),
    );
  }

  checkboxx() {
    var box = Hive.isBoxOpen("toDo");
    return box;
  }
}
