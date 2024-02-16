import 'package:flutter/material.dart';
import 'page_information.dart';
import 'page_about_us.dart';
import '../components/bottom_nav_bar.dart';

class PageProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('COMPTE'),
                  ),
                  ListTile(
                    title: Text('Informations'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageInformations()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Commandes'),
                    onTap: () {
                      // Action lorsque l'utilisateur clique sur 'Commandes'
                    },
                  ),
                  ListTile(
                    title: Text('Ordonnances'),
                    onTap: () {
                      // Action lorsque l'utilisateur clique sur 'Ordonnances'
                    },
                  ),
                  ListTile(
                    title: Text('Code PIN'),
                    onTap: () {
                      // Action lorsque l'utilisateur clique sur 'Tableau de bord'
                    },
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text('SUPPORT'),
                  ),
                  ListTile(
                    title: Text('Aide et support'),
                    onTap: () {
                      // Action lorsque l'utilisateur clique sur 'Aide et support'
                    },
                  ),
                  ListTile(
                    title: Text('À propos de nous'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageAboutUs()),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Signaler des bugs'),
                    onTap: () {
                      // Action lorsque l'utilisateur clique sur 'Signaler des bugs'
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Action lorsque l'utilisateur clique sur 'Déconnexion'
              },
              child: Text('Déconnexion'),
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
