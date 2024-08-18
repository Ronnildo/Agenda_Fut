import 'package:app/src/features/pages/login.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/custom_input.dart';
import 'package:app/src/features/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Implementar lógica de cadastro
  register() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTitle(),
            CustomInput(
              hintText: "Nome",
              label: "Nome Completo",
              controller: _nameController,
              icon: Icons.person,
              obscureText: false,
            ),
            CustomInput(
              hintText: "exemplo@gmail.com",
              label: "E-mail",
              controller: _emailController,
              icon: Icons.mail,
              obscureText: false,
            ),
            CustomInput(
              label: "Senha",
              hintText: "******",
              controller: _passwordController,
              icon: Icons.visibility,
              obscureText: true,
            ),
            CustomInput(
              label: "Repita a Senha",
              hintText: "******",
              controller: _passwordController,
              icon: Icons.visibility,
              obscureText: true,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButtom(
              onTap: register,
              title: "Cadastrar",
            ),
          ],
        ),
      ),
    );
  }
}
