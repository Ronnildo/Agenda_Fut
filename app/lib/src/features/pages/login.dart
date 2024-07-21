import 'package:app/src/features/pages/home.dart';
import 'package:app/src/features/pages/register.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/custom_input.dart';
import 'package:app/src/features/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // Implementar validação e autenticação
  login() {
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
      backgroundColor: const Color(0xFFDDDDD1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomTitle(),
            CustomInput(
              labeltext: "Digite seu E-mail",
              controller: _emailController,
              icon: Icons.mail,
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              labeltext: "Digite sua Senha",
              controller: _passController,
              icon: Icons.visibility,
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {},
                  hoverColor: Colors.green,
                  hoverDuration: const Duration(
                    seconds: 2,
                  ),
                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 16,
              ),
              child: CustomButtom(
                onTap: login,
                title: "Entrar",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Não tem uma Conta?",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 40.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width,
                          56,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: register,
                      child: const Text(
                        "Cadastre-se Agora",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.mail_outlined,
                        size: 60,
                      ),
                      Icon(
                        Icons.facebook,
                        size: 60,
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
