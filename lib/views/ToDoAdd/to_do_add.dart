import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/core/constants/paddings/authentication_paddings.dart';
import 'package:flutter_bloc_example/core/constants/text_field_properties/text_field_properties.dart';

class ToDoAdd extends StatefulWidget {
  const ToDoAdd({Key? key}) : super(key: key);

  @override
  State<ToDoAdd> createState() => _ToDoAddState();
}

class _ToDoAddState extends State<ToDoAdd> {

@override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController title = TextEditingController();
    final TextEditingController description = TextEditingController();
    

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: AuthenticationPaddings.mainPadding,
            child: TextFormField(
              autofocus: false,
              controller: title,
              onSaved: (value) {
                title.text = value!;
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
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
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
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  borderRadius: TextFieldProperties.enabledBorderRadius,
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Bassss")),
        ],
      ),
    );
  }
}
