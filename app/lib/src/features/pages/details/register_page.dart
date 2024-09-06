import 'package:app/src/features/pages/auth/login_page.dart';
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
  // final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final List<String> _typeUsers = ["Atleta", "Treinador", "Organizador"];
  String dropDownValue = "";
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
    dropDownValue = _typeUsers.first;
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
            const CustomTitle(heightdiv: 3.4,),
            const ListTile(
              title: Text("Começe Agora"),
              subtitle: Text("Crie sua conta super rápido"),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: DropdownMenu(
                  initialSelection: dropDownValue,
                  width: MediaQuery.of(context).size.width - 32,
                  inputDecorationTheme: const InputDecorationTheme(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                  menuStyle: const MenuStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  dropdownMenuEntries:
                      _typeUsers.map<DropdownMenuEntry<String>>(
                    (String value) {
                      return DropdownMenuEntry(
                        value: value,
                        label: value,
                      );
                    },
                  ).toList(),
                  onSelected: (String? value) {
                    setState(() {
                      dropDownValue = value!;
                    });
                  }),
            ),
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
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Tem uma conta?",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xFF03045E),
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
