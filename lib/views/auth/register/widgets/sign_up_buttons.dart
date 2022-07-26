// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/core/constants/paddings/authentication_paddings.dart';
import 'package:flutter_bloc_example/providers/controllers.dart';
import 'package:flutter_bloc_example/providers/keys.dart';
import 'package:flutter_bloc_example/views/auth/login/login.dart';
import 'package:provider/provider.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final emailController =
        Provider.of<Controllers>(context).registerEmailController;
    final passwordController =
        Provider.of<Controllers>(context).registerPasswordController;
    final firstName = Provider.of<Controllers>(context).firstNameController;
    final secondName = Provider.of<Controllers>(context).secondNameController;
    final registerFormKey = Provider.of<FormKeys>(context).registerFormKey;
    return InkWell(
      onTap: () async {
        if (registerFormKey.currentState!.validate()) {
          signUP(
            emailController.text.trim(),
            passwordController.text,
            registerFormKey,
            firstName,
            secondName,
            auth,
            context
          );
        }
      },
      child: Container(
        padding: AuthenticationPaddings.contentPadding,
        margin: AuthenticationPaddings.mainPadding,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor.withOpacity(0.8),
        ),
        child: Center(
            child: Text("Sign Up",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w500))),
      ),
    );
  }

  Future<void> signUP(
    String email,
    password,
    GlobalKey<FormState> registerFormKey,
    TextEditingController firstName,
    TextEditingController secondName,
    FirebaseAuth auth,
    BuildContext context,
  ) async {
    if (registerFormKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await userCredential.user?.updateDisplayName(
          // ignore: prefer_interpolation_to_compose_strings
          firstName.text.trim() + " " + secondName.text.trim(),
        );

        await userCredential.user
            ?.updatePhotoURL("https://randomuser.me/api/portraits/men/75.jpg");

        // await sendDetailsToFirestore();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          debugPrint('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          debugPrint('The account already exists for that email.');
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
