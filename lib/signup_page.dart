import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _users = [];
  String? nom, prenom, sexe, adresse, email, motDePasse;
  final List<String> sexes = ['Masculin', 'Féminin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inscription")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Créer un compte",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: "Nom"),
                validator: (value) =>
                    value!.isEmpty ? "Entrez votre nom" : null,
                onSaved: (v) => nom = v,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Prénom"),
                validator: (value) =>
                    value!.isEmpty ? "Entrez votre prénom" : null,
                onSaved: (v) => prenom = v,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: sexe,
                items: sexes
                    .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                    .toList(),
                onChanged: (value) => setState(() => sexe = value),
                decoration: const InputDecoration(labelText: "Sexe"),
                validator: (value) =>
                    value == null ? "Choisissez un sexe" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Adresse"),
                validator: (value) =>
                    value!.isEmpty ? "Entrez votre adresse" : null,
                onSaved: (v) => adresse = v,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) =>
                    value!.isEmpty ? "Entrez votre email" : null,
                onSaved: (v) => email = v,
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: "Mot de passe"),
                validator: (value) =>
                    value!.isEmpty ? "Entrez votre mot de passe" : null,
                onSaved: (v) => motDePasse = v,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _users.add({
                      'nom': nom!,
                      'prenom': prenom!,
                      'sexe': sexe!,
                      'adresse': adresse!,
                      'email': email!,
                      'motDePasse': motDePasse!,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Inscription réussie !")),
                    );
                    Navigator.pushNamed(context, '/login', arguments: _users);
                  }
                },
                child: const Text("S'inscrire"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
