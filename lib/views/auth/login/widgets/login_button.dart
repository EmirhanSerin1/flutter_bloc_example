
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';import 'package:flutter_bloc_example/core/constants/paddings/authentication_paddings.dart';
import 'package:flutter_bloc_example/core/constants/texts/login_texts.dart';
import 'package:flutter_bloc_example/providers/controllers.dart';
import 'package:flutter_bloc_example/providers/keys.dart';

import 'package:flutter_bloc_example/views/home/home.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = Provider.of<Controllers>(context).emailController;
    final passwordController =
        Provider.of<Controllers>(context).passwordController;
    final loginFormKey = Provider.of<FormKeys>(context).loginFormKey;
    return InkWell(
      onTap: () async {
        if (loginFormKey.currentState!.validate()) {
          await login(
              emailController.text.trim(), passwordController.text.trim());

          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
        }
      },
      child: Container(
        padding: AuthenticationPaddings.contentPadding,
        margin: AuthenticationPaddings.mainPadding,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            LoginButtonTexts.login,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      await userCredential.user?.updateEmail(email);
      await userCredential.user?.updatePassword(password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }
}
