import 'package:flutter/material.dart';
import '../components/bottom_nav_bar.dart';

class PageInformations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations du compte'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('Nom :'),
                    subtitle: Text('John'),
                  ),
                  ListTile(
                    title: Text('Prénom :'),
                    subtitle: Text('Doe'),
                  ),
                  ListTile(
                    title: Text('Adresse e-mail :'),
                    subtitle: Text('john.doe@example.com'),
                  ),
                  ListTile(
                    title: Text('Mot de passe :'),
                    subtitle: Text('*********'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Action lorsque l'utilisateur clique sur 'Modifier mes informations'
              },
              child: Text('Modifier mes informations'),
            ),
            Text(
              'Supprimer mon compte',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            // Naviguer vers la page de profil
          }
        },
      ),
    );
  }
}
