import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/core/constants/paddings/authentication_paddings.dart';
import 'package:flutter_bloc_example/core/constants/text_field_properties/text_field_properties.dart';
import 'package:flutter_bloc_example/core/constants/texts/register_texts.dart';
import 'package:flutter_bloc_example/providers/controllers.dart';
import 'package:provider/provider.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerRePasswordController =
        Provider.of<Controllers>(context).registerRePasswordController;

    return Padding(
      padding: AuthenticationPaddings.mainPadding,
      child: TextFormField(
        obscureText: true,
        autofocus: false,
        controller: registerRePasswordController,
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (registerRePasswordController.text != registerRePasswordController.text) {
            return ConfirmPasswordTexts.isMatch;
          }else if(registerRePasswordController.text.isEmpty){
            return ConfirmPasswordTexts.emptyText;
          }
          return null;
        },
        onSaved: (value) {
          registerRePasswordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration:InputDecoration(
          prefixIcon: Icon(
            Icons.key_outlined,
            color: Theme.of(context).primaryColor,
          ),
          contentPadding: AuthenticationPaddings.contentPadding,
          hintText: ConfirmPasswordTexts.hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).bottomAppBarColor),
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
    );
  }
}
