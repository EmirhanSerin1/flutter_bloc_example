import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/views/ToDoAdd/to_do_add.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: Container(),
    );
  }
}
