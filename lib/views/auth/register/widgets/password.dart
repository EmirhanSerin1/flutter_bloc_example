import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/core/constants/paddings/authentication_paddings.dart';
import 'package:flutter_bloc_example/core/constants/reg_exps/reg_exps.dart';
import 'package:flutter_bloc_example/core/constants/text_field_properties/text_field_properties.dart';
import 'package:flutter_bloc_example/core/constants/texts/register_texts.dart';
import 'package:flutter_bloc_example/providers/controllers.dart';
import 'package:provider/provider.dart';


class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerPasswordController =
        Provider.of<Controllers>(context).registerPasswordController;

    return Padding(
      padding: AuthenticationPaddings.mainPadding,
      child: TextFormField(
        obscureText: true,
        autofocus: false,
        controller: registerPasswordController,
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value!.isEmpty) {
            return RePasswordTexts.emptyText;
          }
          if (!AllRegExps.password.hasMatch(value)) {
            return RePasswordTexts.isValidText;
          }
          return null;
        },
        onSaved: (value) {
          registerPasswordController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.key_outlined,
            color: Theme.of(context).primaryColor,
          ),
          contentPadding: AuthenticationPaddings.contentPadding,
          hintText: RePasswordTexts.hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).bottomAppBarColor),
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
    );
  }
}
