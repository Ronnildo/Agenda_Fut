import 'package:app/src/features/screens/login.dart';
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
      backgroundColor: const Color(0xFFDDDDD1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomTitle(),
            const SizedBox(
              height: 10,
            ),
            CustomInput(
              labeltext: "Nome Completo",
              controller: _nameController,
              icon: Icons.person,
              obscureText: false,
            ),
            CustomInput(
              labeltext: "E-mail",
              controller: _emailController,
              icon: Icons.mail,
              obscureText: false,
            ),
            // Implementar DropDown
            CustomInput(
              labeltext: "Tipo de Usuário",
              controller: _userController,
              icon: Icons.info,
              obscureText: false,
            ),
            CustomInput(
              labeltext: "Senha",
              controller: _passwordController,
              icon: Icons.visibility,
              obscureText: false,
            ),
            CustomInput(
              labeltext: "Repita a Senha",
              controller: _passwordController,
              icon: Icons.visibility,
              obscureText: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              child: CustomButtom(
                onTap: register,
                title: "Cadastrar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
