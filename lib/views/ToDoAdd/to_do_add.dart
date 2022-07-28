import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc_example/core/constants/paddings/authentication_paddings.dart';
import 'package:flutter_bloc_example/core/constants/text_field_properties/text_field_properties.dart';
import 'package:flutter_bloc_example/model/to_do_model.dart';
import 'package:flutter_bloc_example/service/boxes.dart';
import 'package:flutter_bloc_example/views/home/home.dart';
import 'package:hive_flutter/adapters.dart';

class ToDoAdd extends StatelessWidget {
  const ToDoAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController description = TextEditingController();
    final key = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: key,
        child: Column(
          children: [
            Padding(
              padding: AuthenticationPaddings.mainPadding,
              child: TextFormField(
                autofocus: false,
                controller: title,
                onSaved: (value) {
                  title.text = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Email";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.title,
                    color: Theme.of(context).primaryColor,
                  ),
                  contentPadding: AuthenticationPaddings.contentPadding,
                  hintText: "Title",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).errorColor),
                    borderRadius: TextFieldProperties.focusedBorderRadius,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: TextFieldProperties.borderBorderRadius,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: TextFieldProperties.enabledBorderRadius,
                  ),
                ),
              ),
            ),
            Padding(
              padding: AuthenticationPaddings.mainPadding,
              child: TextFormField(
                autofocus: false,
                controller: description,
                onSaved: (value) {
                  title.text = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Email";
                  } else {
                    return null;
                  }
                },
                maxLines: 5,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.description,
                    color: Theme.of(context).primaryColor,
                  ),
                  contentPadding: AuthenticationPaddings.contentPadding,
                  hintText: "Description",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).errorColor),
                    borderRadius: TextFieldProperties.focusedBorderRadius,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: TextFieldProperties.borderBorderRadius,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: TextFieldProperties.enabledBorderRadius,
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  addToDo(title.text, description.text);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text("Bassss")),
          ],
        ),
      ),
    );
  }

  Future addToDo(String title, String description) async {
    ToDo todo = ToDo(title: title, description: description);
    final box = Boxes.getTodo();
    box.add( todo);
  }
}
