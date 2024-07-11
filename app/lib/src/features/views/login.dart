import 'package:app/src/features/views/home.dart';
import 'package:app/src/features/views/register.dart';
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
                vertical: 20,
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
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 20,
                    ),
                    //Criar custompaint para esse botão
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDDDDD1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
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
