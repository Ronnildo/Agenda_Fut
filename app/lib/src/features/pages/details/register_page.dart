import 'package:app/src/features/pages/auth/login_page.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/custom_input.dart';
import 'package:app/src/features/widgets/custom_title.dart';
import 'package:app/src/features/widgets/dropdown_type.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _userController = TextEditingController();
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomTitle(
              heightdiv: 2.8,
            ),
            ListTile(
              title: Text(
                "Começe Agora",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                "Crie sua conta super rápido",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            ),
            CustomInput(
              hintText: "Nome",
              label: "Nome Completo",
              controller: _nameController,
              icon: Icons.person,
              obscureText: false,
              error: "",
            ),
            CustomInput(
              hintText: "exemplo@gmail.com",
              label: "E-mail",
              controller: _emailController,
              icon: Icons.mail,
              obscureText: false,
              error: "",
            ),
            // const DropDownTypeUser(),
            CustomInput(
              label: "Senha",
              hintText: "Crie sua Senha",
              controller: _passwordController,
              icon: Icons.visibility,
              obscureText: true,
              error: "",
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButtom(
              onTap: register,
              title: "Cadastrar",
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tem uma conta?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}