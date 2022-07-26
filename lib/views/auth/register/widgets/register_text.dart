import 'package:flutter/material.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Register",
      style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white),
    );
  }
}
