// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/home/home_page.dart';
import 'package:app/src/features/pages/auth/register_page.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/custom_input.dart';
import 'package:app/src/features/widgets/custom_title.dart';
import 'package:app/src/features/widgets/snackbar_auth.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(didPop){
          return;
        }
        exit(1);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTitle(
                heightdiv: 2.5,
              ),
              CustomInput(
                label: "E-mail",
                hintText: "Digite seu E-mail",
                controller: _emailController,
                icon: Icons.mail,
                obscureText: false,
                error: "",
              ),
              CustomInput(
                label: "Senha",
                hintText: "Digite sua Senha",
                controller: _passController,
                icon: isVisible ? Icons.visibility : Icons.visibility_off,
                obscureText: !isVisible,
                error: "",
                visibility: visibility,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  bottom: 30,
                  top: 0,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: resetPassword,
                    hoverColor: Colors.green,
                    hoverDuration: const Duration(
                      seconds: 2,
                    ),
                    child: Text(
                      "Esqueceu a senha?",
                      style: Theme.of(context).textTheme.bodySmall,
                      selectionColor: Colors.blue,
                    ),
                  ),
                ),
              ),
              CustomButtom(
                onTap: () => login(
                  _emailController.text,
                  _passController.text,
                ),
                title: "Entrar",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Não tem uma Conta?",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width,
                          56,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: register,
                      child: Text(
                        "Cadastre-se Agora",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  visibility() {
    if (isVisible) {
      setState(() {
        isVisible = false;
      });
    } else {
      setState(() {
        isVisible = true;
      });
    }
  }

  login(String email, String password) async {
    if (email != "" && password != "") {
      await Provider.of<UserProvider>(context, listen: false)
          .auth(email, password);

      if (await Provider.of<UserProvider>(context, listen: false).status ==
          "failed") {
        CustomSnackBar().showError(context,
            await Provider.of<UserProvider>(context, listen: false).error);
      } else {
        home();
      }
    } else {
      CustomSnackBar().showError(
          context, "Campos vazios, preencha corretamente todos os campos.");
    }
  }

  Future resetPassword() async {
    if (_emailController.text != "") {
      await Provider.of<UserProvider>(context, listen: false)
          .resetPassword(_emailController.text);
    }
    return;
  }

  home() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
    clear();
  }

  register() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Register(),
      ),
    );
  }

  clear() {
    setState(() {
      _emailController.clear();
      _passController.clear();
    });
  }

  // void loginGoogle() async {
  //   await Provider.of<UserProvider>(context, listen: false).signInWithGoogle();
  //   // if (await Provider.of<UserProvider>(context, listen: false).status == "sucess") {
  //   //   home();
  //   // }else{
  //   //   SnackBar(
  //   //     content: Text(
  //   //       Provider.of<UserProvider>(context, listen: false).error,
  //   //       style: Theme.of(context).textTheme.displayMedium,
  //   //     ),
  //   //     backgroundColor: Theme.of(context).colorScheme.error,
  //   //     duration: const Duration(seconds: 2),
  //   //   );
  //   // }
  // }

  // void loginFacebook() async {
  //   await Provider.of<UserProvider>(context, listen: false)
  //       .signInWithFacebook();
  //   if (Provider.of<UserProvider>(context, listen: false).status == "failed") {
  //     SnackBar(
  //       content: Text(
  //         Provider.of<UserProvider>(context, listen: false).error,
  //         style: Theme.of(context).textTheme.displayMedium,
  //       ),
  //       backgroundColor: Theme.of(context).colorScheme.error,
  //       duration: const Duration(seconds: 2),
  //     );
  //   }else{
  //     home();
  //   }
  // }

  // autenticação
}
