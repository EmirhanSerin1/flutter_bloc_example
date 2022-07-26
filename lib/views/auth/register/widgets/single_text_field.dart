import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_example/core/constants/paddings/authentication_paddings.dart';
import 'package:flutter_bloc_example/core/constants/text_field_properties/text_field_properties.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    Key? key,
    required this.controller,
    required this.regExp,
    required this.icon,
    required this.hintText,
    required this.isEmptyText,
    required this.isValidText,
    required this.keyboardType,
    required this.textInputAction,
    this.maskTextInputFormatter,
  }) : super(key: key);

  final TextEditingController controller;
  final RegExp regExp;
  final IconData icon;
  final String hintText, isEmptyText, isValidText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final MaskTextInputFormatter? maskTextInputFormatter;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: AuthenticationPaddings.mainPadding,
        child: TextFormField(
          inputFormatters: [
            maskTextInputFormatter ??
                FilteringTextInputFormatter.deny(
                  RegExp(r'[/\\]'),
                ),
          ],
          autofocus: false,
          controller: controller,
          keyboardType: keyboardType,
          validator: (value) {
            if (value!.isEmpty) {
              return isEmptyText;
            }
            if (!regExp.hasMatch(value)) {
              return isValidText;
            }
            return null;
          },
          onSaved: (value) {
            controller.text = value!;
            
          },
          textInputAction: textInputAction,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            contentPadding: AuthenticationPaddings.contentPadding,
            hintText: hintText,
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
      ),
    );
  }
}
