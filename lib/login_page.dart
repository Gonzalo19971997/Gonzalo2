import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String messageErreur = '';

  @override
  Widget build(BuildContext context) {
    final users =
        ModalRoute.of(context)!.settings.arguments
            as List<Map<String, String>>?;

    return Scaffold(
      appBar: AppBar(title: const Text("Connexion")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bienvenue",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Mot de passe"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_emailController.text == 'admin@gmail.com' &&
                    _passwordController.text == 'admin1234#') {
                  Navigator.pushNamed(context, '/home', arguments: users);
                } else {
                  setState(() => messageErreur = "Identifiants incorrects");
                }
              },
              child: const Text("Se connecter"),
            ),
            const SizedBox(height: 10),
            Text(messageErreur, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
