import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/core/components/page_route.dart';
import 'package:flutter_bloc_example/core/constants/paddings/authentication_paddings.dart';
import 'package:flutter_bloc_example/core/constants/texts/login_texts.dart';
import 'package:flutter_bloc_example/views/auth/register/register.dart';

class RegisterPart extends StatelessWidget {
  const RegisterPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AuthenticationPaddings.mainPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DHAAccountPartTexts.dHaveAA,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(createRoute(const Register(), x: 0, y: 1));
              },
              child: Text(
                DHAAccountPartTexts.signUp,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
              ))
        ],
      ),
    );
  }
}
