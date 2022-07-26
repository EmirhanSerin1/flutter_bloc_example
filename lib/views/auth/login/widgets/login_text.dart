import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/core/constants/texts/login_texts.dart';

class LoginText extends StatelessWidget {
  const LoginText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      LoginTexts.logIn,
      style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
    );
  }
}
