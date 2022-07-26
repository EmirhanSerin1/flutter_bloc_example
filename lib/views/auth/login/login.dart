import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/providers/controllers.dart';
import 'package:flutter_bloc_example/providers/keys.dart';
import 'package:flutter_bloc_example/views/auth/login/widgets/login_button.dart';
import 'package:flutter_bloc_example/views/auth/login/widgets/login_email_text_field.dart';
import 'package:flutter_bloc_example/views/auth/login/widgets/login_password_text_field.dart';
import 'package:flutter_bloc_example/views/auth/login/widgets/login_text.dart';
import 'package:flutter_bloc_example/views/auth/login/widgets/register_part.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final loginFormKey = Provider.of<FormKeys>(context).loginFormKey;
    final emailController = Provider.of<Controllers>(context).emailController;
    final passwwordController =
        Provider.of<Controllers>(context).passwordController;

    return WillPopScope(
      onWillPop: () async {
        FocusScope.of(context).unfocus();
        emailController.clear();
        passwwordController.clear();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Form(
            key: loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                const LoginText(),
                Column(
                  children: [
                    const LoginEmailTextField(),
                    const PasswordTextField(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CheckboxListTile(
                        title: const Text("Remember me"),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                          debugPrint(isChecked.toString());
                        },
                      ),
                    ),
                    const LoginButton(),
                  ],
                ),
                const RegisterPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
