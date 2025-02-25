import 'dart:io';

import 'package:app/src/features/pages/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/register/presentation/register_page.dart';
import 'package:app/src/features/pages/home/presentation/home_page.dart';
import 'package:app/src/features/pages/widgets/custom_input.dart';
import 'package:app/src/features/pages/widgets/snackbar_auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isVisible = false;
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        exit(1);
      },
      child: Scaffold(
        appBar: AppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Bem Vindo de Volta!",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Digite seus dados para fazer login",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomInput(
                  key: const Key("emailInput"),
                  label: "E-mail",
                  hintText: "Digite seu E-mail",
                  controller: _emailController,
                  icon: Icons.mail,
                  obscureText: false,
                  error: "",
                ),
                SizedBox(
                  height: 12,
                ),
                CustomInput(
                  key: const Key("passwordInput"),
                  label: "Senha",
                  hintText: "Digite sua Senha",
                  controller: _passController,
                  icon: isVisible ? Icons.visibility : Icons.visibility_off,
                  obscureText: !isVisible,
                  error: "",
                  visibility: visibility,
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: isCheck,
                      onChanged: (check) {
                        setState(() {
                          isCheck = check!;
                        });
                      },
                      visualDensity: VisualDensity.compact,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      checkColor: Colors.grey.withOpacity(0.5),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      
                    ),
                    Text(
                      "Lembrar Senha",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.black54,
                          ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    InkWell(
                      key: const Key("resetPassword"),
                      onTap: resetPassword,
                      hoverColor: Colors.green,
                      hoverDuration: const Duration(
                        seconds: 2,
                      ),
                      child: Text(
                        "Esqueceu a senha?",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Colors.black54,
                              decoration: TextDecoration.underline,
                            ),
                        selectionColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () => loginPage(_emailController.text, _passController.text),
                  child: Text(
                    "Fazer Login",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Divider(
                        color: Colors.grey,
                        endIndent: 10,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "ou",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Expanded(
                      flex: 1,
                      child: Divider(
                        indent: 10,
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      42,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: register,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/google.png"),
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Login com Google",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      42,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: register,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/images/facebook.png"),
                        height: 18,
                        width: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Login com Facebook",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ainda não tem cadastro? ",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    InkWell(
                      onTap: register,
                      child: Text(
                        "Cadastre-se Agora",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    )
                  ],
                ),
              ],
            ),
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

  loginPage(String email, String password) async {
    if (email != "" && password != "") {
      await Provider.of<UserProvider>(context, listen: false)
          .auth(email, password);

      if (await Provider.of<UserProvider>(context, listen: false).status ==
          "failed") {
        CustomSnackBar(context: context).showError(
          await Provider.of<UserProvider>(context, listen: false).error,
        );
      } else {
        home();
      }
    } else {
      CustomSnackBar(context: context)
          .showError("Preencha corretamente todos os campos.");
    }
  }

  Future resetPassword() async {
    if (_emailController.text != "" && _emailController.text.contains("@")) {
      await Provider.of<UserProvider>(context, listen: false)
          .resetPassword(_emailController.text);
      CustomSnackBar(context: context)
          .show("E-mail enviado para alterar sua senha.");
    } else {
      await CustomSnackBar(context: context)
          .showError("Preencha o campo de E-mail para alterar sua senha.");
    }
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

  // void loginPageGoogle() async {
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

  // void loginPageFacebook() async {
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
