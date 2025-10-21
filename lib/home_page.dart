import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final users =
        ModalRoute.of(context)!.settings.arguments
            as List<Map<String, String>>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushNamed(context, '/login'),
          ),
        ],
      ),
      body: users == null || users.isEmpty
          ? const Center(child: Text("Aucun utilisateur inscrit."))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),
                    title: Text("${user['prenom']} ${user['nom']}"),
                    subtitle: Text("${user['email']} • ${user['sexe']}"),
                  ),
                );
              },
            ),
    );
  }
}
