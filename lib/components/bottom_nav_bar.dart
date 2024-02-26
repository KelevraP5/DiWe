import 'package:flutter/material.dart';

import 'package:diwe_flutter/pages/home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          label : 'Accueil',
          icon : const Icon(Icons.home),
        ),

        BottomNavigationBarItem(
          label : 'Repas',
          icon : Icon(Icons.add_a_photo),
        ),

        BottomNavigationBarItem(
          label : 'SAV',
          icon : Icon(Icons.list),
        ),

        BottomNavigationBarItem(
          label : 'Commandes',
          icon : Icon(Icons.add_shopping_cart),
        ),
      ],
    );
  }
}
