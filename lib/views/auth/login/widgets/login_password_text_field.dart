import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/providers/controllers.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/paddings/authentication_paddings.dart';
import '../../../../core/constants/reg_exps/reg_exps.dart';
import '../../../../core/constants/text_field_properties/text_field_properties.dart';
import '../../../../core/constants/texts/login_texts.dart';


class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passwordController =
        Provider.of<Controllers>(context).passwordController;

    return Padding(
      padding: AuthenticationPaddings.mainPadding,
      child: TextFormField(
        obscureText: true,
        autofocus: false,
        controller: passwordController,
        validator: (value) {
          RegExp regExp = AllRegExps.password;
          if (value!.isEmpty) {
            return PasswordTexts.enterPassword;
          }
          if (!regExp.hasMatch(value)) {
            return PasswordTexts.validPassword;
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        maxLength: 20,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          counterText: "",
          prefixIcon: Icon(Icons.vpn_key,
              color: Theme.of(context).primaryColor),
          contentPadding: AuthenticationPaddings.contentPadding,
          hintText: PasswordTexts.hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).bottomAppBarColor,
            ),
            borderRadius: TextFieldProperties.focusedBorderRadius,
          ),
          border: OutlineInputBorder(
            borderRadius: TextFieldProperties.borderBorderRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: TextFieldProperties.enabledBorderRadius
          ),
        ),
      ),
    );
  }
}
