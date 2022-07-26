import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/core/constants/paddings/authentication_paddings.dart';
import 'package:flutter_bloc_example/core/constants/reg_exps/reg_exps.dart';
import 'package:flutter_bloc_example/core/constants/text_field_properties/text_field_properties.dart';
import 'package:flutter_bloc_example/core/constants/texts/login_texts.dart';
import 'package:flutter_bloc_example/providers/controllers.dart';
import 'package:provider/provider.dart';


class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = Provider.of<Controllers>(context).emailController;

    return Padding(
      padding: AuthenticationPaddings.mainPadding,
      child: TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return EmailTexts.enterMail;
          }
          if (!AllRegExps.mailReg
              .hasMatch(emailController.text)) {
            return EmailTexts.validMail;
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.mail, color: Theme.of(context).primaryColor),
          contentPadding: AuthenticationPaddings.contentPadding,
          hintText: EmailTexts.hintText,
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
