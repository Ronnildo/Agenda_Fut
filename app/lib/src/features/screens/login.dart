import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Title
          Placeholder(
            fallbackHeight: MediaQuery.of(context).size.height / 3,
            // fallbackWidth: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Color(0xFF3DB62A),
              ),
              child: const Text("Fut Agenda"),
            ),
          ),
          // Form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Placeholder(
              fallbackHeight: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const TextField(),
                  const TextField(),
                  const Text("Esqueceu a senha?"),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Entrar"),
                  ),
                ],
              ),
            ),
          ),
          Placeholder(
            fallbackHeight: 150,
            fallbackWidth: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const Text("Não tem uma Conta?"),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Cadastre-se Agora!"),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.mail_outlined),
                    Icon(Icons.facebook),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
