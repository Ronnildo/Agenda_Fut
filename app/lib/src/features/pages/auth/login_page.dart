import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/home/home_page.dart';
import 'package:app/src/features/pages/auth/register_page.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/custom_input.dart';
import 'package:app/src/features/widgets/custom_title.dart';
import 'package:app/src/models/user_model.dart';

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

  // Implementar validação e autenticação
  login(String email, String password, void Function() function) {
    Provider.of<UserProvider>(context, listen: false).auth(
      UserModel(
        email: email,
        password: password,
      ),
      function,
    );
  }

  home() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  register() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Register(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomTitle(
              heightdiv: 2.8,
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
              icon: Icons.visibility,
              obscureText: true,
              error: "",
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
                  onTap: () {},
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
            Consumer<UserProvider>(
              builder: (context, value, child) {
                if (!value.isLoading) {
                  return Center(
                    child: Text(
                      value.status == "SingIn" ? "" : value.status,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                } else {
                  return Text(
                    value.error,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                }
              },
            ),
            CustomButtom(
              onTap: () => login(_emailController.text, _passController.text, home),
              title: "Entrar",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 20.0),
                    child: OutlinedButton(
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
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/images/google.png",
                        ),
                        fit: BoxFit.contain,
                        width: 36,
                        height: 36,
                      ),
                      Image(
                        image: AssetImage(
                          "assets/images/facebook.png",
                        ),
                        fit: BoxFit.contain,
                        width: 36,
                        height: 36,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
