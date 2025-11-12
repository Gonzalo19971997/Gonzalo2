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
      appBar: AppBar(
        title: const Text("Inscription"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 400, // 💡 Le formulaire ne prend pas toute la largeur
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Créer un compte",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Champs de saisie
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Nom"),
                    validator: (value) =>
                        value!.isEmpty ? "Entrez votre nom" : null,
                    onSaved: (v) => nom = v,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Prénom"),
                    validator: (value) =>
                        value!.isEmpty ? "Entrez votre prénom" : null,
                    onSaved: (v) => prenom = v,
                  ),
                  const SizedBox(height: 12),
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
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Adresse"),
                    validator: (value) =>
                        value!.isEmpty ? "Entrez votre adresse" : null,
                    onSaved: (v) => adresse = v,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (value) =>
                        value!.isEmpty ? "Entrez votre email" : null,
                    onSaved: (v) => email = v,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Mot de passe",
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "Entrez un mot de passe" : null,
                    onSaved: (v) => motDePasse = v,
                  ),

                  const SizedBox(height: 25),

                  // Bouton S'inscrire
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
                          const SnackBar(
                            content: Text("Inscription réussie !"),
                          ),
                        );
                        Navigator.pushNamed(
                          context,
                          '/login',
                          arguments: _users,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Lien vers connexion
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: const Text("Déjà un compte ? Connectez-vous"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
